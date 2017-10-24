import { graphqlExpress } from 'graphql-server-express';

import schema from '../api/schema';
import * as models from '../sql/connector'

export default graphqlExpress(() => {
  return {
    schema,
    context: { models },
  };
});
