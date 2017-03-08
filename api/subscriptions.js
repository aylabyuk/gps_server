import { SubscriptionManager } from 'graphql-subscriptions';
import schema, { pubsub } from './schema';

const subscriptionManager = new SubscriptionManager({
  schema,
  pubsub,
});

export { subscriptionManager, pubsub };
