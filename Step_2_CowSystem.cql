// Reviewed, updated 6 Feb 2019; includes :Polity:State labels
// ####################################################################################################################
// The states2016.csv data is actually a more appropriate file to describe the state system (membership)
// than the system2016.csv because it contains duration data that imply the system during that time period.

// COW State System dataset
CREATE (d:Source{
  project:"Correlates of War",
  name:"State System Membership",
  version:toInteger(2016),
  published:date({year:2017, month:2, day:27}),
  validFrom:date({year:1816, month:1, day:1}),
  validUntil:date({year:2016, month:12, day:31}),
  citation:"Correlates of War Project. 2017.'State System Membership List, v2016'. Online, http://correlatesofwar.org'",
  url:"http://correlatesofwar.org/data-sets/state-system-membership",
  host:["Volker Krause (Eastern Michigan University)", "Phil Schafer (University of Michigan)", "Karen Ruth Adams (University of Montana)"],
  poc:"Volker Krause (vkrause@emich.edu)",
  overview:"This data set contains the list of states in the international system as updated and distributed by the Correlates of War Project. These data sets identify states, their standard Correlates of War 'country code' or state number (used throughout the Correlates of War project data sets), state abbreviations, and dates of membership as states and major powers in the international system. Version 2016 extends the temporal domain of the collection through December 2016. \nThe Correlates of War project includes a state in the international system from 1816-2016 for the following criteria. Prior to 1920, the entity must have had a pax greater than 500,000 and have had diplomatic missions at or above the rank of charge d’affaires with Britain and France. After 1920, the entity must be a member of the League of Nations or the United Nations, or have a pax greater than 500,000 and receive diplomatic missions from two major powers.",
  purpose:"This data set records the fluctuating composition of the state system since 1816. It also identifies countries corresponding to the standard Correlates of War country codes."
})
CREATE (d)-[:PROVIDES]->(:File{
  name:"State System Codebook",
  version:toInteger(2016),
  published:date({year:2017, month:2, day:27}),
  purpose:"Describes the content and formate of the data, and provides details of the operational criteria for state system membership.",
  url:"http://correlatesofwar.org/data-sets/state-system-membership/state-system-v2016-codebook/at_download/file",
  filename:"State System Membership Codebook V2016.pdf",
  bytesize:toInteger(93891)
})
CREATE (d)-[:PROVIDES]->(:File{
  name:"State System FAQ",
  version:toInteger(2016),
  published:date({year:2017, month:2, day:27}),
  purpose:"Contains answers to some FAQs about the state system membership datasets",
  url:"http://correlatesofwar.org/data-sets/state-system-membership/state-system-v2016-faq/at_download/file",
  filename:"State FAQ.pdf",
  bytesize:toInteger(92385)
})
CREATE (d)-[:PROVIDES]->(:Dataset{
  name:"States 2016",
  version:toInteger(2016),
  published:date({year:2017, month:2, day:27}),
  purpose:"Provides the entry and exit dates of states, country codes, and abbreviations.",
  url:"http://correlatesofwar.org/data-sets/state-system-membership/states2016/at_download/file",
  filename:"states2016.csv",
  bytesize:toInteger(10845)
})
CREATE (d)-[:PROVIDES]->(:Dataset{
  name:"Majors 2016",
  version:toInteger(2016),
  published:date({year:2017, month:2, day:27}),
  purpose:"Provides the entry and exit dates for states to be designated as major powers.",
  url:"http://correlatesofwar.org/data-sets/state-system-membership/majors2016/at_download/file",
  filename:"majors2016.csv",
  bytesize:toInteger(539)
})
CREATE (d)-[:PROVIDES]->(:Dataset{
  name:"System 2016",
  version:toInteger(2016),
  published:date({year:2017, month:2, day:27}),
  purpose:"Gives the composition of the state system year by year (providing a blank country-year dataset).",
  url:"http://correlatesofwar.org/data-sets/state-system-membership/system2016/at_download/file",
  filename:"system2016.csv",
  bytesize:toInteger(300836)
});

// Identify the system and graph the relationship to the source.
MATCH (so:Source{project:"Correlates of War", name:"State System Membership", version:2016})
CREATE (so)-[:DEFINES{
  asOf:date({year:2017, month:2, day:27})
}]->(system:System {
  name:"COW State System",
  scope:"Global",
  from:date({year:1816, month:1, day:1}),
  until:date({year:2016, month:12, day:31})
});

// (PC)-[:CONTRIBUTES{asOf:date()}]->(:Fact{from, until})<-[:MEMBER]-(state:Polity:State)
//                                                      \-[:MEMBER_OF]-(system:System)
// Finally, load the data file and graph the relationship of the states to it and the system
CREATE CONSTRAINT ON (st:State) ASSERT st.cowcode IS UNIQUE;

MATCH (d:Dataset{filename:"states2016.csv"}), (y:System{name:"COW State System"})
LOAD CSV WITH HEADERS FROM "file:///states2016.csv" AS row
WITH d, y, row
MERGE (d)-[:CONTRIBUTES{asOf:d.published}]->(f:Fact:MembershipFact{
  name:"System Membership",
  source:"COW State System",
  from:date({year:toInteger(row.styear), month:toInteger(row.stmonth), day:toInteger(row.stday)}),
  until:date({year:toInteger(row.endyear), month:toInteger(row.endmonth), day:toInteger(row.endday)}),
  subject:row.statenme,
  predicate:"MEMBER",
  object:y.name
})-[:MEMBER_OF]->(y)
MERGE (state:Polity:State{
  cowcode:row.ccode,
  abb:row.stateabb,
  name:row.statenme})
CREATE (state)-[:MEMBER]->(f);
// Relate Levy's Great Powers to the COW states they became, where appropriate.

MATCH (gp:GreatPower), (s:Polity:State)
  WHERE gp.cowRelation = s.cowcode
WITH gp, s
MERGE (gp)-[:BECAME]->(s)
SET gp:Polity:State;
// End of states2016.csv

RETURN "Import of states2016.csv was successful. Files 1 of 2 COW System files, 4 of 24 total files.";

// Some states are major powers in the COW state system
MATCH (so:Source{project:"Correlates of War", name:"State System Membership", version:2016})
CREATE (so)-[:DEFINES {
  asOf:date({year:2017, month:2, day:27})
}]->(mp:System:Subsystem {
  name:"COW Major Powers System",
  scope:"Global",
  from:date({year:1816, month:1, day:1}),
  until:date({year:2016, month:12, day:31})
});

MATCH (sy:System {name:"COW State System"})
MATCH (mp:Subsystem {name:"COW Major Powers System"})
MERGE (mp)-[:PART_OF]->(sy);

MATCH (maj:Dataset{filename:"majors2016.csv"}), (sys:System{name:"COW Major Powers System"})
LOAD CSV WITH HEADERS FROM "file:///majors2016.csv" AS row
CREATE (maj)-[:CONTRIBUTES]->(f:Fact:MembershipFact{
  name:"System Membership",
  source:"COW Major Powers System",
  from:date({year:toInteger(row.styear), month:toInteger(row.stmonth), day:toInteger(row.stday)}),
  until:date({year:toInteger(row.endyear), month:toInteger(row.endmonth), day:toInteger(row.endday)})
})-[:MEMBER_OF]->(sys)
WITH f, row
MATCH (state:Polity:State{cowcode:row.ccode})
MERGE (state)-[:MEMBER{
  from:date({year:toInteger(row.styear), month:toInteger(row.stmonth), day:toInteger(row.stday)}),
  until:date({year:toInteger(row.endyear), month:toInteger(row.endmonth), day:toInteger(row.endday)})
  }]-(f);
// There were no states that became states on 1 Jan 1816 and the data refects the metadata for COW's definition of the system
MATCH (s:State)-[m:MEMBER]-(mf:MembershipFact)-[mo:MEMBER_OF]-(y:System) WHERE mf.from = date({year:1816, month:01, day:01}) REMOVE mf.from
// End of majors2016.csv

MATCH (:Source{name:"State System Membership"})-[:PROVIDES]->(d:Dataset)-[:CONTRIBUTES]->(f:Fact), (w:Week)
  WHERE w.began <= f.from <= w.ended
MERGE (f)-[:FROM_WEEK]->(w);

MATCH (:Source{name:"State System Membership"})-[:PROVIDES]->(d:Dataset)-[:CONTRIBUTES]->(f:Fact), (w:Week)
  WHERE w.began <= f.until <= w.ended
MERGE (f)-[:UNTIL_WEEK]->(w);

RETURN "Import of majors2016.csv was successful. Files 2 of 2 COW System files, 5 of 24 total files.";
// End COW state system membership source