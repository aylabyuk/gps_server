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
    createLogsheet(_, args) {
      return Logsheet.create(args.input)
         .then((newlogsheet) => {
           // query staffs and add it to logsheet as observers
           Staff.findAll({
             where: { id: { $in: args.input.observers.map((a) => { return a.id; }) } },
           }).then((staffs) => {
             newlogsheet.setStaffs(staffs);
           });
           pubsub.publish('logsheetCreated', newlogsheet.dataValues);
           return newlogsheet;
         })
         .catch(err => {
           console.error(err);
           return err;
         });
    },
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
          Position.find({
            where: { id: newstaff.dataValues.positionId },
          }).then((pos) => {
            newstaff.setPosition(pos);
          });

          Division.find({
            where: { id: newstaff.dataValues.divisionId },
          }).then((div) => {
            newstaff.setDivision(div);
          });

          args.input.emails.map((x) => {
            return (
                Email.create({
                  staffId: newstaff.dataValues.id,
                  address: x.address,
                })
            );
          });

          args.input.contact_numbers.map((x) => {
            return (
              ContactNumber.create({
                staffId: newstaff.dataValues.id,
                number: x.number,
              })
            );
          });

          pubsub.publish('staffCreated', newstaff.dataValues);
          return newstaff;
        })
        .catch(err => {
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
    allSitename() {
      return Sitename.findAll();
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
    allStaff() {
      return Staff.findAll({
        include: [{ all: true }],
      });
    },
    allLogsheet() {
      return Logsheet.findAll({
        include: [{ all: true }],
      });
    },
    allDivision() {
      return Division.findAll();
    },
    allPosition() {
      return Position.findAll();
    },
// input more query at the top of this comment
  },
  Logsheet: {
    observers(logsheet) {
      return logsheet.getStaffs();
    },
    site(logsheet) {
      return logsheet.getSite_name();
    },
    contact(logsheet) {
      return logsheet.getContact_person();
    },
  },
  Staff: {
    emails(staff) {
      return staff.getEmails();
    },
    contact_numbers(staff) {
      return staff.getContact_numbers();
    },
    division(staff) {
      return staff.getDivision();
    },
    position(staff) {
      return staff.getPosition();
    },
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
