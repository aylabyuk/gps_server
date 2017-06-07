import express from 'express';
import bodyParser from 'body-parser';
import { SubscriptionServer } from 'subscriptions-transport-ws';
import http from 'http';
import cors from 'cors';

// Hot reloadable modules
const graphiqlMiddleware = require('./middleware/graphiql').default;
const graphqlMiddleware = require('./middleware/graphql').default;
const uploadServerMiddleware = require('./middleware/upload').default;
const subscriptionManager = require('./api/subscriptions').subscriptionManager;

let server;

const app = express();

const env = process.env.NODE_ENV || 'prod';
let port;

if (env === 'dev') {
  port = process.env.PORT || 4040;
} else {
  port = process.env.PORT || 4000;
}

// Don't rate limit heroku
app.enable('trust proxy');

// FIXES CORS ERROR
const whitelist = [
  'http://192.168.1.205:8000', // prod
  'http://gps-toto-pc:8000', // prod
  'http://192.168.40.205:8080', // dev
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

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.use((...args) => uploadServerMiddleware(...args));
app.use('/graphql', (...args) => graphqlMiddleware(...args));
app.use('/graphiql', (...args) => graphiqlMiddleware(...args));

server = http.createServer(app);

const subscriptionServerConfig = {
  server,
  path: '/',
};

let subscriptionServer = new SubscriptionServer({
  subscriptionManager,
}, subscriptionServerConfig);

server.listen(port, () => {
  console.log(`API is now running on port ${port}`);
});

server.on('close', () => {
  server = undefined;
});
