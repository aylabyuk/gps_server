import GraphQLToolsTypes from 'graphql-tools-types';
import { db } from '../../sql/connector'

const Op = db.Op

export default {
    Query: {
        singleStaff: (parent, args, { models }) => {
            return models.Person.findById(args.id, { 
                where: { position_id: { [Op.ne]: null } }, 
                include: [{ all: true }] })
        },
        allStaff: (parent, args, { models }) => {
            return models.Person.findAll({
                where: { position_id: { [Op.ne]: null } }, 
                include: [{ all: true }] 
            })
        }
    },
    Date: GraphQLToolsTypes.Date({ name: 'Date' }),
    Staff: {
        email(person) {
            return person.getEmails()   
        },
        contactNumber(person) {
            return person.getContactNumbers()
        }
    }
}