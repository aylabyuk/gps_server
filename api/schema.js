import { makeExecutableSchema } from 'graphql-tools';
import { PubSub } from 'graphql-subscriptions';

import schema from './graphSchema';
import resolvers from './resolvers';


export const pubsub = new PubSub();

const executableSchema = makeExecutableSchema({
  typeDefs: schema,
  resolvers,
});

export default executableSchema;
