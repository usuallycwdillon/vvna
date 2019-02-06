// Created 9 DEC 2018
// ####################################################################################################################
// Polity IV data to indicate the economic, defense and social policies of states


// Polity IV Metadata
CREATE (d:Source{
  project:'Polity IV Project',
  name:'State System Membership',
  version:toInteger(2017),
  published:date({year:2018, month:10, day:28}),
  validFrom:date({year:1800, month:1, day:1}),
  validUntil:date({year:2016, month:12, day:31}),
  citation:'Polity IV: Regime Authority Characteristics and Transition Datasets. Online, http://www.systemicpeace.org/inscrdata.html',
  url:'http://www.systemicpeace.org/inscrdata.html',
  host:['Monty G. Marshall (Center for Systemic Peace and Social Systems Research)'],
  poc:'Center for Systemic Peace (contact@systemicpeace.org)',
  overview:'Polity IV Project, Political Regime Characteristics and Transitions, 1800-2017, annual, cross-national, time-series and polity-case formats coding democratic and autocratic `patterns of authority` and regime changes in all independent countries with total pax greater than 500,000 in 2017 (167 countries in 2017) (SPSS and Excel data; PDF codebook) Click here for the list of changes made during the year 2017 annual data update (SPSS and Excel file; PDF codebook).',
  purpose:'The PolityIV project continues the Polity research tradition of coding the authority characteristics of states in the world system for purposes of comparative, quantitative analysis.'
})
CREATE (d)-[:PROVIDES]->(:File{
  name:"Dataset Users' Manual",
  version:toInteger(2017),
  published:date({year:2018, month:10, day:28}),
  purpose:'The Polity I  Codebook, dataset, and narrative summaries of the political chronologies for each polity,with source lists,were deposited with and subsequently distributed bythe Inter-University Consortium for Political and Social Research(Gurr and Associates,1978).',
  url:'http://www.systemicpeace.org/inscr/p4manualv2017.pdf',
  filename:'p4manualv2017.pdf'
})
CREATE (d)-[:PROVIDES]->(:Dataset{
  name:'Polity IV Time-series',
  version:toInteger(2016),
  published:date({year:2017, month:2, day:27}),
  purpose:'Provides the entry and exit dates of states, country codes, and abbreviations.',
  url:'http://www.systemicpeace.org/inscr/p4v2017.xls',
  filename:'p4v2017.xls'
})
CREATE (d)-[:PROVIDES]->(:Dataset{
  name:'Polity IV Discrete',
  version:toInteger(2016),
  published:date({year:2017, month:2, day:27}),
  purpose:"The Polity IVd data set contains the same basic regime authority information as the PolityIV time-series data, but in a format in which the 'polity-case' (rather than the 'country-year') is the unit of analysis. That is, each observation (case) gives information for a polity over a discreet time period during which the scores on all ofthe component variables remain unchanged.",
  url:'http://www.systemicpeace.org/inscr/p4v2017d.xls',
  filename:'p4v2017d.xls'
});

// (PC)-[:CONTRIBUTES{asOf:date()}]->(:DiscretePolityFact{from, until})-[:DESCRIBES_POLITY_OF{}]->(state:State)

MATCH (d:Dataset{filename:'p4v2017d.xls'})
LOAD CSV WITH HEADERS FROM 'file:///p4v2016d.csv' AS row
WITH *,
  CASE row.polity
    WHEN '-88' THEN 'Transition Period'
    WHEN '-77' THEN 'Interregnum or Anarchy'
    WHEN '-66' THEN 'Interruption'
    ELSE 'rated' END AS polityDisposition,
  CASE row.democ
    WHEN '-88' THEN 'Transition Period'
    WHEN '-77' THEN 'Interregnum or Anarchy'
    WHEN '-66' THEN 'Interruption'
    ELSE 'rated' END AS democDisposition,
  CASE row.autoc
    WHEN '-88' THEN 'Transition Period'
    WHEN '-77' THEN 'Interregnum or Anarchy'
    WHEN '-66' THEN 'Interruption'
    ELSE 'rated' END AS autocDisposition,
  CASE row.xrreg
    WHEN '-88' THEN 'Transition Period'
    WHEN '-77' THEN 'Interregnum or Anarchy'
    WHEN '-66' THEN 'Interruption'
    WHEN '1' THEN 'Unregulated'
    WHEN '2' THEN 'Designated/Transitional'
    WHEN '3' THEN 'Regulated'
    ELSE 'Missing' END AS xrregDisposition,
  CASE row.xrcomp
    WHEN '-88' THEN 'Transition Period'
    WHEN '-77' THEN 'Interregnum or Anarchy'
    WHEN '-66' THEN 'Interruption'
    WHEN '1' THEN 'Selected'
    WHEN '2' THEN 'Dual/Transitional'
    WHEN '3' THEN 'Election'
    ELSE 'Missing' END AS xrcompDisposition,
  CASE row.xropen
    WHEN '-88' THEN 'Transition Period'
    WHEN '-77' THEN 'Interregnum or Anarchy'
    WHEN '-66' THEN 'Interruption'
    WHEN '1' THEN 'Closed'
    WHEN '2' THEN 'Dual Executive by Designation'
    WHEN '3' THEN 'Dual Executive by Election'
    WHEN '4' THEN 'Open'
    ELSE 'Missing' END AS xropenDisposition,
  CASE row.xconst
    WHEN '-88' THEN 'Transition Period'
    WHEN '-77' THEN 'Interregnum or Anarchy'
    WHEN '-66' THEN 'Interruption'
    WHEN '1' THEN 'Unlimited Authority'
    WHEN '2' THEN 'Intermediate: Unlimited-Slight'
    WHEN '3' THEN 'Slight-Moderate Limitations'
    WHEN '4' THEN 'Intermediate: Moderate-Substantial'
    WHEN '5' THEN 'Substantial Limitations'
    WHEN '6' THEN 'Intermediate: Substantial-Parity or Subordination'
    WHEN '7' THEN 'Executive Parity or Subordination'
    ELSE 'Missing' END AS xconstDisposition,
  CASE row.parreg
    WHEN '-88' THEN 'Transition Period'
    WHEN '-77' THEN 'Interregnum or Anarchy'
    WHEN '-66' THEN 'Interruption'
    WHEN '1' THEN 'Unregulated'
    WHEN '2' THEN 'Multiple Identity'
    WHEN '3' THEN 'Sectarian'
    WHEN '4' THEN 'Restricted'
    WHEN '5' THEN 'Regulated'
    ELSE 'Missing' END AS parregDisposition,
  CASE row.parcomp
    WHEN '-88' THEN 'Transition Period'
    WHEN '-77' THEN 'Interregnum or Anarchy'
    WHEN '-66' THEN 'Interruption'
    WHEN '0' THEN 'Not Applicable'
    WHEN '1' THEN 'Repressed'
    WHEN '2' THEN 'Suppressed'
    WHEN '3' THEN 'Factional'
    WHEN '4' THEN 'Transitional'
    WHEN '5' THEN 'Competitive'
    ELSE 'Missing' END AS parcompDisposition,
  CASE row.exrec
    WHEN '-88' THEN 'Transition Period'
    WHEN '-77' THEN 'Interregnum or Anarchy'
    WHEN '-66' THEN 'Interruption'
    WHEN '1' THEN 'Selection through ascription'
    WHEN '2' THEN 'Dual executive: ascription and designation'
    WHEN '3' THEN 'Selection through designation'
    WHEN '4' THEN 'Selection through self-selection'
    WHEN '5' THEN 'Executive-guided Transition'
    WHEN '6' THEN 'Dual executive: ascription and election'
    WHEN '7' THEN 'Transitional or Restricted election'
    WHEN '8' THEN 'Competitive election'
    ELSE 'Missing' END AS exrecDisposition,
  CASE row.exconst
    WHEN '1' THEN 'Unlimited executive authority'
    WHEN '2' THEN 'Transition: Unlimited-Slight'
    WHEN '3' THEN 'Slight-Moderate'
    WHEN '4' THEN 'Transition: Moderate-Substantial'
    WHEN '5' THEN 'Substantial limitations'
    WHEN '6' THEN 'Transition: Substantial-Parity'
    WHEN '7' THEN 'Executive parity or subordination'
    ELSE 'Missing' END AS exconstDisposition,
  CASE row.polcomp
    WHEN '-88' THEN 'Transition Period'
    WHEN '-77' THEN 'Interregnum or Anarchy'
    WHEN '-66' THEN 'Interruption'
    WHEN '1' THEN 'Repressed competition'
    WHEN '2' THEN 'Restricted competition'
    WHEN '3' THEN 'Authoritarian-guided liberalization'
    WHEN '4' THEN 'Uninstitutionalized competition'
    WHEN '5' THEN 'Gradual transition from unregulated'
    WHEN '6' THEN 'Factional/Restricted competition'
    WHEN '7' THEN 'Factional competition'
    WHEN '8' THEN 'Persistent overt coercion'
    WHEN '9' THEN 'Limited/decreasing overt coercion'
    WHEN '10' THEN 'Institutionalized open electoral participation'
    ELSE 'Missing' END AS polcompDisposition,
CASE row.present
    WHEN '1' THEN TRUE
    ELSE FALSE END AS workaround
MERGE (d)-[:CONTRIBUTES{asOf:d.published}]->(f:Fact:DiscretePolityFact{
  name:'Polity IV',
  source:'Polity IV Discrete',
  from:date({year:toInteger(row.byear), month:toInteger(row.bmonth), day:toInteger(row.bday)}),
  presentCondition:FALSE
})
MERGE (state:Polity:State{cowcode:row.ccode}) ON CREATE SET state.name = row.country, state.abb = row.scode
CREATE (state)<-[r:DESCRIBES_POLITY_OF{
  from:date({year:toInteger(row.byear), month:toInteger(row.bmonth), day:toInteger(row.bday)}),
  presentCondition:FALSE
}]-(f)
SET f.compositePolityRating=polityDisposition,
f.compositeDemocracyRating=democDisposition,
f.compositeAutocracyRating=autocDisposition,
f.executiveRecruitmentRegulation=xrregDisposition,
f.executiveRecruitmentCompetitiveness=xrcompDisposition,
f.executiveRecruitmentOpenness=xropenDisposition,
f.executiveConstraints=xconstDisposition,
f.participationRegulation=parregDisposition,
f.participationCompetitiveness=parcompDisposition,
f.executiveRecruitmentConcept=exrecDisposition,
f.executiveConstraintsConcept=exconstDisposition,
f.politicalCompetitionConcept=polcompDisposition
FOREACH (val IN CASE WHEN polityDisposition = 'rated' THEN [1] ELSE [] END | SET f.polityScore = toInteger(row.polity) )
FOREACH (val IN CASE WHEN democDisposition = 'rated' THEN  [1] ELSE [] END | SET f.democracyRating = toInteger(row.democ) )
FOREACH (val IN CASE WHEN autocDisposition = 'rated' THEN  [1] ELSE [] END | SET f.autocracyRating = toInteger(row.autoc) )
FOREACH (val IN CASE WHEN toInteger(row.xrreg) > 0 THEN    [1] ELSE [] END | SET f.executiveRecruitmentRegulationRating = toInteger(row.xrreg) )
FOREACH (val IN CASE WHEN toInteger(row.xrcomp) > 0 THEN   [1] ELSE [] END | SET f.executiveRecruitmentCompetitivenessRating = toInteger(row.xrcomp) )
FOREACH (val IN CASE WHEN toInteger(row.xropen) > 0 THEN   [1] ELSE [] END | SET f.executiveRecruitmentOpennessRating = toInteger(row.xropen) )
FOREACH (val IN CASE WHEN toInteger(row.xconst) > 0 THEN   [1] ELSE [] END | SET f.executiveConstraintsRating = toInteger(row.xconst) )
FOREACH (val IN CASE WHEN toInteger(row.parreg) > 0 THEN   [1] ELSE [] END | SET f.participationRegulationRating = toInteger(row.parreg) )
FOREACH (val IN CASE WHEN toInteger(row.parcomp) > 0 THEN  [1] ELSE [] END | SET f.participationCompetitivenessRating = toInteger(row.parcomp) )
FOREACH (val IN CASE WHEN toInteger(row.exrec) > 0 THEN    [1] ELSE [] END | SET f.executiveRecruitmentConceptId = toInteger(row.exrec) )
FOREACH (val IN CASE WHEN toInteger(row.exconst) > 0 THEN  [1] ELSE [] END | SET f.executiveConstraintsConceptId = toInteger(row.exconst) )
FOREACH (val IN CASE WHEN toInteger(row.polcomp) > 0 THEN  [1] ELSE [] END | SET f.politicalCompetitionConceptId = toInteger(row.polcomp) )
FOREACH (val IN CASE WHEN workaround = FALSE THEN [1] ELSE [] END |
  SET f.until = date({year:toInteger(row.eyear), month:toInteger(row.emonth), day:toInteger(row.eday)}),
      f.presentCondition = TRUE,
      r.until = date({year:toInteger(row.eyear), month:toInteger(row.emonth), day:toInteger(row.eday)})
);




