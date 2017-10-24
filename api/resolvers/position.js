export default {
    Query: {
        singlePosition: (parent, args, { models }) => {
            return models.Position.findById(args.id, { include: [{ all: true }] })
        },
        allPosition: (parent, args, { models }) => {
            return models.Position.findAll({ include: [{ all: true }] })
        }
    },
    Position: {
        staff(position) {
            return position.getPeople()
        }
    }
}