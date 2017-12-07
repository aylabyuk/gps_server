import { makeExecutableSchema } from 'graphql-tools'
import { typeDefs } from './schema'
import { resolvers } from './resolvers'

export default schema = makeExecutableSchema({
    typeDefs,
    resolvers
})