import express from 'express';
import bodyParser from 'body-parser';
import { SubscriptionServer } from 'subscriptions-transport-ws';
import schema from './api/schema';
import { execute, subscribe } from 'graphql';
import http from 'http';
import cors from 'cors';
import index from './api_router'
import jwt from 'jsonwebtoken'

// Hot reloadable modules
const graphiqlMiddleware = require('./middleware/graphiql').default;
const graphqlMiddleware = require('./middleware/graphql').default;
const uploadServerMiddleware = require('./middleware/upload').default;

import { refreshTokens } from './api/auth';

const app = express();

const env = process.env.NODE_ENV || 'prod';
let port;

if (env === 'dev') {
  port = process.env.PORT || 4040;
} else {
  port = process.env.PORT || 4000;
}

// app secret
export const SECRET = 'jskdaskdujhaskjdhn3487230409849abfikwkasbjkj';

// Don't rate limit heroku
app.enable('trust proxy');

// FIXES CORS ERROR
const whitelist = [
  'http://192.168.50.101:8000',
  'http://192.168.8.102:8000',
  'http://192.168.1.200:8000', // prod
  'http://gps-toto-pc:8000', // prod
  'http://192.168.1.200:8080', // dev
  'http://localhost:8080',
  'http://localhost:8000',
  'http://gpsteam.herokuapp.com',
];
const corsOptions = {
  origin(origin, callback) {
    const originIsWhitelisted = whitelist.indexOf(origin) !== -1;
    callback(null, originIsWhitelisted);
  },
  credentials: true,
};
app.use(cors(corsOptions));
// app.use(cors('*'))


// implement tokens and refresh-tokens checks 
const addUser = async (req, res, next) => {
  const token = req.headers['x-token'];
  if (token) {
    try {
      const { user } = jwt.verify(token, SECRET);
      req.user = user;
    } catch (err) {
      const refreshToken = req.headers['x-refresh-token'];
      const newTokens = await refreshTokens(
        token,
        refreshToken,
        SECRET,
      );
      if (newTokens.token && newTokens.refreshToken) {
        res.set('Access-Control-Expose-Headers', 'x-token, x-refresh-token');
        res.set('x-token', newTokens.token);
        res.set('x-refresh-token', newTokens.refreshToken);
      }
      req.user = newTokens.user;
    }
  }
  next();
};

app.use(addUser);

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.use((...args) => uploadServerMiddleware(...args));
app.use('/graphql', (...args) => graphqlMiddleware(...args));
app.use('/graphiql', (...args) => graphiqlMiddleware(...args));
app.use('/line', index);

app.use(express.static('gpsUPLOADS'))

let server = http.createServer(app);

server.listen(port, () => {

  new SubscriptionServer({
    execute,
    subscribe,
    schema
  }, {
    server,
    path: '/',
  })

  console.log(`API is now running on port ${port}`);
});

server.on('close', () => {
  server = undefined;
});

