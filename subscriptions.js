import { PubSub, SubscriptionManager } from 'graphql-subscriptions';
import { executableSchema } from './server';

const pubsub = new PubSub();
const subscriptionManager = new SubscriptionManager({
  schema: executableSchema,
  pubsub,
  setupFunctions: {
    contactCreated: () => ({
      contactCreated: () => true,
    }),
  },
});
export { subscriptionManager, pubsub };
