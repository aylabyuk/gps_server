const typeDefs = [`

scalar Date
scalar Float

# Graphql subscriptions for GPS dashboard application
type Subscription {
  # subscription for newly created contacts
  contactCreated: Contact,
  # subscription for deleted contacts
  contactDeleted: ID,
  # subscription for newly created logsheets
  logsheetCreated: Logsheet,
  # subscription for newly created staff
  staffCreated: Staff,
  # subscription for updated logsheets
  logsheetUpdated: Logsheet,
}

# Graphql mutations for GPS dashboard application
type Mutation {
  # each logsheets can have one contact person
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
  # delete a contact using its ID
  deleteContact(
    id: ID
  ) : ID
  # create staff mutation
  createStaff(
    input: StaffInput
  ) : Staff
  # create a new logsheet
  createLogsheet(
    input: LogsheetInput
  ) : Logsheet
  # update existing logsheet
  updateLogsheet(
    input: LogsheetInput
  ) : Logsheet
  # create new receiver data
  createReceiver(
    input: ReceiverInput
  ) : Receiver
  # create new Antenna data
  createAntenna(
    input: AntennaInput
  ) : Antenna
  # create new site
  createSite(
    input: SiteInput
  ) : Site
  # create new fieldwork data 
  createFieldwork(
    input: FieldworkInput
  ) : Fieldwork
  # update timeseries jpg file
  updateSiteTimeseriesPreview(
    siteName: String!
    timeseriesPreview: File!
  ) : FileUpload

  register(
    username: String!
    email: String!
    password: String
  ) : User!

  login(
    email: String!
    password: String
  ) : String!
}

# Graphql Queries for GPS dashboard application
type Query {
  # get all sites, you can use pagination using limit and offset technique 
  allSite(limit: Int, offset: Int): [Site]
  # find specific sites that have logsheets information using sitename
  sitesWithLogsheet(name: [String]): [Site]
    # query all sites that have a logsheet entry
    allSitesWithLogsheet: [Site]
  # check for logsheet records for specific sitename and date (use this to check if logsheet is already or previously entered)
  checkDuplicateLogsheetEntry(name: String, date: Date): [Site]
  # query all contacts 
  allContact(limit: Int, offset: Int, order: String): [Contact]
  # query antenna information with either id, serial number, part number type as parameter
  Antenna(id: ID, serial_number: String, type: String, part_number: String): Antenna
    # query all antenna
    allAntenna: [Antenna]
  # query receiver information with either id, serial number, part number type as parameter
  Receiver(id: ID, serial_number: String, type: String, part_number: String): Receiver
     # query all receiver
    allReceiver: [Receiver]
  # all staff using order as parameter (e.g order: "last_name")
  allStaff(order: String): [Staff]
  # find Logsheet information for specific logsheet date
  allLogsheet(logsheet_date: Date): [Logsheet]
    # query logsheets using logsheet ID
    singleLogsheet(id: ID): Logsheet
  # query all division info
  allDivision: [Division]
  # query all position info
  allPosition: [Position]
  # query all fieldwork info
  allFieldWork: [Fieldwork]
  # handles upload of timeseries jpg files to the server
  siteTimeseriesPreview(name: String): FileUpload
  # query all available timeseries jpg files
  timeseriesJpgFiles: [Filename]
}
# Filename is a graphql type that handle structure for files using their names.
type Filename {
  name: String
}
# FileUpload is a type that consist the data structure for each uploaded files
type FileUpload {
  id: ID
  name: String
  type: String
  size: Int
  path: String
  site: Site
  description: String
}
# Contact is a person who provides a link for information about specific GPS site.
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
# Site is a location where a GPS survey is conducted. It may either be a Continuous or a Campaign GPS site 
type Site {
  id: ID
  name: String
  aka: String
  marker: String
  constructed: Date
  survey_type: String
  long: String
  lat: String
  address: String
  description: String
  logsheets: [Logsheet]
}

input SiteInput {
  name: String
  aka: String
  marker: String
  constructed: Date
  survey_type: String
  long: String
  lat: String
}
# Is a module of the GPS equipment that is used as the reference for locating the precise measurement of a GPS site
type Antenna {
  id: ID
  serial_number: String
  type: String
  part_number: String
}

input AntennaInput {
  serial_number: String
  type: String
  part_number: String
}
# Is a module of the GPS equipment that logs and transmits the data. It is the brain of the GPS equipment. 
type Receiver {
  id: ID
  serial_number: String
  type: String
  part_number: String
}

input ReceiverInput {
  serial_number: String
  type: String
  part_number: String
}
# The personnels involved in conducting GPS surveys.
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
# A GPS survey can either be Continuous or Campaign type.
enum SurveyType {
  # Continuous types of GPS surveys uses continuously operating GPS receivers to monitor displacements for some specific location for a long period of time.
  CONTINUOUS
  # Campaign types of GPS surveys are regional, sub cm precision GPS survey type that uses portable equipments to log crustal deformation of a specific location. 
  # It typically involved occupying sites/benchmarks for several days to get the highest possible accuracy.
  # If possible benchmarks can be reoccuppied regularly. 
  CAMPAIGN
}
# Logsheets are forms that are used to record important details during GPS surveys.
type Logsheet {
  id:  ID 
  survey_type:  SurveyType
  logsheet_date:  Date
  julian_day:  Int
  location: String
  marker:  String
  observers: [Staff]   
  site:  Site       
  north:  Float   
  east:  Float   
  south:  Float   
  west:  Float   
  time_start:  String   
  time_end:  String   
  azimuth:  Int
  failure_time:  String   
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
  fieldworkId: Int
}

input StaffIdInput {
  id: Int
}

input LogsheetInput {
  id: Int
  survey_type:  String
  logsheet_date:  Date
  julian_day:  Int
  location: String
  marker:  String
  observers: [StaffIdInput]   
  siteId:  Int     
  north:  Float   
  east:  Float   
  south:  Float   
  west:  Float   
  time_start:  String   
  time_end:  String   
  azimuth:  Int
  failure_time:  String   
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
  contactPersonId: Int
  fieldworkId: Int
}

input File {
  name: String!
  type: String!
  size: Int!
  path: String!
}
# Fieldwork is the collection of information 
type Fieldwork {
  id: ID
  year: Int
  month: String
  description: String
  staffs: [Staff]
}

input FieldworkInput {
  year: Int
  month: String
  description: String
  staffs: [StaffIdInput]
}

schema {
  query: Query
  mutation: Mutation
  subscription: Subscription
}

type User {
  id: ID
  username: String!
  email: String!
}

`];

export default typeDefs;
