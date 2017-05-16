import { graphqlExpress } from 'graphql-server-express';

import schema from '../api/schema';
// import Count from '../sql/count'

export default graphqlExpress(() => {
  return {
    schema,
    context: {},
  };
});
