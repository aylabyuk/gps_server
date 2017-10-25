import { graphqlExpress } from 'graphql-server-express';

import schema from '../api/schema';
import * as models from '../sql/connector'
import { SECRET } from '../api_server';

export default graphqlExpress((req) => {
  return {
    schema,
    context: { 
      models,
      SECRET,
      user: req.user
    },
  };
});
