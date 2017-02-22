import Sequelize from 'sequelize';

const db = new Sequelize('gps', 'root', '', {
  host: 'localhost',
  port: '3306',
});

const SitenameModel = db.define('site_name', {
 site_id: { type: Sequelize.INTEGER, primaryKey: true },
 site_name: { type: Sequelize.STRING },
}, { timestamps: false, freezeTableName: true });

const ContactModel = db.define('contact_person', {
  contact_id: { type: Sequelize.INTEGER, primaryKey: true },
  first_name: { type: Sequelize.STRING },
  last_name: { type: Sequelize.STRING },
  contact_number: { type: Sequelize.STRING },
}, { timestamps: false, freezeTableName: true });

const AntennaModel = db.define('antenna_information', {
  antenna_id: { type: Sequelize.INTEGER, primaryKey: true },
  antenna_serialnumber: { type: Sequelize.STRING },
  antenna_partnumber: { type: Sequelize.STRING },
  antenna_type: { type: Sequelize.STRING },
}, { timestamps: false, freezeTableName: true });

const ReceiverModel = db.define('receiver_information', {
  receiver_id: { type: Sequelize.INTEGER, primaryKey: true },
 serial_number: { type: Sequelize.STRING },
  receiver_type: { type: Sequelize.STRING },
  part_number: { type: Sequelize.STRING },
}, { timestamps: false, freezeTableName: true });

const ChargerModel = db.define('power_source', {
 ps_id: { type: Sequelize.INTEGER, primaryKey: true },
 ps_serial_number: { type: Sequelize.STRING },
 comment: { type: Sequelize.TEXT}, 
}, { timestamps: false, freezeTableName: true });

const AssociatedModel = db.define('associated_agency', {
 agency_id: { type: Sequelize.INTEGER, primaryKey: true },
 associated_name: { type: Sequelize.STRING },
}, { timestamps: false, freezeTableName: true });

const FieldModel = db.define('fieldwork_table', {
 fieldwork_id: { type: Sequelize.INTEGER, primaryKey: true },
 first_date: { type: Sequelize.DATE },
 last_date: { type: Sequelize.DATE },
 logistical_note_id: { type: Sequelize.INTEGER },
 others:{type: Sequelize.STRING },
}, { timestamps: false, freezeTableName: true });

const GalleryModel = db.define('gallery', {
 gallery_id: { type: Sequelize.INTEGER, primaryKey: true },
 gallery_name: { type: Sequelize.STRING },
 image_name: { type: Sequelize.STRING },
}, { timestamps: false, freezeTableName: true });

const GPSContModel = db.define('gps_cont', {
  id: { type: Sequelize.INTEGER, primaryKey: true },
  site_name: { type: Sequelize.STRING },
  fieldwork_id: { type: Sequelize.STRING },
  updated_date: { type: Sequelize.DATE },
  updated_time: { type: Sequelize.TIME },
  p_receiver_sn: { type: Sequelize.STRING },
  updated_receiver_sn: { type: Sequelize.STRING },
  p_antenna_sn: { type: Sequelize.STRING },
  updated_antenna_sn: { type: Sequelize.STRING },
  p_antenna_height: { type: Sequelize.DOUBLE },
  updated_antenna_height: { type: Sequelize.DOUBLE },
  power_failure: { type: Sequelize.BOOLEAN },
  battery_condition: { type: Sequelize.STRING },
  charger_status: { type: Sequelize.STRING },
  note: { type: Sequelize.STRING },
}, { timestamps: false, freezeTableName: true });

const StaffModel = db.define('gps_staff_info', {
  staf_id: { type: Sequelize.INTEGER, primaryKey: true },
  first_name: { type: Sequelize.STRING },
  last_name: { type: Sequelize.STRING },
  nickname: { type: Sequelize.STRING },
  position_name: { type: Sequelize.STRING },
  contact_num: { type: Sequelize.INTEGER },
  division_name: { type: Sequelize.STRING },
  email_address: { type: Sequelize.STRING },
  office_location: { type: Sequelize.STRING },
  birthday: { type: Sequelize.DATE },
}, { timestamps: false, freezeTableName: true });


const LogisticModel = db.define('logistical_notes', {
  logistical_note_id: { type: Sequelize.INTEGER, primaryKey: true },
  accessibility: { type: Sequelize.STRING },
  site_stability: { type: Sequelize.STRING },
  construction_dev_plans: { type: Sequelize.STRING },
  accommodation: { type: Sequelize.STRING },
  associated_id: { type: Sequelize.STRING },
}, { timestamps: false, freezeTableName: true });

const LogsheetModel = db.define('logsheet', {
  logsheet_id: { type: Sequelize.INTEGER, primaryKey: true },
  fieldwork_id: { type: Sequelize.INTEGER },
  site_name: { type: Sequelize.STRING },
  survey_type: { type: Sequelize.STRING },
  logsheet_date: { type: Sequelize.DATE },
  julian_day: { type: Sequelize.INTEGER },
  marker: { type: Sequelize.STRING },
  receiver_serialnumber: { type: Sequelize.STRING },
  antenna_serialnumber: { type: Sequelize.STRING },
  height: { type: Sequelize.DOUBLE },
  north: { type: Sequelize.DOUBLE },
  east: { type: Sequelize.DOUBLE },
  south: { type: Sequelize.DOUBLE },
  west: { type: Sequelize.DOUBLE },
  time_start: { type: Sequelize.TIME },
  time_end: { type: Sequelize.TIME },
  azimuth: { type: Sequelize.INTEGER },
  scan_log_id: { type: Sequelize.INTEGER },
  power_source_serialnumber: { type: Sequelize.STRING },
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
  lattitude: { type: Sequelize.DOUBLE },
  longitude: { type: Sequelize.DOUBLE },
  site_sketch_id: { type: Sequelize.INTEGER },
  observed_situation: { type: Sequelize.STRING },
  lodging_road_information: { type: Sequelize.STRING },
  contact_id: { type: Sequelize.INTEGER },
  others: { type: Sequelize.STRING },
}, { timestamps: false, freezeTableName: true });


const ObserverModel = db.define('observer', {
 observer_id: { type: Sequelize.INTEGER, primaryKey: true },
 staff_id: { type: Sequelize.INTEGER },
 fieldwork_id: { type: Sequelize.INTEGER}, 
}, { timestamps: false, freezeTableName: true });


const DivisionModel = db.define('office_division', {
 division_id: { type: Sequelize.INTEGER, primaryKey: true },
 division: { type: Sequelize.STRING },
}, { timestamps: false, freezeTableName: true });

const PositionModel = db.define('position', {
 position_id: { type: Sequelize.INTEGER, primaryKey: true },
 position_name: { type: Sequelize.STRING },
}, { timestamps: false, freezeTableName: true });

const SiteinfoModel = db.define('site_information', {
  site_info_id: { type: Sequelize.INTEGER, primaryKey: true },
  site_name: { type: Sequelize.STRING },
  last_update: { type: Sequelize.DATE },
  lattitude: { type: Sequelize.DOUBLE },
  longitude: { type: Sequelize.DOUBLE },
  receiver_sn: { type: Sequelize.STRING },
  antenna_sn: { type: Sequelize.STRING },
  powersource_sn: { type: Sequelize.STRING },
  contact_id: { type: Sequelize.INTEGER },
  address_one: { type: Sequelize.STRING },
  address_two: { type: Sequelize.STRING },
  city: { type: Sequelize.STRING },
  province: { type: Sequelize.STRING },
  gallery_name: { type: Sequelize.STRING },
}, { timestamps: false, freezeTableName: true });


const SurveytypeModel = db.define('survey_type', {
 survey_id: { type: Sequelize.INTEGER, primaryKey: true },
 survey_type_info: { type: Sequelize.STRING },
}, { timestamps: false, freezeTableName: true });

const AuthorsModel = db.define('authors', {
 id: { type: Sequelize.INTEGER, primaryKey: true },
 firstName: { type: Sequelize.STRING },
 lastName: { type: Sequelize.STRING },
 createdAt: { type: Sequelize.DATE },
 updateAt: { type: Sequelize.DATE },
}, { timestamps: false, freezeTableName: true });

const PostModel = db.define('posts', {
 id: { type: Sequelize.INTEGER, primaryKey: true },
 title: { type: Sequelize.STRING },
 text: { type: Sequelize.STRING },
 tags: { type: Sequelize.STRING },
 createdAt: { type: Sequelize.DATE },
 updateAt: { type: Sequelize.DATE },
}, { timestamps: false, freezeTableName: true });



AuthorsModel.hasMany(PostModel);
PostModel.belongsTo(AuthorsModel);





 
const Sitename = db.models.site_name;
const Contact = db.models.contact_person;
const Antenna = db.models.antenna_information;
const Receiver = db.models.receiver_information;
const Charger = db.models.power_source;
const Associated = db.models.associated_agency;
const Field = db.models.fieldwork_table;
const Gallery = db.models.gallery;
const GPSCont = db.models.gps_cont;
const Staff = db.models.gps_staff_info;
const Logistic = db.models.logistical_notes;
const Logsheet = db.models.logsheet;
const Observer = db.models.observer;
const Division = db.models.office_division;
const Position = db.models.position;
const Siteinfo = db.models.site_information;
const Surveytype = db.models.survey_type;
const Authors = db.models.Authors;
const Post = db.models.Post;


export { Contact, Antenna, Receiver, Charger, Sitename, Associated, Field, Gallery , GPSCont, Staff, Logistic, Logsheet,Observer, Division, Position,Siteinfo,Surveytype,Post, Authors};

