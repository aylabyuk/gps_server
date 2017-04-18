import Sequelize from 'sequelize';
let db = null;

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
    db = new Sequelize('gpsdb', 'root', '', {
      host: 'localhost',
      port: '3306',
    });
  }
}

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
  fieldwork_id: { type: Sequelize.INTEGER },
  survey_type: { type: Sequelize.STRING, allowNull: false },
  logsheet_date: { type: Sequelize.DATE, allowNull: false },
  julian_day: { type: Sequelize.INTEGER, allowNull: false },
  marker: { type: Sequelize.STRING, allowNull: false },
  height: { type: Sequelize.DOUBLE },
  north: { type: Sequelize.DOUBLE },
  east: { type: Sequelize.DOUBLE },
  south: { type: Sequelize.DOUBLE },
  west: { type: Sequelize.DOUBLE },
  time_start: { type: Sequelize.TIME },
  time_end: { type: Sequelize.TIME },
  azimuth: { type: Sequelize.INTEGER },
  failure_time: { type: Sequelize.TIME },
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

const Sitename = db.models.site_name;
const Contact = db.models.contact_person;
const Antenna = db.models.antenna;
const Receiver = db.models.receiver;
const Staff = db.models.staff;
const Logsheet = db.models.logsheet;
const Division = db.models.division;
const Position = db.models.position;
const Email = db.models.email;
const ContactNumber = db.models.contact_number;

// relationships
Staff.belongsTo(Position);
Staff.belongsTo(Division);
Staff.hasMany(Email);
Staff.hasMany(ContactNumber);

Logsheet.belongsToMany(Staff, { through: 'Observer' });
Staff.belongsToMany(Logsheet, { through: 'Observer' });
Logsheet.belongsTo(Sitename);
Logsheet.belongsTo(Antenna, { targetKey: 'serial_number' });
Logsheet.belongsTo(Receiver, { targetKey: 'serial_number' });
Contact.belongsToMany(Logsheet, { through: 'LogsheetContact' });

// uncommment this lines below to create the database tables
db.sync({
  logging: console.log,
  // warning: setting force to true will delete all the data!
  force: true,
});

export {
  Sitename,
  Contact,
  Antenna,
  Receiver,
  Staff,
  Logsheet,
  Division,
  Position,
  Email,
  ContactNumber,
};

