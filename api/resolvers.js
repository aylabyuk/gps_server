import * as m from '../sql/connector';

import { GraphQLScalarType } from 'graphql';
import GraphQLToolsTypes from 'graphql-tools-types';
import sequelize from 'sequelize'
import { PubSub } from 'graphql-subscriptions';

import { getnewPath } from './fsmodule'

export const pubsub = new PubSub

const resolvers = {
  Mutation: {
  },
  Subscription: {
  },
  Query: {
  }
};


export default resolvers;
