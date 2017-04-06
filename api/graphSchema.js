const typeDefs = [`

scalar Date
scalar Time
scalar Float

type Subscription {
  contactCreated: Contact,
  contactDeleted: ID,
  logsheetCreated: Logsheet,
  staffCreated: Staff
}

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

  deleteContact(
    id: ID
  ) : ID

  createLogSheet(
    id:  ID   
    fieldwork_id:  ID   
    site_name:  String   
    survey_type:  String   
    logsheet_date:  Date
    julian_day:  Int   
    marker:  String   
    receiver_serialnumber:  String   
    antenna_serialnumber:  String   
    height:  Float   
    north:  Float   
    east:  Float   
    south:  Float   
    west:  Float   
    time_start:  Date   
    time_end:  Date   
    azimuth:  Int   
    failure_time:  Date   
    receiver_status:  String   
    antenna_status:  String   
    rod_num:  Int   
    rod_correction:  Int   
    avg_slant_height:  Float   
    ip_add:  String   
    netmask:  String   
    gateway:  String   
    dns:  String   
    local_tcp_port:  String   
    latitude:  Float   
    longitude:  Float   
    site_sketch_id:  ID   
    observed_situation:  String   
    lodging_road_information:  String   
    contact_id:  Int   
    others:  String   
  ) : Logsheet

  createStaff(
    first_name: String
    last_name: String
    nickname: String
    position_id: Int
    contact_num: String
    division_id: Int
    email_address: String
    office_location: String
    birthday: Date
  ) : Staff

}

type Query {

  Sitename(id: ID, site_name: String): Sitename
    allSitename(limit: Int, offset: Int): [Sitename]

  Contact(id: ID, first_name: String, last_name: String): Contact
    allContact(limit: Int, offset: Int, order: String): [Contact]

  Antenna(id: ID, serial_number: String, type: String, part_number: String): Antenna
    allAntenna: [Antenna]

  Receiver(id: ID, serial_number: String, type: String, part_number: String): Receiver
    allReceiver: [Receiver]

  Staff(first_name: String, last_name: String, id: ID): Staff
    allStaff: [Staff]

  Logsheet(id: ID): Logsheet
    allLogsheet: [Logsheet]

  Division(id: ID): Division
    allDivision: [Division]

  Position(id: ID): Position
    allPosition: [Position]

} 

type Contact {
  id: ID,
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
  id: ID
  site_name: String 
}

type Antenna {
  id: ID
  serial_number: String
  type: String
  part_number: String
}

type Receiver {
  id: ID
  serial_number: String
  type: String
  part_number: String
}

type Staff {
  id: ID
  first_name: String
  last_name: String
  nickname: String
  position: Position
  contact_numbers: [ContactNumber]
  division: Division
  emails: [Email]
  office_location: String
  birthday: Date
}

type Email {
  id: ID
  address: String
}

type ContactNumber {
  id: ID
  number: String
}

type Logsheet {
  id:  ID   
  fieldwork_id:  ID   
  site_name:  String   
  survey_type:  String   
  logsheet_date:  String   
  julian_day:  Int   
  marker:  String   
  receiver_serialnumber:  String   
  antenna_serialnumber:  String   
  height:  Float   
  north:  Float   
  east:  Float   
  south:  Float   
  west:  Float   
  time_start:  Time   
  time_end:  Time   
  azimuth:  Int   
  scan_log_id:  ID   
  power_source_serialnumber:  String   
  failure_time:  Time   
  receiver_status:  String   
  antenna_status:  String   
  rod_num:  Int   
  rod_correction:  Int   
  avg_slant_height:  Float   
  ip_add:  String   
  netmask:  String   
  gateway:  String   
  dns:  String   
  local_tcp_port:  String   
  latitude:  Float   
  longitude:  Float   
  site_sketch_id:  ID   
  observed_situation:  String   
  lodging_road_information:  String   
  contact_id:  Int   
  others:  String   
}

type Division {
  id: ID
  division_name: String
}

type Position {
  id: ID
  position_name: String
}

schema {
  query: Query
  mutation: Mutation
  subscription: Subscription
}

`];

export default typeDefs;
