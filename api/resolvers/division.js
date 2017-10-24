export default {
    Query: {
        singleDivision: (parent, args, { models }) => {
            return models.Division.findById(args.id, { include: [{ all: true }] })
        },
        allDivision: (parent, args, { models }) => {
            return models.Division.findAll({ include: [{ all: true }] })
        }
    }
}