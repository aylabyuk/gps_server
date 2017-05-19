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
      console.log('args', args.input);

      return Logsheet.create(args.input)
         .then((newlogsheet) => {
           // query staffs and add it to logsheet as observers
           // NOTE: need to fix async
           Staff.findAll({
             where: { id: { $in: args.input.observers.map((a) => { return a.id; }) } },
           }).then((staffs) => {
             newlogsheet.setStaffs(staffs);
           });

           pubsub.publish('logsheetCreated', newlogsheet);
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
      return Staff.create(args.input, {
        include: [Email, ContactNumber],
      })
      .then((newstaff) => {
        pubsub.publish('staffCreated', newstaff);
        return newstaff;
      })
      .catch(err => {
        console.error(err);
        return err;
      });
    },
    createSitename(_, args) {
      return Sitename.create(args.input)
      .then((newsite) => {
        return newsite;
      })
      .catch(err => {
        console.error(err);
        return err;
      });
    },
    createReceiver(_, args) {
      return Receiver.create(args.input)
      .then((newReceiver) => {
        return newReceiver;
      })
      .catch(err => {
        console.error(err);
        return err;
      });
    },
    createAntenna(_, args) {
      return Antenna.create(args.input)
      .then((newAntenna) => {
        return newAntenna;
      })
      .catch(err => {
        console.error(err);
        return err;
      });
    },
    createFieldwork(_, args) {
      return FieldWork.create(args.input)
      .then((newFieldwork) => {
        Staff.findAll({
          where: { id: { $in: args.input.staffs.map((a) => { return a.id; }) } },
        }).then((staffs) => {
          newFieldwork.setStaffs(staffs);
        });

        return newFieldwork;
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
    allSitename(_, args) {
      return Sitename.findAll({ limit: args.limit, offset: args.offset, order: args.order });
    },
    sitesWithLogsheet() {
      return Sitename.findAll({
        where: {
          '$logsheets.survey_type$': 'CAMPAIGN',
        },
        include: [
          Logsheet,
        ],
      });
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
    allStaff(_, args) {
      return Staff.findAll({
        include: [{ all: true }],
        order: args.order,
      });
    },
    allLogsheet() {
      return Logsheet.findAll({
        include: [{ all: true }],
      });
    },
    singleLogsheet(_, args) {
      return Logsheet.find({ where: args });
    },
    allDivision() {
      return Division.findAll();
    },
    allPosition() {
      return Position.findAll();
    },
    allFieldWork() {
      return FieldWork.findAll({
        include: [{ all: true }],
      });
    },
// input more query at the top of this comment
  },
  Sitename: {
    logsheets(sitename) {
      return sitename.getLogsheets();
    },
  },
  Logsheet: {
    antenna(logsheet) {
      return logsheet.getAntenna();
    },
    receiver(logsheet) {
      return logsheet.getReceiver();
    },
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
      return value;
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
    description: 'Time custom scalar type',
    parseValue(value) {
      return new Date(value);
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
