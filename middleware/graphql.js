import { graphqlExpress } from 'graphql-server-express';

import schema from '../api/schema';

export default graphqlExpress(() => {
  return {
    schema,
    context: {},
  };
});
