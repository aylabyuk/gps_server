import GraphQLToolsTypes from 'graphql-tools-types';

export default {
    Query: {
        singlePerson: (parent, args, { models }) => {
            return models.Person.findById(args.id, { include: [{ all: true }] })
        },
        allPerson: (parent, args, { models }) => {
            return models.Person.findAll({ include: [{ all: true }] })
        }
    },
    Date: GraphQLToolsTypes.Date({ name: 'Date' }),
}