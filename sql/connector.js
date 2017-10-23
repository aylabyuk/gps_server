import Sequelize from 'sequelize';

let db = null;

const env = process.env.NODE_ENV || 'prod';
let dbname;

if (env === 'dev') {
  dbname = 'gpsdb_rev';
} else {
  dbname = 'gpsdb_rev';
}

db = new Sequelize(dbname, 'gps', 'thisisthegpsteam', {
  dialect: 'mysql',
  host: 'localhost',
  port: '3306',
});

// set models
export const AccessLevel = db.import("./models/access_levels")
export const AntennaModel = db.import("./models/antenna_models")
export const Antenna = db.import("./models/antennas")
export const CampaignLogsheet = db.import("./models/campaign_logsheets")
export const CampaignObserver = db.import("./models/campaign_observers")
export const ContactNumber = db.import("./models/contact_numbers")
export const ContinuousLogsheet = db.import("./models/continuous_logsheets")
export const ContinuousObserver = db.import("./models/continuous_observers")
export const Division = db.import("./models/divisions")
export const Email = db.import("./models/emails")
export const EquipmentBrand = db.import("./models/equipment_brands")
export const Marker = db.import("./models/markers")
export const NonStaffPosition = db.import("./models/non_staff_positions")
export const OfficeLocation = db.import("./models/office_locations")
export const Person = db.import("./models/people")
export const PersonType = db.import("./models/person_types")
export const Position = db.import("./models/positions")
export const ReceiverModel = db.import("./models/receiver_models")
export const Receiver = db.import("./models/receivers")
export const Site = db.import("./models/sites")
export const SurveyType = db.import("./models/survey_types")
export const User = db.import("./models/users")

// set relationships

// user management
AccessLevel.belongsTo(User)


// uncommment this lines below to create the database tables
db.sync({
  logging: console.log,
  // warning: setting force to true will delete all the data
  // make backup of the database first
  // only enable force to true if you know what you are doing.
  force: true,
});