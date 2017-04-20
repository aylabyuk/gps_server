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

  createStaff(
    input: StaffInput
  ) : Staff

  createLogsheet(
    input: LogsheetInput
  ) : Logsheet

}

type Query {

  allSitename: [Sitename]

  allContact(limit: Int, offset: Int, order: String): [Contact]

  Antenna(id: ID, serial_number: String, type: String, part_number: String): Antenna
    allAntenna: [Antenna]
    
  Receiver(id: ID, serial_number: String, type: String, part_number: String): Receiver
    allReceiver: [Receiver]

  allStaff: [Staff]

  allLogsheet: [Logsheet]

  allDivision: [Division]

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
  division: Division
  contact_numbers: [ContactNumber]
  emails: [Email]
  office_location: String
  birthday: Date
}

input StaffInput {
  first_name: String
  last_name: String
  nickname: String
  positionId: Int
  divisionId: Int
  contact_numbers: [ContactNumberInput]
  emails: [EmailInput]
  office_location: String
  birthday: Date
}

type Division {
  id: ID
  division_name: String
}

type Position {
  id: ID
  position_name: String
}

type Email {
  id: ID
  address: String
}

input EmailInput {
  address: String
}

type ContactNumber {
  id: ID
  number: String
}

input ContactNumberInput {
  number: String
}

enum SurveyType {
  CONTINUOUS
  CAMPAIGN
}

type Logsheet {
  id:  ID 
  survey_type:  SurveyType
  logsheet_date:  Date
  julian_day:  Int
  marker:  String
  observers: [Staff]   
  site:  Sitename     
  height:  Float   
  north:  Float   
  east:  Float   
  south:  Float   
  west:  Float   
  time_start:  Time   
  time_end:  Time   
  azimuth:  Int
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
  observed_situation:  String   
  lodging_road_information:  String   
  others:  String  
  antenna:  Antenna  
  receiver:  Receiver  
  contact:  Contact 
  team: Team
}

input StaffIdInput {
  id: Int
}

input LogsheetInput {
  survey_type:  String
  logsheet_date:  Date
  julian_day:  Int
  marker:  String
  observers: [StaffIdInput]   
  siteNameId:  Int     
  height:  Float   
  north:  Float   
  east:  Float   
  south:  Float   
  west:  Float   
  time_start:  Time   
  time_end:  Time   
  azimuth:  Int
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
  observed_situation:  String   
  lodging_road_information:  String   
  others:  String  
  antennaId:  String  
  receiverId:  String  
  contactPersonId:  Int 
  teamId: Int
}

type Fieldwork {
  name: String
  description: String
  start_date: Date
  end_date: Date
  teams: [Team]
}

type Team {
  name: String
  description: String
  fieldwork: Fieldwork
}

schema {
  query: Query
  mutation: Mutation
  subscription: Subscription
}

`];

export default typeDefs;
