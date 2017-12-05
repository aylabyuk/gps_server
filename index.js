import express from 'express'
import graphqlHTTP from 'express-graphql'
import { getSchema, ModelTypes } from 'graphql-sequelize-crud'
import { db as sequelize} from './sql/connector'

const expressPlayground = require('graphql-playground-middleware-express').default

const app = express();

sequelize.sync({
    // force: true
}).then(() => {
    const schema = getSchema(sequelize);

    app.use('/graphql', graphqlHTTP({
        schema,
        graphiql: true
    }));

    app.get('/playground', expressPlayground({ endpoint: '/graphql' }));

    const port = 4000;

    app.listen(port, () => {
        console.log(`Listening on port ${port}`)
    })

})
