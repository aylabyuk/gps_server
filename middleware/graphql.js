import { graphqlExpress } from 'graphql-server-express';

import schema from '../api/schema';
import { SECRET } from '../api_server';

export default graphqlExpress(() => {
  return {
    schema,
    context: {
      SECRET
    },
  };
});
