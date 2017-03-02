const typeDefs = [`
scalar Date
scalar Time
scalar Double

type Mutation {

  createContact(
    first_name: String!,
    last_name: String!,
    position: String,
    contact_number: String!,
    organization: String,
    email_add: String,
    address_one: String,
    address_two: String,
    city: String,
    province: String,
  ) : Contact

}

type Query {

  Sitename(id: Int, site_name: String): Sitename
    allSitename(limit: Int, offset: Int): [Sitename]

  Contact(id: Int, first_name: String, last_name: String): Contact
    allContact(limit: Int, offset: Int, order: String): [Contact]

  Antenna(id: Int, serial_number: String, type: String, part_number: String): Antenna
    allAntenna: [Antenna]

  Receiver(id: Int, serial_number: String, type: String, part_number: String): Receiver
    allReceiver: [Receiver]

  Charger(id: Int, ps_serial_number: String): Charger
    allCharger: [Charger]

  Associated(id: Int, associated_name: String): Associated
    allAssociated: [Associated]

  Field(id: Int, first_date: String, last_date: String, logistical_note_id: Int, others: String): Field
    allField: [Field]

  Gallery(id: Int, gallery_name: String, image_name: String): Gallery
    allGallery: [Gallery]

  GPSCont(id: Int): GPSCont
    allGPSCont: [GPSCont]

  Staff(first_name: String, last_name: String, id: Int): Staff
    allStaff: [Staff]

  Logistic(id: Int): Logistic
    allLogistic: [Logistic]

  Logsheet(id: Int): Logsheet
    allLogsheet: [Logsheet]

  Observer(id: Int): Observer
    allObserver: [Observer]

  Division(id: Int): Division
    allDivision: [Division]


  Position(id: Int): Position
    allPosition: [Position]

  Siteinfo(id: Int): Siteinfo
    allSiteinfo: [Siteinfo]

  Surveytype(id: Int): Surveytype
    allSurveytype: [Surveytype]

} 

type Contact {
  id: Int,
  first_name: String,
  last_name: String,
  position: String,
  contact_number: String,
  organization: String,
  email_add: String,
  address_one: String,
  address_two: String,
  city: String,
  province: String,
}

type Sitename {
  id: Int
  site_name: String 
}

type Antenna {
  id: Int
  serial_number: String
  type: String
  part_number: String
}

type Receiver {
  id: Int
  serial_number: String
  type: String
  part_number: String
}

type Charger {
  id: Int
  ps_serial_number: String
  comment : String
}

type Associated {
  id: Int
  associated_name : String
}

type Field {
  id: Int
  first_date : String
  last_date: String
  logistical_note_id : Int
  others: String
}

type Gallery {
  id: Int
  gallery_name : String
  image_name: String
}

type GPSCont {
  id: Int
  site_name: String
  fieldwork_id: Int
  update_date: String
  update_time: Time
  p_receiver_sn: String
  updated_receiver_sn: String
  p_antenna_sn: String
  updated_antenna_sn: String
  p_antenna_height: Double
  updated_antenna_height: Double
  power_failure: Boolean
  battery_condition: String
  charger_status: String
  note: String
}

type Staff {
  id: Int
  first_name: String
  last_name: String
  nickname: String
  position_name: String
  contact_num: Int
  division_name: String
  email_address: String
  office_location: String
  birthday: String
}

type Logistic {
  id: Int
  accessibility: String
  site_stability: String
  construction_dev_plans: String
  accommodation: String
  associated_id: String
}

type Logsheet {
  id:  Int   
  fieldwork_id:  Int   
  site_name:  String   
  survey_type:  String   
  logsheet_date:  String   
  julian_day:  Int   
  marker:  String   
  receiver_serialnumber:  String   
  antenna_serialnumber:  String   
  height:  Double   
  north:  Double   
  east:  Double   
  south:  Double   
  west:  Double   
  time_start:  Time   
  time_end:  Time   
  azimuth:  Int   
  scan_log_id:  Int   
  power_source_serialnumber:  String   
  failure_time:  Time   
  receiver_status:  String   
  antenna_status:  String   
  rod_num:  Int   
  rod_correction:  Int   
  avg_slant_height:  Double   
  ip_add:  String   
  netmask:  String   
  gateway:  String   
  dns:  String   
  local_tcp_port:  String   
  latitude:  Double   
  longitude:  Double   
  site_sketch_id:  Int   
  observed_situation:  String   
  lodging_road_information:  String   
  contact_id:  Int   
  others:  String   
}

type Observer {
  id: Int
  staff_id: Int
  fieldwork_id: Int
}

type Division {
  id: Int
  division: String
}

type Position {
id: Int
position_name : String
}

type Siteinfo {
  id: Int
  site_name: String
  last_update: Date
  latitude: Double
  longitude: Double
  receiver_sn: String
  antenna_sn: String
  powersource_sn: String
  contact_id: Int
  address_one: String
  address_two: String
  city: String
  province: String
  gallery_name: String
}

type Surveytype {
  id: Int
  survey_type_info : String
}

schema {
  query: Query
  mutation: Mutation
}`];

export default typeDefs;
