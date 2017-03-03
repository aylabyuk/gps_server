import { createServer } from 'http';
import { Server } from 'subscriptions-transport-ws';
import { subscriptionManager } from './subscriptions';

const WS_PORT = process.env.WS_PORT || 5000;

const httpServer = createServer((request, response) => {
  response.writeHead(404);
  response.end();
});

httpServer.listen(WS_PORT, () => console.log(
  `Websocket Server is now running on http://localhost:${WS_PORT}`
));

export const server = new Server({ subscriptionManager }, httpServer);

