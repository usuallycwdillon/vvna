// Reviewed, updated 14 SEP 2018; includes named facts
// Control for filename conflicts in the data imports. This will be true for this and all following datasets.
CREATE CONSTRAINT ON (f:Dataset) ASSERT f.filename IS UNIQUE;

// ####################################################################################################################
// Jack Levy's "Great Power Wars" cover the years 1495-1815. I have munged together data from the OCR(?) text copies of
// Levy's data that can be found at ICPSR and GESIS. The Levy dataset is a smaller than COW data, making it a nice
// dataset to develop the import script and schema data; a recommendation from Claudio Cioffi-Revilla at the beginning
// of this validation project.

// Levy Great Power Wars Metadata
CREATE (s:Source{
  name:"Levy Great Power Wars",
  version:toFloat(1.0),
  published:date({year:1994, month:4}),
  validFrom:date({year:1495, month:1, day:1}),
  validUntil:date({year:1815, month:12, day:31}),
  citation:"Levy, Jack S. Great Power Wars, 1495-1815. Ann Arbor, MI: Inter-university Consortium for Political and Social Research [distributor], 1994-05-20. https://doi.org/10.3886/ICPSR09955.v1",
  host:"ICPSR",
  url:["https://www.icpsr.umich.edu/icpsrweb/ICPSR/studies/9955","https://dbk.gesis.org/dbksearch/sdesc2.asp?no=8119&db=e&doi=10.4232/1.8119"],
  overview:"This study identifies 'great power' wars, i.e., major-minor wars, or those involving at least one great power on each side. In order to exclude protracted conflicts with low levels of fighting, an annual average of 1,000 battle deaths was required for inclusion in this collection. Great powers are defined as countries or states that play a major role in international politics with respect to security-related issues. Such powers must have a high level of military capability relative to other states and be able to project military power beyond their borderRelations with the option of using force, or the threat of force, to help shape their external environment. They play a large role in international organizations and politics and are perceived as great powers by other members of the international community. Variables in this collection include the duration of each war, its severity in terms of the number of battle-connected deaths, the extent of the war (defined as the number of great powers participating in the fighting), magnitude of the war (combining extent and duration indicators), and the concentration of war (the ratio of severity to magnitude).",
  purpose:"All wars from 1495 to 1815 in which the sum of fatalities for all participants was at least 1,000."
})
CREATE (s)-[:PROVIDES]->(:Dataset{
  name:"Great Power System",
  version:toFloat(1.0),
  published:date({year:1994, month:4}),
  note:"This data file represents this author's recreation of J. Levy's data from ICPSR 09955-0001-Codebook.txt and GESIS ZA9119.dta files. The bulk of Levy's war data is missing from the ICPSR archives (DS10 Diskette D00154 download file is missing/not linked).",
  purpose:"Identify the great powers in the system from 1495-1815.",
  url:["https://www.icpsr.umich.edu/icpsrweb/ICPSR/studies/9955","https://dbk.gesis.org/dbksearch/sdesc2.asp?no=8119&db=e&doi=10.4232/1.8119"],
  filename:"Levy_GPW_system.csv"
})
CREATE (s)-[:PROVIDES]->(:Dataset{
  name:"Great Power Wars Participation",
  version:toFloat(1.0),
  published:date({year:1994, month:4}),
  note:"This data file represents this author's recreation of J. Levy's data from ICPSR 09955-0001-Codebook.txt and GESIS ZA9119.dta files.",
  purpose:"Identify the dates at which great powers began and finished wars. One line per power, per entry/exit, per war.",
  url:["https://www.icpsr.umich.edu/icpsrweb/ICPSR/studies/9955","https://dbk.gesis.org/dbksearch/sdesc2.asp?no=8119&db=e&doi=10.4232/1.8119"],
  filename:"Levy_GPW_participation_data.csv"
})
CREATE (s)-[:PROVIDES]->(:Dataset{
  name:"Great Power Wars",
  version:toFloat(1.0),
  published:date({year:1994, month:4}),
  note:"This data file represents this author's recreation of J. Levy's data from ICPSR 09955-0001-Codebook.txt and GESIS ZA9119.dta files.",
  purpose:"Data about each war that was fought between the great powers.",
  url:["https://www.icpsr.umich.edu/icpsrweb/ICPSR/studies/9955","https://dbk.gesis.org/dbksearch/sdesc2.asp?no=8119&db=e&doi=10.4232/1.8119"],
  filename:"Levy_GPW_war_data.csv"
})
CREATE (d)-[:PROVIDES]->(:File{
  name:"Great Power Wars Codebook",
  version:toFloat(1.0),
  published:date({year:1994, month:4}),
  note:"Text document that contains the bulk of Levy's great power war data.",
  purpose:"Document and describe the war data, including bibliographic sources for each war.",
  url:"https://www.icpsr.umich.edu/icpsrweb/ICPSR/studies/9955/datadocumentation",
  filename:"09955-0001-Codebook.txt"
});


// Following the model described above, my graph schema for the Levy Great Power system looks like this:
//
// (PC)-[:CONTRIBUTES{asOf:date()}]->(:Fact{from, until})<-[:MEMBER]-(state:State)
//                                                       \-[:MEMBER_OF]-(system:System)<-[:DEFINES]-(source:Source)

MATCH (source:Source{name:"Levy Great Power Wars"})
CREATE (source)-[:DEFINES {
  asOf:date({year:1994, month:4})
}]->(:System {
  name:"Great Power System", scope:"Global",
  from:date({year:1495, month:1, day:1}),
  until:date({year:1815, month:12, day:31})
});

CREATE CONSTRAINT ON (gp:GreatPower) ASSERT gp.levycode IS UNIQUE;

// Identify the members of the system and when they were members
MATCH (gp:System{name:"Great Power System"})
MATCH (df:Dataset{filename:"Levy_GPW_system.csv"})
LOAD CSV WITH HEADERS FROM "file:///Levy_GPW_system.csv" AS row
MERGE (state:GreatPower{
  name:row.State,
  levycode:row.levyStNum
})
CREATE (df)-[:CONTRIBUTES{asOf:date({year:1994, month:4})}]->(f:Fact:MembershipFact{
  name:"System Membership",
  source:"Levy Great Power Wars",
  from:date({year:toInteger(row.GreatPowerFrom)}),
  until:date({year:toInteger(row.GreatPowerTo)}),
  subject:row.State,
  predicate:"MEMBER",
  object:gp.name
})
MERGE (state)-[:MEMBER{
  from:date({year:toInteger(row.GreatPowerFrom)}),
  until:date({year:toInteger(row.GreatPowerTo)})
  }]->(f)-[:MEMBER_OF]->(gp)
FOREACH (specific IN CASE WHEN trim(row.cowcode) <> "" THEN [1] ELSE [] END | SET state.cowRelation = row.cowcode);
RETURN "Import of Levy_GPW_system.csv was successful. File 1 of 3 Levy files, 1 of  total files.";

// End of Levy_GPW_system.csv


// Levy differentiates begin/end of wars and begin/end of wars as GPW; wars have a from/until date as GPW which may be
// different than the first from/until date of states' participation in it. There are multiple facts: when the war was a
// GPW, when each state participated in the war.
// The model looks like this:
//
// (PC)-[:CONTRIBUTES]->(:Fact)<-[:PARTICIPATED]-(state)
//    \-[:CONTRIBUTES]         \-[:PARTICIPATED_IN]->(war:War:GreatPowerWar)
//                \->(:Fact)<--[:IS_ONE]----------/
//                         \-[:ONE_OF]->(:List{name:"Great Power Wars"})
// More generically,
//
// (PC)-[:CONTRIBUTES]->(:Fact:WarParticipationFact)<-[:PARTICIPATED]-(state)
//    \-[:CONTRIBUTES]                      \--[:PARTICIPATED_IN]->(war:War)
//                   \->(:Fact:WarFact)<--[:IS_ONE]----------------/
//                                    \-[:ONE_OF]->(:List{name:<war type>})
//
// warnum,warname,factName,ybegan,mthbegan,daybegan,yrend,mthend,dayend, yrgpw,mthgpw,daygpw,yrgpwe,mthgpwe,daygpwe,
// extent,durwar,durgpw,magnitud,severity,concent

CREATE CONSTRAINT ON (war:War) ASSERT war.levycode IS UNIQUE;
MATCH (source:Source{name:"Levy Great Power Wars"})
CREATE (source)-[:DEFINES]->(g:List{name:"Great Power Wars"})
CREATE (source)-[:DEFINES]->(w:List{name:"Wars"})
WITH g, w
MATCH (d:Dataset{filename:"Levy_GPW_war_data.csv"})
LOAD CSV WITH HEADERS FROM "file:///Levy_GPW_war_data.csv" AS row
CREATE (war:War:GreatPowerWar{
  levycode:row.warnum,
  name:row.warname
})
CREATE (d)-[:CONTRIBUTES]->(gf:Fact:WarFact{
  name:"Great Power War",
  from:date({year:toInteger(row.yrgpw), month:toInteger(row.mthgpw)}),
  until:date({year:toInteger(trim(row.yrgpwe)), month:toInteger(trim(row.mthgpwe))}),
  description:row.factName,
  numParticipants:toInteger(row.extent),
  durationMonths:toFloat(row.durgpw),
  participantMonths:toFloat(row.magnitud),
  magnitude:toFloat(row.severity),
  concentration:toFloat(row.concent),
  subject:row.warname,
  predicate:'IS_ONE',
  object:g.name
})-[go:ONE_OF]->(g)
CREATE (d)-[:CONTRIBUTES]->(wf:Fact:WarFact{
  name:"War",
  from:date({year:toInteger(row.ybegan), month:toInteger(row.mthbegan)}),
  until:date({year:toInteger(row.yrend), month:toInteger(row.mthend)}),
  description:row.factName,
  numParticipants:toInteger(row.extent),
  durationMonths:toFloat(row.durwar),
  participantMonths:toFloat(row.magnitud),
  magnitude:toFloat(row.severity),
  concentration:toFloat(row.concent),
  subject:row.warname,
  predicate:'IS_ONE',
  object:w.name
})-[wo:ONE_OF]->(w)
FOREACH (specific IN CASE WHEN trim(row.daybegan) <> "" THEN [1] ELSE [] END | 
  SET wf.from = date({year:toInteger(row.ybegan), month:toInteger(row.mthbegan), day:toInteger(row.daybegan)}))
FOREACH (specific IN CASE WHEN trim(row.dayend) <> "" THEN [1] ELSE [] END | 
  SET wf.until = date({year:toInteger(row.yrend), month:toInteger(row.mthend), day:toInteger(row.dayend)}))
FOREACH (specific IN CASE WHEN trim(row.daygpw) <> "" THEN [1] ELSE [] END | 
  SET gf.from = date({year:toInteger(row.yrgpw), month:toInteger(row.mthgpw), day:toInteger(row.daygpw)}))
FOREACH (specific IN CASE WHEN trim(row.daygpwe) <> "" THEN [1] ELSE [] END | 
  SET gf.until = date({year:toInteger(row.yrgpwe), month:toInteger(row.mthgpwe), day:toInteger(row.daygpwe)}))
CREATE (war)-[gio:IS_ONE{
  from:date({year:toInteger(row.yrgpw), month:toInteger(row.mthgpw)}),
  until:date({year:toInteger(trim(row.yrgpwe)), month:toInteger(trim(row.mthgpwe))})
}]->(gf)
CREATE (war)-[wio:IS_ONE{
  from:date({year:toInteger(row.ybegan), month:toInteger(row.mthbegan)}),
  until:date({year:toInteger(row.yrend), month:toInteger(row.mthend)})
}]->(wf)
WITH row, wio, gio
FOREACH (specific IN CASE WHEN trim(row.daybegan) <> "" THEN [1] ELSE [] END | 
  SET wio.from = date({year:toInteger(row.ybegan), month:toInteger(row.mthbegan), day:toInteger(row.daybegan)}))
FOREACH (specific IN CASE WHEN trim(row.dayend) <> "" THEN [1] ELSE [] END | 
  SET wio.until = date({year:toInteger(row.yrend), month:toInteger(row.mthend), day:toInteger(row.dayend)}))
FOREACH (specific IN CASE WHEN trim(row.daygpw) <> "" THEN [1] ELSE [] END | 
  SET gio.from = date({year:toInteger(row.yrgpw), month:toInteger(row.mthgpw), day:toInteger(row.daygpw)}))
FOREACH (specific IN CASE WHEN trim(row.daygpwe) <> "" THEN [1] ELSE [] END | 
  SET gio.until = date({year:toInteger(row.yrgpwe), month:toInteger(row.mthgpwe), day:toInteger(row.daygpwe)}));
RETURN "Import of GPW_war_data.csv was successful. Files 2 of 3 Levy files, 2 of 24 total files.";

// Levy war participation (when GPs participated in wars)
MATCH (d:Dataset{filename:"Levy_GPW_participation_data.csv"})
LOAD CSV WITH HEADERS FROM "file:///Levy_GPW_participation_data.csv" AS row
WITH d, row
MATCH (war:War{levycode:row.warnum})
CREATE (d)-[:CONTRIBUTES]->(p:Fact:WarParticipationFact{name:"Participation",
                                   from:date({year:toInteger(row.ybegan), month:toInteger(row.mthbegan), day:toInteger(row.daybegan)}),
                                   until:date({year:toInteger(row.yrend), month:toInteger(row.mthend), day:toInteger(row.dayend)}),
                                   durationMonths:toFloat(row.durwar),
                                   magnitude:toFloat(row.severity),
                                   concentration:toFloat(row.concent),
                                   subject:row.State,
                                   predicate:"PARTICIPATED",
                                   object:war.name
})-[:PARTICIPATED_IN]->(war)
WITH p, row
MATCH (state:GreatPower{levycode:row.stnum})
MERGE (state)-[:PARTICIPATED]->(p);
MATCH (:Source{name:"Levy Great Power Wars"})-[:PROVIDES]->(d:Dataset)-[:CONTRIBUTES]->(f:Fact), (w:Week)
  WHERE w.began <= f.from <= w.ended
MERGE (f)-[:FROM_WEEK]->(w);
MATCH (:Source{name:"Levy Great Power Wars"})-[:PROVIDES]->(d:Dataset)-[:CONTRIBUTES]->(f:Fact), (w:Week)
  WHERE w.began <= f.until <= w.ended
MERGE (f)-[:UNTIL_WEEK]->(w);
// end Levy_GPW_participation_data.csv
RETURN "Import of Levy_GPW_participation_data.csv was successful. Files 3 of 3 Levy files; file 3 of 24";
// end Levy source
RETURN "All of the Levy data has been imported into the graph.";