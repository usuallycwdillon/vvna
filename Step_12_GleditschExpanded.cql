// Reviewed, updated 14 SEP 2018; includes named facts
// Gleditsch extended war data
CREATE (d:Source{
  project:"Gleditsch Expanded Data",
  name:"Expanded War Data",
  version:toFloat(2.0),
  published:date({year:2013, month:11, day:5}),
  validFrom:date({year:1816, month:1, day:1}),
  validUntil:date({year:2002, month:12, day:31}),
  citation:"Gleditsch, Kristian Skrede 2004. 'A Revised List of Wars Between and Within Independent States, 1816-2002' International Interactions 30: 231-262",
  url:"http://privatewww.essex.ac.uk/~ksg/expwar.html",
  host:"University of Essex",
  poc:"ksg@essex.ac.uk",
  overview:"These data contain a revised and expanded list of wars to conform with the list of independent states outlined in Gleditsch, Kristian Skrede & Michael D. Ward. 1999. 'Interstate System Membership: A Revised List of the Independent States since 1816.' International Interactions 25:393-413. They are explained in greater detail in Gleditsch, Kristian Skrede 2004. 'A Revised List of Wars Between and Within Independent States, 1816-2002', International Interactions 30:231-262."
})
CREATE (d)-[:PROVIDES]->(eiw:Dataset{
  name:"Expanded Interstate Wars Data",
  version:toFloat(2.1),
  published:date({year:2013, month:11, day:5}),
  purpose:"List of interstate wars",
  filename:"exp_iw.asc",
  bytesize:toInteger(10280)
})
CREATE (d)-[:PROVIDES]->(eiwp:Dataset{
  name:"Expanded Interstate Wars Participants Data",
  version:toFloat(2.1),
  published:date({year:2013, month:11, day:5}),
  purpose:"Interstate war participants and attribute data",
  filename:"exp_iwpart.asc",
  bytesize:toInteger(42152)
})
CREATE (d)-[:PROVIDES]->(ecw:Dataset{
  name:"Expanded Civil Wars Data",
  version:toFloat(2.1),
  published:date({year:2013, month:11, day:5}),
  purpose:"List of civil wars (including 'extra-state' wars)",
  filename:"exp_cw.asc",
  bytesize:toInteger(35008)
})
CREATE (d)-[:PROVIDES]->(ecwp:Dataset{
  name:"Expanded Civil Wars Participants Data",
  version:toFloat(2.1),
  published:date({year:2013, month:11, day:5}),
  purpose:"Civil war participants and attribute data",
  filename:"exp_cwpart.asc",
  bytesize:toInteger(58196)
})
CREATE (d)-[:PROVIDES]->(:File{
  name:"Readme",
  version:toFloat(2.1),
  published:date({year:2013, month:11, day:5}),
  purpose:"Document data and describe changes.",
  url:"http://privatewww.essex.ac.uk/~ksg/data/expwar_v2.1.zip",
  filename:"Readme.txt",
  bytesize:toInteger(6108)
})
CREATE (d)-[:PROVIDES]->(:Dataset{
  name:"Modified Expanded Interstate Wars Data",
  version:toFloat(2.1),
  published:date({year:2013, month:11, day:5}),
  purpose:"List of interstate wars, reformatted for easy import into Neo4j",
  filename:"exp_iw_modified.csv",
  bytesize:toInteger(12912)
})-[:MODIFIES]->(eiw)
CREATE (d)-[:PROVIDES]->(:Dataset{
  name:"Modified Expanded Interstate Wars Participants Data",
  version:toFloat(2.1),
  published:date({year:2013, month:11, day:5}),
  purpose:"Interstate war participants and attribute data, reformatted for easy import into Neo4j",
  filename:"exp_iwpart_modified.csv",
  bytesize:toInteger(50777)
})-[:MODIFIES]->(eiwp)
CREATE (d)-[:PROVIDES]->(:Dataset{
  name:"Modified Expanded Civil Wars Data",
  version:toFloat(2.1),
  published:date({year:2013, month:11, day:5}),
  purpose:"List of civil wars (including 'extra-state' wars, reformatted for easy import into Neo4j)",
  filename:"exp_cw_modified.csv",
  bytesize:toInteger(43802)
})-[:MODIFIES]->(ecw)
CREATE (d)-[:PROVIDES]->(:Dataset{
  name:"Modified Expanded Civil Wars Participants Data, reformatted for easy import into Neo4j",
  version:toFloat(2.1),
  published:date({year:2013, month:11, day:5}),
  purpose:"Civil war participants and attribute data",
  filename:"exp_cwpart_modified.csv",
  bytesize:toInteger(68580)
})-[:MODIFIES]->(ecwp);

CREATE (d:Source{
  project:"Gleditsch Expanded Data",
  name:"Revised List of Independent States",
  version:toFloat(5.0),
  published:date({year:1999}),
  validFrom:date({year:1816, month:1, day:1}),
  validUntil:date({year:2012, month:12, day:31}),
  citation:"Gleditsch, Kristian S. & Michael D. Ward. 1999. 'Interstate System Membership: A Revised List of the Independent States since 1816.' International Interactions 25: 393-413.",
  url:"http://privatewww.essex.ac.uk/~ksg/statelist.html",
  host:"University of Essex",
  poc:"ksg@essex.ac.uk",
  overview:"These data are explained in greater detail in Gleditsch, Kristian S. & Michael D. Ward. 1999. 'Interstate System Membership: A Revised List of the Independent States since 1816.' International Interactions 25: 393-413. Users should also consult the accompanying case description document outlining the classification of states (in PDF format). Note that the current version of the data contain some changes over the table in the Gleditsch and Ward 1999 article. These are documented in the case description file."
})
CREATE (d)-[:PROVIDES]->(iis:Dataset{
  name:"List of Independent States",
  version:toFloat(5.0),
  published:date({year:2013, month:3, day:14}),
  purpose:"List of independent states",
  filename:"iisystem.dat",
  bytesize:toInteger(9093)
})
CREATE (d)-[:PROVIDES]->(mis:Dataset{
  name:"List of Microstates",
  version:toFloat(5.0),
  published:date({year:2013, month:3, day:14}),
  purpose:"A tentative list of microstates that fall short of the 250,000 threshold.",
  filename:"microstatesystem.dat",
  bytesize:toInteger(4096)
})
CREATE (d)-[:PROVIDES]->(iism:Dataset{
  name:"List of Independent States",
  version:toFloat(5.0),
  published:date({year:2013, month:3, day:14}),
  purpose:"List of independent states",
  filename:"iisystem_modified.csv",
  bytesize:toInteger(12288)
})
CREATE (d)-[:PROVIDES]->(mism:Dataset{
  name:"List of Microstates",
  version:toFloat(5.0),
  published:date({year:2013, month:3, day:14}),
  purpose:"A tentative list of microstates that fall short of the 250,000 threshold.",
  filename:"microstatesystem_modified.csv",
  bytesize:toInteger(4096)
});

MATCH (so:Source{project:"Gleditsch Expanded Data",
                 name:"Revised List of Independent States",
                 version:5.0})
CREATE (so)-[:DEFINES {
  asOf:date({year:2013, month:11, day:5})
}]->(system:System {
  name:"Expanded State System",
  scope:"Global",
  from:date({year:1816, month:1, day:1}),
  until:date({year:2002, month:12, day:31})
});

MATCH (source:Dataset{filename:"iisystem_modified.csv"}), (sys:System{name:"Expanded State System"})
LOAD CSV WITH HEADERS FROM "file:///iisystem_modified.csv" AS row
CREATE (f:Fact:MembershipFact{
  name:"System Membership",
  from:date({year:toInteger(row.syr), month:toInteger(row.smon), day:toInteger(row.sday)}),
  until:date({year:toInteger(row.eyr), month:toInteger(row.emon), day:toInteger(row.eday)})
})
MERGE (source)-[:CONTRIBUTES]->(f)-[:MEMBER_OF]->(sys)
MERGE (state:Polity:State{cowcode:row.ccode})
  ON CREATE SET state.name = row.statename, state.abb = row.abb
FOREACH (specific IN CASE WHEN row.statename <> state.name THEN [1] ELSE [] END | SET state.altName = row.statename)
FOREACH (specific IN CASE WHEN row.abb <> state.abb THEN [1] ELSE [] END | SET state.altAbb = row.abb)
CREATE (state)-[:MEMBER]->(f);
RETURN "Import of iisystem_modified.csv was successful. File 1 of 6 files from Gleditsch's expanded system data, 10 of 24 total files.";

// Microstates
MATCH (so:Source{project:"Gleditsch Expanded Data", name:"Revised List of Independent States", version:5.0})
CREATE (so)-[:DEFINES {
  asOf:date({year:2013, month:11, day:5})
}]->(system:System {
  name:"Microstate System",
  scope:"Global",
  from:date({year:1816, month:1, day:1}),
  until:date({year:2002, month:12, day:31})
});

MATCH (source:Dataset{filename:"microstatesystem_modified.csv"}), (sys:System{name:"Microstate System"})
LOAD CSV WITH HEADERS FROM "file:///microstatesystem_modified.csv" AS row
CREATE (f:Fact:MembershipFact{
  name:"System Membership",
  from:date({year:toInteger(row.syr), month:toInteger(row.smon), day:toInteger(row.sday)}),
  until:date({year:toInteger(row.eyr), month:toInteger(row.emon), day:toInteger(row.eday)})
})
MERGE (source)-[:CONTRIBUTES]->(f)-[:MEMBER_OF]->(sys)
MERGE (state:Polity:State{cowcode:row.ccode})
  ON CREATE SET state.name = row.statename, state.abb = row.abb
MERGE (state)-[:MEMBER]->(f)
FOREACH (specific IN CASE WHEN row.statename <> state.name THEN [1] ELSE [] END | SET state.altName = row.statename)
FOREACH (specific IN CASE WHEN row.abb <> state.abb THEN [1] ELSE [] END | SET state.altAbb = row.abb)
CREATE (state)-[:MEMBER]->(f);
RETURN "Import of microstatesystem_modified.csv was successful. File 2 of 6 files from Gleditsch's expanded system data, 11 of 24 total files.";
// Done with the expanded system

// Gleditsch Expanded War Data
MATCH (d:Source{project:"Gleditsch Expanded Data", name:"Expanded War Data"})
CREATE (d)-[:DEFINES]->(ew:List{name:"Expanded Wars"})
CREATE (d)-[:DEFINES]->(ecw:List{name:"Expanded Civil Wars"});

MATCH (f:Dataset{filename:"exp_cw_modified.csv"}), (ew:List{name:"Expanded Wars"}), (ecw:List{name:"Expanded Civil Wars"})
LOAD CSV WITH HEADERS FROM "file:///exp_cw_modified.csv" AS row
MATCH (war:War) WHERE any(c IN split(row.newcow, ';') WHERE substring(c, 3,4) IN  war.cowcode)
WITH row, f, ew, ecw, war 
MERGE (f)-[:CONTRIBUTES]->(ewf:Fact:WarFact{
  name:"Expanded War",
  from:date({year:toInteger(row.syear), month:toInteger(row.smon), day:toInteger(row.sday)}),
  until:date({year:toInteger(row.eyear), month:toInteger(row.emon), day:toInteger(row.eday)}),
  subject:row.warname,
  predicate:'IS_ONE',
  object:ew.name,
  cowReference:split(row.newcow, ';'),
  gwid:row.warid,
  warName:row.warname
})-[:ONE_OF]->(ew)
MERGE (ewf)-[:ONE_OF]->(ecw)
MERGE (war)-[:IS_ONE{
  from:date({year:toInteger(row.syear), month:toInteger(row.smon), day:toInteger(row.sday)}),
  until:date({year:toInteger(row.eyear), month:toInteger(row.emon), day:toInteger(row.eday)})
}]->(ewf)
MERGE (war)-[:IS_ONE{
  from:date({year:toInteger(row.syear), month:toInteger(row.smon), day:toInteger(row.sday)}),
  until:date({year:toInteger(row.eyear), month:toInteger(row.emon), day:toInteger(row.eday)})
  }]->(ecwf)
FOREACH (val in CASE WHEN row.cow94 <> "" THEN [1] ELSE [] END | SET war.cow94 = row.cow94)
FOREACH (val in CASE WHEN row.cow00 <> "" THEN [1] ELSE [] END | SET war.cow00 = row.cow00)
FOREACH (val in CASE WHEN row.oldwid <> "" THEN [1] ELSE [] END | SET war.oldwarId = row.oldwid) ;
RETURN "Import of exp_cw_modified.csv was successful. File 3 of 6 files from Gleditsch's expanded system data, 12 of 24 total files.";

// Import Civil and Intra-state War participation
//warid,statenum,syr,smon,sday,eyr,emon,eday,deaths,intnl,outcome,continuation
MATCH (g:Dataset{filename:"exp_cwpart_modified.csv"})
LOAD CSV WITH HEADERS FROM "file:///exp_cwpart_modified.csv" AS row
MATCH (state:Polity:State{cowcode:row.statenum}),(war:War{gwid:row.warid})
FOREACH (cont in CASE WHEN row.continuation = 'F' THEN [1] ELSE [] END |
  CREATE (g)-[:CONTRIBUTES]->(f:Fact:WarParticipationFact{
    from:date({year:toInteger(row.syr), month:toInteger(row.smon), day:toInteger(row.sday)}),
    until:date({year:toInteger(row.eyr), month:toInteger(row.emon), day:toInteger(row.eday)}),
    magnitude:toFloat(row.deaths),
    continuation:toBoolean(row.continuation),
    name:"Expanded Civil War Paricipation",
    subject:state.name,
    predicate:'PARTICIPATED',
    object:war.name})-[:PARTICIPATED_IN]->(war)
  CREATE (state)-[:PARTICIPATED{
    from:date({year:toInteger(row.syr), month:toInteger(row.smon), day:toInteger(row.sday)}),
    until:date({year:toInteger(row.eyr), month:toInteger(row.emon), day:toInteger(row.eday)})
  }]->(f) ) ;

MATCH (g:Dataset{filename:"exp_cwpart_modified.csv"})
LOAD CSV WITH HEADERS FROM "file:///exp_cwpart_modified.csv" AS row
MATCH (state:Polity:State{cowcode:row.statenum}),(war:War{gwid:row.warid})
FOREACH (cont in CASE WHEN row.continuation = 'T' THEN [1] ELSE [] END |
  CREATE (g)-[:CONTRIBUTES]->(f:Fact:WarParticipationFact{
    from:date({year:toInteger(row.syr), month:toInteger(row.smon), day:toInteger(row.sday)}),
    until:date({year:toInteger(row.eyr), month:toInteger(row.emon), day:toInteger(row.eday)}),
    magnitude:toFloat(row.deaths),
    continuation:toBoolean(row.continuation),
    name:"Expanded Civil War Paricipation",
    subject:state.name,
    predicate:'CONTINUED',
    object:war.name})-[:CONTINUED_IN]->(war)
  CREATE (state)-[:CONTINUED]->(f) ) ;

// Import participation in civil and intra-state wars
LOAD CSV WITH HEADERS FROM "file:///exp_cwpart_modified.csv" AS row
MATCH (state:Polity:State{cowcode:row.statenum})-[:PARTICIPATED]->(f:Fact)-[:PARTICIPATED_IN]->(war:War{gwid:row.warid})
WITH *,
  CASE row.outcome
    WHEN "1" THEN "Government Won"
    WHEN "2" THEN "Opposition Won"
    WHEN "3" THEN "Compromise"
    WHEN "4" THEN "Tranfomed into Another War Type"
    WHEN "5" THEN "Ongoing as of 31-12-2010"
    WHEN "6" THEN "Stalemate"
    WHEN "7" THEN "Continuing conflict below war level"
    ELSE "Data parse error"
    END AS verdict,
  CASE row.intnl
    WHEN "NA" THEN "Not Applicable"
    WHEN "0" THEN toBoolean("FALSE")
    WHEN "1" THEN toBoolean("TRUE")
    ELSE "Data parse error"
    END AS intl
MERGE (f)-[:RESULTED]->(r:Result{outcome:verdict, internationalized:intl})-[:RESULT_FOR]->(state)
MERGE (r)-[:RESULT_OF]->(war);
RETURN "Import of exp_cwpart.csv was successful. File 4 of 6 files from Gleditsch's expanded system data, 13 of 24 total files.";

// Import Interstate Wars
MATCH (d:Source{project:"Gleditsch Expanded Data", name:"Expanded War Data"})
CREATE (d)-[:COVERS]->(ew:List{name:"Expanded Wars"})
CREATE (d)-[:COVERS]->(eiw:List{name:"Expanded Interstate Wars"});

MATCH (f:Dataset{filename:"exp_iw_modified.csv"}), (ew:List{name:"Expanded Wars"}), (eiw:List{name:"Expanded Interstate Wars"})
LOAD CSV WITH HEADERS FROM "file:///exp_iw_modified.csv" AS row
MATCH (war:War) WHERE any(c IN split(row.newcow, ';') WHERE substring(c, 3,4) IN  war.cowcode)
WITH row, f, ew, eiw, war
MERGE (f)-[:CONTRIBUTES]->(ewf:Fact:WarFact{
  name:"Expanded Interstate War",
  from:date({year:toInteger(row.syr), month:toInteger(row.smon), day:toInteger(row.sday)}),
  until:date({year:toInteger(row.eyear), month:toInteger(row.emon), day:toInteger(row.eday)}),
  subject:row.warname,
  predicate:'IS_ONE',
  object:ew.name
})-[:ONE_OF]->(ew)
MERGE (f)-[:CONTRIBUTES]->(eiwf:Fact:WarFact{
  name:"Expanded Interstate War",
  from:date({year:toInteger(row.syr), month:toInteger(row.smon), day:toInteger(row.sday)}),
  until:date({year:toInteger(row.eyear), month:toInteger(row.emon), day:toInteger(row.eday)}),
  subject:row.warname,
  predicate:'IS_ONE',
  object:eiw.name
})-[:ONE_OF]->(eiw)
MERGE (war:War{
  gwid:row.warid,
  name:row.warname,
  cowcode:split(row.newcow,  ";"),
  cow94:row.cow94,
  cow00:row.cow00,
  oldwarId:row.oldwid
})-[:IS_ONE{
  from:date({year:toInteger(row.syr), month:toInteger(row.smon), day:toInteger(row.sday)}),
  until:date({year:toInteger(row.eyear), month:toInteger(row.emon), day:toInteger(row.eday)})
}]->(ewf)
MERGE (war)-[:IS_ONE{
  from:date({year:toInteger(row.syr), month:toInteger(row.smon), day:toInteger(row.sday)}),
  until:date({year:toInteger(row.eyr), month:toInteger(row.emon), day:toInteger(row.eday)})
  }]->(eiwf);
RETURN "Import of exp_iw_modified.csv was successful. File 5 of 6 files from Gleditsch's expanded system data, 14 of 24 total files.";

//warid,statenum,syr,smon,sday,eyr,emon,eday,side,deaths,outcome,initiate,newcow,cow94,cow00,oldwid,continuation
MATCH (g:Dataset{filename:"exp_iwpart_modified.csv"})
LOAD CSV WITH HEADERS FROM "file:///exp_iwpart_modified.csv" AS row
MATCH (state:Polity:State{cowcode:row.statenum}),(war:War) WHERE any(x IN war.gwid WHERE x = row.warid)
FOREACH (cont in CASE WHEN row.continuation = 'F' THEN [1] ELSE [] END |
  MERGE (g)-[:CONTRIBUTES]->(f:Fact:WarParticipationFact{
    from:date({year:toInteger(row.syr), month:toInteger(row.smon), day:toInteger(row.sday)}),
    until:date({year:toInteger(row.eyr), month:toInteger(row.emon), day:toInteger(row.eday)}),
    name:"Expanded Interstate War Paricipation",
    subject:state.name,
    predicate:'PARTICIPATED',
    object:war.name})-[:PARTICIPATED_IN]->(war)
  SET f.continuation = toBoolean(row.continuation)
  MERGE (state)-[:PARTICIPATED{
    from:date({year:toInteger(row.syr), month:toInteger(row.smon), day:toInteger(row.sday)}),
    until:date({year:toInteger(row.eyr), month:toInteger(row.emon), day:toInteger(row.eday)})
  }]->(f)
    FOREACH (mag in CASE WHEN row.deaths <> "" THEN [1] ELSE [] END | SET f.magnitude = toFloat(row.deaths)) )
;

//warid,statenum,syr,smon,sday,eyr,emon,eday,side,deaths,outcome,initiate,newcow,cow94,cow00,oldwid,continuation
MATCH (g:Dataset{filename:"exp_iwpart_modified.csv"})
LOAD CSV WITH HEADERS FROM "file:///exp_iwpart_modified.csv" AS row
MATCH (state:Polity:State{cowcode:row.statenum}),(war:War{gwid:row.warid})
FOREACH (cont in CASE WHEN row.continuation = 'T' THEN [1] ELSE [] END |
  CREATE (g)-[:CONTRIBUTES]->(f:Fact:WarParticipationFact{
    from:date({year:toInteger(row.syr), month:toInteger(row.smon), day:toInteger(row.sday)}),
    until:date({year:toInteger(row.eyr), month:toInteger(row.emon), day:toInteger(row.eday)}),
    magnitude:toFloat(row.deaths),
    continuation:toBoolean(row.continuation),
    name:"Expanded Interstate War Paricipation",
    subject:state.name,
    predicate:'CONTINUED',
    object:war.name})-[:CONTINUED_IN]->(war)
  CREATE (state)-[:CONTINUED{
    from:date({year:toInteger(row.syr), month:toInteger(row.smon), day:toInteger(row.sday)}),
    until:date({year:toInteger(row.eyr), month:toInteger(row.emon), day:toInteger(row.eday)})
    }]->(f) );

LOAD CSV WITH HEADERS FROM "file:///exp_iwpart_modified.csv" AS row
MATCH (state:Polity:State{cowcode:row.statenum})-[:PARTICIPATED]->(f:Fact:WarParticipationFact)-[:PARTICIPATED_IN]->(war:War{gwid:row.warid})
FOREACH (
i in CASE WHEN row.initiate = "1" THEN [1] ELSE [] END | MERGE (state)-[:INITIATED]->(f)-[:INITIATOR_OF]->(war)
)
WITH *,
  CASE row.outcome
    WHEN "1" THEN "Victory"
    WHEN "2" THEN "Defeat"
    WHEN "3" THEN "Compromise"
    WHEN "4" THEN "Tranfomed into Another War Type"
    WHEN "5" THEN "Ongoing as of 31-12-2010"
    WHEN "6" THEN "Stalemate"
    WHEN "7" THEN "Continuing conflict below war level"
    WHEN "8" THEN "Changed Sides"
    ELSE "Data parse error"
    END AS verdict
CREATE (f)-[:RESULTED]->(r:Result{outcome:verdict})-[:RESULT_FOR]->(state)
CREATE (r)-[:RESULT_OF]->(war);
RETURN "Import of exp_iwpart.csv was successful. File 6 of 6 files from Gleditsch's expanded system data, 15 of 24 total files.";
// End Interstate War participation

MATCH (:Source{project:"Gleditsch Expanded Data"})-[:PROVIDES]->(d:Dataset)-[:CONTRIBUTES]->(f:Fact), (w:Week)
  WHERE w.began <= f.from <= w.ended
MERGE (f)-[:FROM_WEEK]->(w);

MATCH (:Source{project:"Gleditsch Expanded Data"})-[:PROVIDES]->(d:Dataset)-[:CONTRIBUTES]->(f:Fact), (w:Week)
  WHERE w.began <= f.until <= w.ended
MERGE (f)-[:UNTIL_WEEK]->(w);

// Beyond this point the dbms.memory.heap.max_size must be greater than 1G.