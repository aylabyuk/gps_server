import Sequelize from 'sequelize';
let db = null;

const env = process.env.NODE_ENV || 'prod';
let dbname;

if (env === 'dev') {
  dbname = 'gpsdb_dev';
} else {
  dbname = 'gpsdb';
}

if (!global.hasOwnProperty('db')) {
  if (process.env.HEROKU_POSTGRESQL_WHITE_URL) {
    // the application is executed on Heroku ... use the postgres database
    db = new Sequelize(process.env.HEROKU_POSTGRESQL_WHITE_URL, {
      dialect: 'postgres',
      protocol: 'postgres',
      port: 5432,
      host: 'ec2-23-21-219-105.compute-1.amazonaws.com',
      logging: true, // false
    });
  } else {
    // the application is executed on the local machine ... use mysql
    db = new Sequelize(dbname, 'root', '', {
      host: 'localhost',
      port: '3306',
    });
  }
}

const SiteDetailsModel = db.define('site_detail', {
  marker: { type: Sequelize.STRING },
  constructed: { type: Sequelize.DATE },
  survey_type: { type: Sequelize.STRING },
});

const LocationModel = db.define('location', {
  long: { type: Sequelize.STRING },
  lat: { type: Sequelize.STRING },
  address: { type: Sequelize.STRING },
  description: { type: Sequelize.STRING },
});

const FileUploadModel = db.define('file_upload', {
  description: { type: Sequelize.STRING },
  name: { type: Sequelize.STRING },
  type: { type: Sequelize.STRING },
  size: { type: Sequelize.INTEGER },
  path: { type: Sequelize.STRING },
});

const SiteNameModel = db.define('site_name', {
  site_name: { type: Sequelize.STRING, unique: true, allowNull: false },
});

const ContactModel = db.define('contact_person', {
  first_name: { type: Sequelize.STRING, allowNull: false },
  last_name: { type: Sequelize.STRING, allowNull: false },
  position: { type: Sequelize.STRING },
  contact_number: { type: Sequelize.STRING, allowNull: false },
  organization: { type: Sequelize.STRING },
  email_add: { type: Sequelize.STRING, unique: true },
  address_one: { type: Sequelize.STRING },
  address_two: { type: Sequelize.STRING },
  city: { type: Sequelize.STRING },
  province: { type: Sequelize.STRING },
});

const AntennaModel = db.define('antenna', {
  serial_number: { type: Sequelize.STRING, unique: true, allowNull: false },
  part_number: { type: Sequelize.STRING, allowNull: false },
  type: { type: Sequelize.STRING, allowNull: false },
});

const ReceiverModel = db.define('receiver', {
  serial_number: { type: Sequelize.STRING, unique: true, allowNull: false },
  type: { type: Sequelize.STRING, allowNull: false },
  part_number: { type: Sequelize.STRING, allowNull: false },
});

const StaffModel = db.define('staff', {
  first_name: { type: Sequelize.STRING, allowNull: false },
  last_name: { type: Sequelize.STRING, allowNull: false },
  nickname: { type: Sequelize.STRING, allowNull: false },
  office_location: { type: Sequelize.STRING, allowNull: false },
  birthday: { type: Sequelize.DATE, allowNull: true },
});

const EmailModel = db.define('email', {
  address: { type: Sequelize.STRING, allowNull: true },
});

const ContactNumberModel = db.define('contact_number', {
  number: { type: Sequelize.STRING, allowNull: true },
});

const LogsheetModel = db.define('logsheet', {
  survey_type: { type: Sequelize.STRING, allowNull: false },
  logsheet_date: { type: Sequelize.DATE, allowNull: false },
  julian_day: { type: Sequelize.INTEGER, allowNull: false },
  location: { type: Sequelize.STRING, allowNull: false },
  marker: { type: Sequelize.STRING, allowNull: false },
  north: { type: Sequelize.DOUBLE },
  east: { type: Sequelize.DOUBLE },
  south: { type: Sequelize.DOUBLE },
  west: { type: Sequelize.DOUBLE },
  time_start: { type: Sequelize.STRING },
  time_end: { type: Sequelize.STRING },
  azimuth: { type: Sequelize.INTEGER },
  failure_time: { type: Sequelize.STRING },
  receiver_status: { type: Sequelize.STRING },
  antenna_status: { type: Sequelize.STRING },
  rod_num: { type: Sequelize.INTEGER },
  rod_correction: { type: Sequelize.INTEGER },
  avg_slant_height: { type: Sequelize.DOUBLE },
  ip_add: { type: Sequelize.STRING },
  netmask: { type: Sequelize.STRING },
  gateway: { type: Sequelize.STRING },
  dns: { type: Sequelize.STRING },
  local_tcp_port: { type: Sequelize.STRING },
  latitude: { type: Sequelize.DOUBLE },
  longitude: { type: Sequelize.DOUBLE },
  observed_situation: { type: Sequelize.STRING },
  lodging_road_information: { type: Sequelize.STRING },
  others: { type: Sequelize.STRING },
});

const DivisionModel = db.define('division', {
  division_name: { type: Sequelize.STRING, allowNull: false },
});

const PositionModel = db.define('position', {
  position_name: { type: Sequelize.STRING, allowNull: false },
});

const FieldWorkModel = db.define('fieldwork', {
  year: { type: Sequelize.INTEGER, allowNull: false },
  month: { type: Sequelize.STRING, allowNull: false },
  description: { type: Sequelize.STRING, allowNull: false },
});

// staff, contactnumber, email, division, position relationships
StaffModel.belongsTo(PositionModel);
StaffModel.belongsTo(DivisionModel);
StaffModel.hasMany(EmailModel);
StaffModel.hasMany(ContactNumberModel);

// logsheet, receiver, antennam, staff, contact, sitename relationships
LogsheetModel.belongsToMany(StaffModel, { through: 'observer' });
StaffModel.belongsToMany(LogsheetModel, { through: 'observer' });
LogsheetModel.belongsTo(SiteNameModel);
LogsheetModel.belongsTo(AntennaModel, { targetKey: 'serial_number' });
LogsheetModel.belongsTo(ReceiverModel, { targetKey: 'serial_number' });
SiteNameModel.hasMany(LogsheetModel);
LogsheetModel.belongsTo(ContactModel, { targetKey: 'id' });

// logsheet, fieldwork relationship
FieldWorkModel.hasMany(LogsheetModel);
StaffModel.belongsToMany(FieldWorkModel, { through: 'fieldwork_staff' });
FieldWorkModel.belongsToMany(StaffModel, { through: 'fieldwork_staff' });

// sitedetail, sitename, location relationships
SiteDetailsModel.belongsTo(SiteNameModel, { targetKey: 'site_name', as: 'name' });
SiteDetailsModel.belongsTo(SiteNameModel, { targetKey: 'site_name', as: 'other_name' });
SiteDetailsModel.hasOne(LocationModel);
ContactModel.belongsTo(SiteDetailsModel);
SiteDetailsModel.hasMany(FileUploadModel);


// uncommment this lines below to create the database tables
db.sync({
  logging: console.log,
  // warning: setting force to true will delete all the data
  // make backup of the database first
  // only enable force to true if you know what you are doing.
  // force: true,
});

const Sitename = db.models.site_name;
const SiteDetail = db.models.site_detail;
const FileUpload = db.models.file_upload;
const Location = db.models.location;
const Contact = db.models.contact_person;
const Antenna = db.models.antenna;
const Receiver = db.models.receiver;
const Staff = db.models.staff;
const Logsheet = db.models.logsheet;
const Division = db.models.division;
const Position = db.models.position;
const Email = db.models.email;
const ContactNumber = db.models.contact_number;
const FieldWork = db.models.fieldwork;

export {
  Sitename,
  SiteDetail,
  FileUpload,
  Location,
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
};

