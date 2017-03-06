import { createServer } from 'http';
import { subscriptionManager } from './subscriptions';
import { SubscriptionServer } from 'subscriptions-transport-ws';

const WS_PORT = 5000;

const websocketServer = createServer((request, response) => {
  response.writeHead(404);
  response.end();
});

websocketServer.listen(WS_PORT, () => console.log(
  `Websocket Server is now running on http://localhost:${WS_PORT}`
));

export const server = new SubscriptionServer(
  {
    subscriptionManager },
  {
    server: websocketServer,
    path: '/',
  }
);

