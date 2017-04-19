import { Sitename,
          Contact,
          Antenna,
          Receiver,
          Staff,
          Logsheet,
          Division,
          Position,
          Email,
          ContactNumber,
          FieldWork,
          Team,
      } from '../sql/connector';

import { pubsub } from './schema';
import { GraphQLScalarType } from 'graphql';
import { Kind } from 'graphql/language';

const resolvers = {
  Mutation: {
    createContact(_, args) {
      return Contact.create(args)
        .then((newcontact) => {
          pubsub.publish('contactCreated', newcontact.dataValues);
          return newcontact;
        }).catch(err => {
          console.error(err);
          return err;
        });
    },
    // createLogSheet(_, args) {
    //   return Logsheet.create(args)
    //      .then((newlogsheet) => {
    //        pubsub.publish('logsheetCreated', newlogsheet.dataValues);
    //        return newlogsheet;
    //      }).catch(err => {
    //        console.error(err);
    //        return err;
    //      });
    // },
    deleteContact(_, args) {
      return Contact.destroy({ where: args })
        .then((success) => {
          console.log('success', success);
          console.log('id', args);
          pubsub.publish('contactDeleted', args);
          return args.id;
        });
    },
    createStaff(_, args) {
      return Staff.create(args.input)
        .then((newstaff) => {
          // save emails
          args.input.emails.map((x) => {
            Email.create({
              staffId: newstaff.dataValues.id,
              address: x.address,
            });
          });
          // save numbers
          args.input.contact_numbers.map((x) => {
            ContactNumber.create({
              staffId: newstaff.dataValues.id,
              number: x.number,
            });
          });
          // construct data
          const olddata = newstaff.dataValues;
          const pos = Position.find({ where: olddata.positionId });
          const div = Division.find({ where: olddata.divisionId });

          const data = { ...olddata, position: pos, division: div };

          pubsub.publish('staffCreated', data);
          return data;
        }).catch(err => {
          console.error(err);
          return err;
        });
    },
  },
  Subscription: {
    contactDeleted(args) {
      console.log('contact deleted with id ', args.id);
      return args.id;
    },
    contactCreated(contact) {
      console.log('new contact created', contact);
      return contact;
    },
    logsheetCreated(logsheet) {
      console.log('new logsheet created', logsheet);
      return logsheet;
    },
    staffCreated(staff) {
      console.log('new staff created', staff);
      return staff;
    },
  },
  Query: {
    Sitename(_, args) {
      return Sitename.find({ where: args });
    },
    allSitename(_, args) {
      return Sitename.findAll({ limit: args.limit, offset: args.offset });
    },
    Contact(_, args) {
      return Contact.find({ where: args });
    },
    allContact(_, args) {
      return Contact.findAll({ limit: args.limit, offset: args.offset, order: args.order });
    },
    Antenna(_, args) {
      return Antenna.find({ where: args });
    },
    allAntenna() {
      return Antenna.findAll();
    },
    Receiver(_, args) {
      return Receiver.find({ where: args });
    },
    allReceiver() {
      return Receiver.findAll();
    },
    Staff(_, args) {
      return Staff.find({ where: args });
    },
    allStaff() {
      return Staff.findAll({
        include: [{ all: true }],
      });
    },
    Logsheet(_, args) {
      return Logsheet.find({ where: args });
    },
    allLogsheet() {
      return Logsheet.findAll({
        include: [{ all: true }],
      });
    },
    Division(_, args) {
      return Division.find({ where: args });
    },
    allDivision() {
      return Division.findAll();
    },
    Position(_, args) {
      return Position.find({ where: args });
    },
    allPosition() {
      return Position.findAll();
    },
// input more query at the top of this comment
  },
  Date: new GraphQLScalarType({
    name: 'Date',
    description: 'Date custom scalar type',
    parseValue(value) {
      return new Date(value);
    },
    serialize(value) {
      return value.getTime();
    },
    parseLiteral(ast) {
      if (ast.kind === Kind.INT) {
        return parseInt(ast.value, 10);
      }
      return null;
    },
  }),
  Time: new GraphQLScalarType({
    name: 'Time',
    description: 'Date custom scalar type',
    parseValue(value) {
      return new Date(value).getTime();
    },
    serialize(value) {
      return value;
    },
    parseLiteral(ast) {
      if (ast.kind === Kind.INT) {
        return parseInt(ast.value, 10);
      }
      return null;
    },
  }),
};


export default resolvers;
