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
    db = new Sequelize('gps_db', 'root', '', {
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

const PowerSourceModel = db.define('power_source', {
  ps_serial_number: { type: Sequelize.STRING, unique: true },
  comment: { type: Sequelize.TEXT },
});

const AssociatedAgencyModel = db.define('associated_agency', {
  associated_name: { type: Sequelize.STRING },
});

const FieldWorkModel = db.define('fieldwork', {
  first_date: { type: Sequelize.DATE },
  last_date: { type: Sequelize.DATE },
  logistical_note_id: { type: Sequelize.INTEGER },
  others: { type: Sequelize.STRING },
});

const GalleryModel = db.define('gallery', {
  gallery_name: { type: Sequelize.STRING, allowNull: false },
  image_name: { type: Sequelize.STRING, allowNull: false },
});

const GPSContModel = db.define('gps_cont', {
  site_name: { type: Sequelize.STRING, allowNull: false },
  fieldwork_id: { type: Sequelize.STRING, allowNull: false },
  updated_date: { type: Sequelize.DATE },
  updated_time: { type: Sequelize.TIME },
  p_receiver_sn: { type: Sequelize.STRING },
  updated_receiver_sn: { type: Sequelize.STRING },
  p_antenna_sn: { type: Sequelize.STRING },
  updated_antenna_sn: { type: Sequelize.STRING },
  p_antenna_height: { type: Sequelize.FLOAT },
  updated_antenna_height: { type: Sequelize.FLOAT },
  power_failure: { type: Sequelize.BOOLEAN },
  battery_condition: { type: Sequelize.STRING },
  charger_status: { type: Sequelize.STRING },
  note: { type: Sequelize.STRING },
});

const StaffModel = db.define('staff', {
  first_name: { type: Sequelize.STRING, allowNull: false },
  last_name: { type: Sequelize.STRING, allowNull: false },
  nickname: { type: Sequelize.STRING, allowNull: false },
  contact_num: { type: Sequelize.STRING, unique: true, allowNull: false },
  email_address: { type: Sequelize.STRING, unique: true, allowNull: true },
  office_location: { type: Sequelize.STRING, allowNull: false },
  birthday: { type: Sequelize.DATE, allowNull: false },
});


const LogisticModel = db.define('logistical_note', {
  accessibility: { type: Sequelize.STRING },
  site_stability: { type: Sequelize.STRING },
  construction_dev_plans: { type: Sequelize.STRING },
  accommodation: { type: Sequelize.STRING },
  associated_id: { type: Sequelize.STRING },
});

const LogsheetModel = db.define('logsheet', {
  fieldwork_id: { type: Sequelize.INTEGER },
  site_name: { type: Sequelize.STRING, allowNull: false },
  survey_type: { type: Sequelize.STRING, allowNull: false },
  logsheet_date: { type: Sequelize.DATE, allowNull: false },
  julian_day: { type: Sequelize.INTEGER, allowNull: false },
  marker: { type: Sequelize.STRING, allowNull: false },
  receiver_serialnumber: { type: Sequelize.STRING, allowNull: false },
  antenna_serialnumber: { type: Sequelize.STRING, allowNull: false },
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
  site_sketch_id: { type: Sequelize.INTEGER },
  observed_situation: { type: Sequelize.STRING },
  lodging_road_information: { type: Sequelize.STRING },
  contact_id: { type: Sequelize.INTEGER },
  others: { type: Sequelize.STRING },
});

const DivisionModel = db.define('division', {
  division_name: { type: Sequelize.STRING, allowNull: false },
});

const PositionModel = db.define('position', {
  position_name: { type: Sequelize.STRING, allowNull: false },
});

const SiteinfoModel = db.define('site', {
  site_name: { type: Sequelize.STRING, unique: true, allowNull: false },
  last_update: { type: Sequelize.DATE },
  latitude: { type: Sequelize.FLOAT },
  longitude: { type: Sequelize.FLOAT },
  receiver_sn: { type: Sequelize.STRING },
  antenna_sn: { type: Sequelize.STRING },
  powersource_sn: { type: Sequelize.STRING },
  contact_id: { type: Sequelize.INTEGER },
  address_one: { type: Sequelize.STRING },
  address_two: { type: Sequelize.STRING },
  city: { type: Sequelize.STRING },
  province: { type: Sequelize.STRING },
  gallery_name: { type: Sequelize.STRING },
});


const SurveytypeModel = db.define('survey_type', {
  survey_type_info: { type: Sequelize.STRING },
});

const Sitename = db.models.site_name;
const Contact = db.models.contact_person;
const Antenna = db.models.antenna;
const Receiver = db.models.receiver;
const Charger = db.models.power_source;
const Associated = db.models.associated_agency;
const Field = db.models.fieldwork;
const Gallery = db.models.gallery;
const GPSCont = db.models.gps_cont;
const Staff = db.models.staff;
const Logistic = db.models.logistical_note;
const Logsheet = db.models.logsheet;
const Division = db.models.division;
const Position = db.models.position;
const Site = db.models.site;
const Surveytype = db.models.survey_type;

// relationships
Staff.belongsTo(Position, { foreignKey: 'position_id' });
Staff.belongsTo(Division, { foreignKey: 'division_id' });

// uncommment this lines below to create the database tables
db.sync({
  logging: console.log,
  // force: true,
});

export {
  Sitename,
  Contact,
  Antenna,
  Receiver,
  Charger,
  Associated,
  Field,
  Gallery,
  GPSCont,
  Staff,
  Logistic,
  Logsheet,
  Division,
  Position,
  Site,
  Surveytype,
};

