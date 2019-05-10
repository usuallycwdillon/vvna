//// TODO: COW War Data for Non-state, Extra-state and Intra-state wars.

CREATE (d:Source{
  project:'Correlates of War',
  name:'War Data v4.0',
  version:toFloat(4.0),
  published:date({year:2010, month:3}),
  validFrom:date({year:1816, month:1, day:1}),
  validUntil:date({year:2016, month:12, day:31}),
  citation:'Sarkees, Meredith Reid and Frank Wayman (2010). Resort to War: 1816 - 2007. Washington DC: CQ Press.',
  url:'http://correlatesofwar.org/data-sets/COW-war',
  host:["Meredith Sarkees (Global Women's Leadership in International Security)", 'Frank Wayman (University of Michigan-Dearborn)'],
  poc:['sarkees@sbcglobal.net','fwayman@umich.edu'],
  overview:"The COW Project introduced COW Wars v4.0, 1816-2007 in 2010. The paper 'The COW Typology of War: Defining and Categorizing Wars (Version 4 of the Data)' by Meredith Reid Sarkees gives an overview of the COW war typology, the descriptions of the basic variables, coding rules and some of the changes since 'Resort to Arms.' In March 2010, the New COW War List was released. On June 30, 2010, the Non-State War Data (v4.0) became available. On October 28, 2010, the Intra-State War Data (v4.0) was released. On March 1, 2011, the Inter-State War Data (v4.0) became available online. Finally, we released the Extra-State War Data (v4.0) on December 8, 2011."
})
CREATE (d)-[:DEFINES]->(l4:List{name:'Non-State Wars', warType:'IV'})
CREATE (d)-[:DEFINES]->(:List{name:'Within Non-State Territory', warType:8})-[:SUB_TYPE_OF]->(l4)
CREATE (d)-[:DEFINES]->(:List{name:'Across Non-State BorderRelation', warType:9})-[:SUB_TYPE_OF]->(l4)
CREATE (d)-[:PROVIDES]->(:Dataset{
  name:'Non-State War Data',
  version:toFloat(4.0),
  published:date({year:2010, month:6, day:30}),
  purpose:'Previously, the Correlates of War (COW) Project has examined only wars that involved the government of a member of the interstate system (a state) in one form or another. The inclusion of non-state wars in the data presented here represents an attempt to broaden our understanding of war by including wars between or among non-state entities. Such entities include governments of other types of geopolitical units (GPUs), such as dependencies or non-state autonomous entities, that do not meet the criteria of system membership. They also might involve nonterritorial entities (NTEs) or non-state armed groups (NSAs) that have no defined territorial base.',
  note:'Please note the distinction between the “-8” and “-9” codes as specified in the codebook.',
  url:'http://correlatesofwar.org/data-sets/COW-war/non-state-war-data-1/at_download/file',
  filename:'Non-StateWarData_v4.0.csv',
  bytesize:toInteger(7267)
})
CREATE (d)-[:PROVIDES]->(:File{
  name:'Non-State Wars List',
  version:toFloat(4.0),
  published:date({year:2010, month:6, day:30}),
  purpose:'The list of Non-State Wars.',
  url:'http://correlatesofwar.org/data-sets/COW-war/non-state-wars-list-1/at_download/file',
  filename:'Non-StateWarsList.pdf',
  bytesize:toInteger(95054)
})
CREATE (d)-[:PROVIDES]->(:File{
  name:'Non-State Wars Codebook',
  version:toFloat(4.0),
  published:date({year:2010, month:6, day:30}),
  purpose:'The codebook v4.0 for the Non-State War Data set.',
  url:'http://correlatesofwar.org/data-sets/COW-war/non-state-wars-codebook-1/at_download/file',
  filename:'Non-StateWars_Codebook.pdf',
  bytesize:toInteger(85691)
})
CREATE (d)-[:DEFINES]->(l3:List{name:'Intra-State Wars', warType:'III'})
CREATE (d)-[:DEFINES]->(:List{name:'Civil War', objective:'Central Control', warType:4})-[:SUB_TYPE_OF]->(l3)
CREATE (d)-[:DEFINES]->(:List{name:'Civil War', objective:'Resolve Local Issues', warType:5})-[:SUB_TYPE_OF]->(l3)
CREATE (d)-[:DEFINES]->(:List{name:'Regional Internal War', warType:6})-[:SUB_TYPE_OF]->(l3)
CREATE (d)-[:DEFINES]->(:List{name:'Intercommunal War', warType:7})-[:SUB_TYPE_OF]->(l3)
CREATE (d)-[:PROVIDES]->(:Dataset{
  name:'Intra-State Wars Data',
  version:toFloat(4.1),
  published:date({year:2010, month:10, day:28}),
  note:'Please note the distinction between the “-8” and “-9” codes as specified in the codebook.',
  purpose:'The Correlates of War (COW) Project has utilized a classification of wars that is based upon the status of territorial entities, in particular focusing on those that are classified as members of the inter-state system (referred to as “states”). This dataset encompasses wars that predominantly take place within the recognized territory of a state, or intra-state wars.',
  url:'http://correlatesofwar.org/data-sets/COW-war/intra-state-war-data-v4-1/at_download/file',
  filename:'Intra-StateWarData_v4.1.csv',
  bytesize:toInteger(54987)
})
CREATE (d)-[:PROVIDES]->(:File{
  name:'Intra-State Wars Codebook',
  verion:toFloat(4.0),
  published:date({year:2010, month:10, day:28}),
  purpose:'The codebook v4.0 for the Intra-State War Data set.',
  url:'Intra-StateWars_Codebook.pdf',
  filename:'http://correlatesofwar.org/data-sets/COW-war/intra-state-war-data-codebook/at_download/file',
  bytesize:toInteger(99231)
})
CREATE (d)-[:DEFINES]->(:List{name:'Inter-State Wars', warType:'I'})
CREATE (d)-[:PROVIDES]->(:Dataset{
  name:'Inter-State Wars Data',
  version:toFloat(4.0),
  published:date({year:2011, month:3, day:1}),
  purpose:'The Correlates of War (COW) Project has utilized a classification of wars that is based upon the status of territorial entities, in particular focusing on those that are classified as members of the inter-state system (referred to as “states”). This dataset encompasses wars that take place between or among the recognized states, or inter-state wars.',
  note:'Please note the distinction between the “-8” and “-9” codes as specified in the codebook.',
  url:'http://correlatesofwar.org/data-sets/COW-war/inter-state-war-data/at_download/file',
  filename:'Inter-StateWarData_v4.0.csv',
  bytesize:toInteger(31698)
})
CREATE (d)-[:PROVIDES]->(:File{
  name:'Inter-State Wars List',
  version:toFloat(4.0),
  published:date({year:2011, month:3, day:1}),
  purpose:'The list of Inter-State Wars.',
  url:'http://correlatesofwar.org/data-sets/COW-war/inter-state-wars-list/at_download/file',
  filename:'Inter-StateWarsList.pdf',
  bytesize:toInteger(136717)
})
CREATE (d)-[:PROVIDES]->(:File{
  name:'Inter-State Wars Codebook',
  purpose:'The codebook v4.0 for the Inter-State War Data set.',
  version:toFloat(4.0),
  published:date({year:2011, month:3, day:1}),
  url:'http://correlatesofwar.org/data-sets/COW-war/inter-state-wars-codebook/at_download/file',
  filename:'Inter-StateWars_Codebook.pdf',
  bytesize:toInteger(82241)
})
CREATE (d)-[:DEFINES]->(l2:List{name:'Extra-State Wars', warType:'II'})
CREATE (d)-[:DEFINES]->(:List{name:'Colonial Conflict', warType:2})-[:SUB_TYPE_OF]->(l2)
CREATE (d)-[:DEFINES]->(:List{name:'Imperial War', warType:3})-[:SUB_TYPE_OF]->(l2)
CREATE (d)-[:PROVIDES]->(:Dataset{
  name:'Extra-State Wars Data',
  version:toFloat(4.0),
  published:date({year:2011, month:12, day:8}),
  note:'Please note the distinction between the “-8” and “-9” codes as specified in the codebook.',
  purpose:'The Correlates of War (COW) Project has utilized a classification of wars that is based upon the status of territorial entities, in particular focusing on those that are classified as members of the inter-state system (referred to as “states”). This dataset encompasses wars in the middle category - wars that take place between a state(s) and a nonstate entity outside the borderRelations of the state, or extra-state wars.',
  url:'http://correlatesofwar.org/data-sets/COW-war/extra-state-war-data/at_download/file',
  filename:'Extra-StateWarData_v4.0.csv',
  bytesize:toInteger(23068)
})
CREATE (d)-[:PROVIDES]->(:File{
  name:'Extra-State Wars Codebook',
  version:toFloat(4.0),
  published:date({year:2011, month:12, day:8}),
  purpose:'The codebook v4.0 for the Extra-State War Data set.',
  url:'http://correlatesofwar.org/data-sets/COW-war/extra-state-wars-codebook/at_download/file',
  filename:'Extra-StateWars_Codebook.pdf',
  bytesize:toInteger(106163)
});
CREATE (d)-[:DEFINES]->(:Region{name:'Western Hemisphere'})
CREATE (d)-[:DEFINES]->(:Region{name:'Europe'})
CREATE (d)-[:DEFINES]->(:Region{name:"Africa"})
CREATE (d)-[:DEFINES]->(:Region{name:"Middle East"})
CREATE (d)-[:DEFINES]->(:Region{name:"Asia"})
CREATE (d)-[:DEFINES]->(:Region{name:"Oceana"});

// (PC)-[:CONTRIBUTES]->(:Fact:WarMakingFact)<-[:PARTICIPATED]-(state)
//    \-[:CONTRIBUTES]                      \--[:PARTICIPATED_IN]->(war:War)
//                \->(:Fact:WarFact)<--[:IS_ONE]-------------------/
//                                 \-[:ONE_OF]->(:List{name:<war type>})
// Inter-state Wars
// WarNum WarName             WarType ccode   StateName   Side  StartMonth1 StartDay1 StartYear1  EndMonth1 EndDay1 EndYear1  StartMonth2 StartDay2 StartYear2  EndMonth2 EndDay2 EndYear2  TransFrom WhereFought Initiator
// 1      Franco-Spanish War  1       230     Spain       2     4           7         1823        11        13      1823      -8          -8        -8          -8        -8      -8        503       2           2
// Outcome  TransTo BatDeath  Version
// 2        -8      600       4
MATCH (d:Dataset{filename:'Inter-StateWarData_v4.0.csv'}), (inters:List{name:'Inter-State Wars'})
LOAD CSV WITH HEADERS FROM 'file:///Inter-StateWarData_v4.0.csv' AS row
MERGE (d)-[:CONTRIBUTES]->(f:Fact:WarFact{
  name:'Inter-State War',
  subject:row.WarName,
  predicate:'IS_ONE',
  object:inters.name
  })-[:ONE_OF]->(inters)
MERGE (w:War{cowcode:row.WarNum, name:row.WarName, warType:row.WarType})-[:IS_ONE]->(f)
MERGE (d)-[:CONTRIBUTES]->(wf:Fact:WarParticipationFact{
  subject:row.StateName,
  predicate:'PARTICIPATED',
  object:row.WarName,
  from:date({year:toInteger(row.StartYear1), month:toInteger(row.StartMonth1), day:toInteger(row.StartDay1)}),
  until:date({year:toInteger(row.EndYear1), month:toInteger(row.EndMonth1), day:toInteger(row.EndDay1)})
})-[pi:PARTICIPATED_IN]->(w)
WITH *
MATCH (s:State{cowcode:toString(row.ccode)})
MATCH (whr:Region{name:'Western Hemisphere'})
MATCH (eur:Region{name:'Europe'})
MATCH (afr:Region{name:"Africa"})
MATCH (mer:Region{name:"Middle East"})
MATCH (asr:Region{name:"Asia"})
MATCH (ocr:Region{name:"Oceana"})
CREATE (s)-[p:PARTICIPATED{
  side:row.side,
  from:date({year:toInteger(row.StartYear1), month:toInteger(row.StartMonth1), day:toInteger(row.StartDay1)}),
  until:date({year:toInteger(row.EndYear1), month:toInteger(row.EndMonth1), day:toInteger(row.EndDay1)}),
  initiated:false
}]->(wf)
WITH *,
  CASE row.Outcome
    WHEN '1' THEN 'Winner'
    WHEN '2' THEN 'Loser'
    WHEN '3' THEN 'Compromise/Tie'
    WHEN '4' THEN 'The war transformed into another type of war'
    WHEN '5' THEN 'The war is ongoing of 12/31/2007'
    WHEN '6' THEN 'Stalemate'
    WHEN '7' THEN 'Conflict continues at below war level'
    WHEN '8' THEN 'changed sides'
    ELSE 'Unknown'
  END AS outcome
FOREACH (val IN CASE WHEN row.WhereFought = '1' THEN [1] ELSE [] END | MERGE (wf)-[:OCCURED_IN]->(whr))
FOREACH (val IN CASE WHEN row.WhereFought = '2' THEN [1] ELSE [] END | MERGE (wf)-[:OCCURED_IN]->(eur))
FOREACH (val IN CASE WHEN row.WhereFought = '4' THEN [1] ELSE [] END | MERGE (wf)-[:OCCURED_IN]->(afr))
FOREACH (val IN CASE WHEN row.WhereFought = '6' THEN [1] ELSE [] END | MERGE (wf)-[:OCCURED_IN]->(mer))
FOREACH (val IN CASE WHEN row.WhereFought = '7' THEN [1] ELSE [] END | MERGE (wf)-[:OCCURED_IN]->(asr))
FOREACH (val IN CASE WHEN row.WhereFought = '9' THEN [1] ELSE [] END | MERGE (wf)-[:OCCURED_IN]->(ocr))
FOREACH (val IN CASE WHEN row.WhereFought = '11' THEN [1] ELSE [] END |
  MERGE (wf)-[:OCCURED_IN]->(mer)
  MERGE (wf)-[:OCCURED_IN]->(eur)
)
FOREACH (val IN CASE WHEN row.WhereFought = '12' THEN [1] ELSE [] END |
  MERGE (wf)-[:OCCURED_IN]->(asr)
  MERGE (wf)-[:OCCURED_IN]->(eur)
)
FOREACH (val IN CASE WHEN row.WhereFought = '13' THEN [1] ELSE [] END |
  MERGE (wf)-[:OCCURED_IN]->(asr)
  MERGE (wf)-[:OCCURED_IN]->(whr)
)
FOREACH (val IN CASE WHEN row.WhereFought = '14' THEN [1] ELSE [] END |
  MERGE (wf)-[:OCCURED_IN]->(afr)
  MERGE (wf)-[:OCCURED_IN]->(eur)
  MERGE (wf)-[:OCCURED_IN]->(mer)
)
FOREACH (val IN CASE WHEN row.WhereFought = '15' THEN [1] ELSE [] END |
  MERGE (wf)-[:OCCURED_IN]->(afr)
  MERGE (wf)-[:OCCURED_IN]->(eur)
  MERGE (wf)-[:OCCURED_IN]->(mer)
  MERGE (wf)-[:OCCURED_IN]->(asr)
)
FOREACH (val IN CASE WHEN row.WhereFought = '16' THEN [1] ELSE [] END |
  MERGE (wf)-[:OCCURED_IN]->(asr)
  MERGE (wf)-[:OCCURED_IN]->(ocr)
  MERGE (wf)-[:OCCURED_IN]->(afr)
  MERGE (wf)-[:OCCURED_IN]->(mer)
)
FOREACH (val IN CASE WHEN row.WhereFought = '17' THEN [1] ELSE [] END |
  MERGE (wf)-[:OCCURED_IN]->(asr)
  MERGE (wf)-[:OCCURED_IN]->(ocr)
)
FOREACH (val IN CASE WHEN row.WhereFought = '18' THEN [1] ELSE [] END |
  MERGE (wf)-[:OCCURED_IN]->(afr)
  MERGE (wf)-[:OCCURED_IN]->(mer)
)
FOREACH (val IN CASE WHEN row.WhereFought = '19' THEN [1] ELSE [] END |
  MERGE (wf)-[:OCCURED_IN]->(afr)
  MERGE (wf)-[:OCCURED_IN]->(eur)
  MERGE (wf)-[:OCCURED_IN]->(asr)
  MERGE (wf)-[:OCCURED_IN]->(mer)
  MERGE (wf)-[:OCCURED_IN]->(ocr)
)
FOREACH (val IN CASE WHEN toInteger(row.Outcome) >     0 THEN [1] ELSE [] END | SET pi.outcome = outcome )
FOREACH (yer IN CASE WHEN toInteger(row.StartYear2) >  0 THEN [1] ELSE [] END |
  CREATE (s)-[c:CONTINUED]->(wf)
  FOREACH (mon IN CASE WHEN toInteger(row.StartMonth2) > 0 THEN [1] ELSE [] END | SET c.from = date(
    {year:toInteger(row.StartYear2), month:toInteger(row.StartMonth2)}) )
  FOREACH (day IN CASE WHEN toInteger(row.StartDay2) >   0 THEN [1] ELSE [] END | SET c.from = date(
    {year:toInteger(row.StartYear2), month:toInteger(row.StartMonth2), day:toInteger(row.StartDay2)}) )
  FOREACH (mon IN CASE WHEN toInteger(row.EndMonth2) >   0 THEN [1] ELSE [] END | SET c.until = date(
    {year:toInteger(row.EndYear2), month:toInteger(row.EndMonth2)}) )
  FOREACH (day IN CASE WHEN toInteger(row.EndDay2) >     0 THEN [1] ELSE [] END | SET c.until = date(
    {year:toInteger(row.EndYear2), month:toInteger(row.EndMonth2), day:toInteger(row.EndDay2)}) )
)
FOREACH (val IN CASE WHEN toInteger(row.Initiator) <   2 THEN [1] ELSE [] END | SET p.initiated = true )
FOREACH (val IN CASE WHEN toInteger(row.BatDeath) >   -1 THEN [1] ELSE [] END | SET wf.magnitude = toInteger(row.BatDeath));
RETURN "Completed the Inter-StateWarData_v4.0.csv File 22 of 24";

MATCH (:Source)-[:PROVIDES]->(d:Dataset{filename:'Inter-StateWarData_v4.0.csv'})-[:CONTRIBUTES]->(f:Fact), (w:Week)
  WHERE w.began <= f.from <= w.ended
MERGE (f)-[:FROM_WEEK]->(w);

MATCH (:Source)-[:PROVIDES]->(d:Dataset{filename:'Inter-StateWarData_v4.0.csv'})-[:CONTRIBUTES]->(f:Fact), (w:Week)
  WHERE w.began <= f.until <= w.ended
MERGE (f)-[:UNTIL_WEEK]->(w);
// End of Inter-State Wars until it's time to relate them to non-state, intra-state and extra-state wars

// TODO: Revisit this Intra-State date later; too much work to parse this with too little payoff; Gleditsch's data is clean.
//                                          /--[:PARTICIPATED_IN]--------------
//    /-[:CONTRIBUTES]->(:Fact:WarMakingFact)<-[:PARTICIPATED]-(group)        |
// (PC)-[:CONTRIBUTES]->(:Fact:WarMakingFact)<-[:PARTICIPATED]-(state)        |
//    \-[:CONTRIBUTES]                      \--[:PARTICIPATED_IN]->(war:War)<-/
//                \->(:Fact:WarFact)<--[:IS_ONE]-------------------/
//                                 \-[:ONE_OF]->(:List{name:<war type>})
// Intra-state Wars
// WarNum WarName           WarType CcodeA  SideA   CcodeB  SideB                               Intnl StartMonth1 StartDay1 StartYear1  EndMonth1 EndDay1 EndYear1  StartMonth2 StartDay2 StartYear2  EndMonth2 EndDay2 EndYear2
// 500    First Caucasus    5       365     Russia  -8      Georgians, Dhagestania, Chechens    0     6           10        1818        -9        -9      1822      -8          -8        -8          -8        -8      -8
// TransFrom  WhereFought Initiator Outcome TransTo SideADeaths SideBDeaths Version
// -8         2           Chechens  1       -8      5000        6000        4.1
//MATCH (d:Dataset{filename:'Intra-StateWarData_v4.1.csv'})
//LOAD CSV WITH HEADERS FROM 'file:///Intra-StateWarData_v4.1.csv' AS row
//MATCH (l:List{warType:row.WarType})
//MERGE (d)-[:CONTRIBUTES]->(f:Fact:WarFact{name:l.name})-[:ONE_OF]->(l)
//FOREACH (val IN CASE WHEN row.SideA > 0 THEN [1] ELSE [] END |
//  MERGE (d)-[c:CONTRIBUTES{version:toFloat(row.version)}]->(awf:Fact:WarParticipationFact{
//    subject:row.SideA,
//    predicate:'PARTICIPATED_IN',
//    object:row.WarName
//  })-[:PARTICIPATED_IN]->(w:War{cowcode:row.WarNum, name:row.WarName, warType:row.WarType})
//  MERGE (s:State{cowcode:toString(row.CcodeA)})-[:PARTICIPATED]->(awf)
//)
//MERGE (w)-[:IS_ONE]->(f)
//// TODO: split SideA on ',' into list and unwind into nodes
//FOREACH (val IN CASE WHEN row.SideA > 0 AND row.CcodeA < 0 THEN [1] ELSE [] END |
//  MERGE (d)-[c:CONTRIBUTES{version:toFloat(row.version)}]->(awfg:Fact:WarParticipationFact{
//    subject:row.SideA,
//    predicate:'PARTICIPATED_IN',
//    object:row.WarName
//  })-[:PARTICIPATED_IN]->(w:War{cowcode:row.WarNum, name:row.WarName, warType:row.WarType})
//  MERGE (g:NonState{cowcode:toString(row.CcodeA)})-[:PARTICIPATED]->(awfg)
//)
//FOREACH (val IN CASE WHEN row.SideB > 0 THEN [1] ELSE [] END |
//  MERGE (d)-[c:CONTRIBUTES{version:toFloat(row.version)}]->(bwf:Fact:WarParticipationFact{
//    subject:row.SideB,
//    predicate:'PARTICIPATED_IN',
//    object:row.WarName
//  })-[:PARTICIPATED_IN]->(w:War{cowcode:row.WarNum, name:row.WarName, warType:row.WarType})
//  MERGE (s:State{cowcode:toString(row.CcodeB)})-[:PARTICIPATED]->(bwf)
//)
//// TODO: split SideB on ',' into list and unwind into nodes
//FOREACH (val IN CASE WHEN row.SideB > 0 AND row.CcodeB < 0 THEN [1] ELSE [] END |
//  MERGE (d)-[c:CONTRIBUTES{version:toFloat(row.version)}]->(bwfg:Fact:WarParticipationFact{
//    subject:row.SideB,
//    predicate:'PARTICIPATED_IN',
//    object:row.WarName
//  })-[:PARTICIPATED_IN]->(w:War{cowcode:row.WarNum, name:row.WarName, warType:row.WarType})
//  MERGE (g:NonState{cowcode:toString(row.CcodeB)})-[:PARTICIPATED]->(bwfg)
//)
//FOREACH (r IN CASE WHEN row.CcodeA > 0 THEN [1] ELSE [] END |
//  MERGE (s:State{cowcode:row.CcodeA})-[p:PARTICIPATED{
//    side:'A',
//    from:date({year:row.StartYear1}),
//    until:date({year:row.EndYear1})
//  }]->(wf)

// Extra-state Wars
// WarNum WarName                        WarType ccode1  SideA        ccode2  SideB  StartMonth1  StartDay1 StartYear1  EndMonth1 EndDay1 EndYear1  StartMonth2 StartDay2 StartYear2  EndMonth2 EndDay2   EndYear2  Initiator Interven
// 300    Allied Bombardment of Algiers  3       210     Netherlands  -8      -8     8            26        1816        8         30      1816      -8          -8        -8          -8        -8        -8         1        1
// TransFrom  Outcome TransTo WhereFought BatDeath  NonStateDeaths  Version
// -8         1       -8      6           13        -8              4
//MATCH (d:Dataset{filename:'Extra-StateWarData_v4.0.csv'})
//LOAD CSV WITH HEADERS FROM 'Extra-StateWarData_v4.0.csv' AS row
//CREATE (d)-[c:CONTRIBUTES{version:row.version}]->(f:Fact:WarFact{
//name:"Extra-State War",
//
//
//// Non-state Wars
//// WarNum WarName                 WarType WhereFought SideA1                    SideA2  SideB1    SideB2      SideB3    SideB4      SideB5      StartYear StartMonth  StartDay  EndYear EndMonth  EndDay  Initiator TransFrom TransTo
//// 1500   First Maori Tribal War  8       9           Te Rauparaha's Ngati Toa  -8      Taranaki  Ngai Tahu   Waikato   Ngati Ira   Rangitikei  1818      -9          -9        1824    -9        -9      A         -8        -8
//// Outcome  SideADeaths SideBDeaths TotalCombatDeaths Version
//// 1        1500        6000        7500              4
//MATCH (d:Dataset{filename:'Non-StateWarData_v4.0.csv'})
//LOAD CSV WITH HEADERS FROM 'file:///Non-StateWarData_v4.0.csv' AS row
//CREATE (d)-[c:CONTRIBUTES{version:row.version}]->(f:Fact:WarFact{
//name:"Non-State War",


// Collect relationship when one war transforms into another
// MATCH (d:Dataset{filename:'Inter-StateWarData_v4.0.csv'})
// LOAD CSV WITH HEADERS FROM 'file:///Inter-StateWarData_v4.0.csv' AS row
// MATCH (d)-[:CONTRIBUTES]->(wf:Fact:WarFact{
//   subject:row.StateName,
//   predicate:'PARTICIPATED_IN',
//   object:row.WarName
// })-[:PARTICIPATED_IN]->(nw:War{cowode:row.WarNum})
// WITH *
// MATCH (ow:War{cowode:row.TransFrom}), (nw:War{cowode:row.WarNum})
// FOREACH (val IN CASE WHEN row.TransFrom > 0 THEN [1] ELSE [] END |
//   MERGE (d)-[:CONTRIBUTES]->(f:WarParticipationFact)
//   MERGE (ow)-[:TRANSFORMS]->(f)-[:TRANSFORMS_TO]->(nw)
// );