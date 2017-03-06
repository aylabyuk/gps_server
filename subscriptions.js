import { PubSub, SubscriptionManager } from 'graphql-subscriptions';
import { executableSchema as schema } from './server';

const pubsub = new PubSub();
const subscriptionManager = new SubscriptionManager({
  schema,
  pubsub,
});
export { subscriptionManager, pubsub };
