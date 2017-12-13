import express from 'express'
import graphqlHTTP from 'express-graphql'
import { getSchema } from './graphql-sequelize-crud-aylabyuk/src'
// import { getSchema } from 'graphql-sequelize-crud'
import { db as sequelize} from './sql/connector'
import jwt from 'jsonwebtoken'
import { request } from 'https';
import { customSchema } from './customSchema/index'
import { mergeSchemas } from 'graphql-tools'
import { refreshTokens } from './helpers/auth'

import { requiresAuth, requiresStaff, requiresAdmin } from './helpers/permission'

const expressPlayground = require('graphql-playground-middleware-express').default

const app = express();

// app secret
export const SECRET = 'jskdaskdujhaskjdhn3487230409849abfikwkasbjkj';

// implement tokens and refresh-tokens checks 
const addUser = async (req, res, next) => {
    const token = req.headers['x-token'];
    if (token) {
        try {
            const { user } = jwt.verify(token, SECRET);
            req.user = user;
            console.log('SUCCESS JWT: ', user)
        } catch (err) {
            console.log('ERROR JWT', err)
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
    } else {
        req.user = {}
    }
    next();
};
  
app.use(addUser);

sequelize.sync({
    // force: true
}).then(() => {

    const schema = getSchema(sequelize, {
        accessLevels: {
            before: requiresStaff
        },
        accessLevel: {
            before: requiresAdmin
        },
        createAccessLevel: {
            before: requiresStaff
        },
        updateAccessLevels: {
            before: requiresStaff
        },
        updateAccessLevel: {
            before: requiresStaff
        },
        deleteAccessLevels: {
            before: requiresStaff
        },
        deleteAccessLevel: {
            before: requiresStaff
        }
    })

    let merged = mergeSchemas({
        schemas: [schema, customSchema]
    })

    app.use('/graphql', graphqlHTTP((req) => ({
        schema: merged,
        graphiql: true,
        context: {
            SECRET,
            user: req.user
        }
    })));

    app.get('/playground', expressPlayground({ endpoint: '/graphql' }));

    const port = 4000;

    app.listen(port, () => {
        console.log(`Listening on port ${port}`)
    })
    
})