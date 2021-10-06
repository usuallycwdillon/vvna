// Issues Correlates of War, version 1.01 from 2007 data
CREATE (d:Source{
  project:"Issues Correlates of War (ICOW)",
  name:"Issues Correlates of War (ICOW)",
  version:toFloat(1.01),
  published:date({year:2014, month:3, day:30}),
  validFrom:date({year:1816, month:1, day:1}),
  falidUntil:date({year:2000, month:12, day:31}),
  citation:["Paul R. Hensel; Sara M. Mitchell, 2007, `The Issue Correlates of War (ICOW) Project Issue Data Set: Territorial Claims Data`, https://doi.org/10.7910/DVN/E6PSGZ, Harvard Dataverse, V2, UNF:3:AT9Kx7uv+vzYYTZA9Fo35Q== [fileUNF]"],
  host:"Harvard Dataverse, V2",
  poc:"Paul Hensel (phensel@unt.edu)",
  url:"https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/E6PSGZ",
  overview:"The ICOW project is currently collecting data on territorial issues in all regions of the world since 1816, compiled into several related data files."
})
MERGE (d)-[:PROVIDES]->(:Dataset{
  name:"Territorial Claims, Provisional",
  version:toFloat(1.01),
  published:date({year:2014, month:3, day:30}),
  purpose:"These data files cover territorial claims across the entire interstate system between 1816-2001. This includes information on claim participants, claim dates, the salience of the claimed territories, and militarization of these claims.",
  url:"http://www.paulhensel.org/Data/ICOWprov.zip",
  filename:"ICOWprov101.csv"
})
MERGE (d)-[:PROVIDES]->(:Dataset{
  name:"Claims",
  version:toFloat(1.1),
  published:date({year:2017, month:3, day:30}),
  purpose:"This data file primarily includes descriptive information on each claim.",
  url:"http://www.paulhensel.org/Data/ICOWdata.zip",
  filename:"ICOWclaimag.csv"
});

MATCH (d:Dataset{filename:"ICOWprov101.csv"})
LOAD CSV WITH HEADERS FROM "file:///ICOWprov101.csv" AS row
WITH row
MATCH (cs:State{cowcode:toString(row.chal)}),(ts:State{cowcode:toString(row.tgt)})
WITH row, cs, ts,
  CASE row.region
    WHEN "1" THEN "Western Hemisphere"
    WHEN "2" THEN "Europe"
    WHEN "3" THEN "Africa"
    WHEN "4" THEN "Middle East"
    WHEN "5" THEN "Asia and Oceana"
    ELSE "ignore" END AS region,
  CASE row.resolved
    WHEN "1" THEN "Dropped by Challenger"
    WHEN "2" THEN "Renounced by Challenger"
    WHEN "3" THEN "(not used)"
    WHEN "4" THEN "Bilateral"
    WHEN "5" THEN "Independence"
    WHEN "6" THEN "Actor Leaves System"
    WHEN "7" THEN "Military Conquest/Occupation"
    WHEN "8" THEN "Dropped by Target"
    WHEN "9" THEN "Renounced by Target"
    WHEN "10" THEN "Plebiscite"
    WHEN "11" THEN "Claim No Longer Relevant"
    WHEN "12" THEN "Binding Third Party Decision"
    WHEN "13" THEN "Non-binding Third Party Decision"
    WHEN "14" THEN "Peace Conference"
    WHEN "-9" THEN "Ongoing"
    ELSE "missing" END AS resolved,
  CASE row.endviol
    WHEN "1" THEN TRUE
    WHEN "2" THEN FALSE
    WHEN "-9" THEN "Ongoing"
    ELSE "missing" END AS violence,
  CASE toString(row.icowsalc)
    WHEN "1" THEN "Low salience"
    WHEN "2" THEN "Moderate salience"
    WHEN "3" THEN "High salience"
    ELSE "missing" END AS salienceCat    
MERGE (cs)-[:CLAIM{salience:toInteger(row.salchal),intangibleSalience:toInteger(row.salintc)}]->(ccf:ClaimFact:Fact{
  name:toString(row.name),
  subject:cs.name,
  predicate:"CLAIM",
  object:ts.name,
  from:date({year:toInteger(row.begyr),month:toInteger(row.begmo),day:10}),
  until:date({year:toInteger(row.endyr),month:toInteger(row.endmo),day:20}),
  claimdyad:toString(row.claimdy), 
  salience:toInteger(row.salchal),
  resolution:resolved,
  violentResult:violence,
  salience:toInteger(row.icowsal),
  salienceCategory:salienceCat,
  tangibleSalience:toInteger(row.saltan),
  intangibleSalience:toInteger(row.salint),
  MIDSfromIssue:toInteger(row.midsiss),
  fatalMIDSfromIssue:toInteger(row.midsfat),
  warsFromIssue:toInteger(row.warsiss)
  })-[:CLAIM_AGAINST{salience:toInteger(row.saltgt),intangibleSalience:toInteger(row.salintt)}]->(ts)
MERGE (ccf)-[:CLAIM_OF]->(i:Issue{
      claimType:"Territorial",
      region:region,
      claim:toString(row.claim), 
      version:toString(row.version)
      })-[:ISSUE_IN]->(:Region{name:region})<-[:CLAIM_IN]-(ccf);

MATCH (f:ClaimFact) WITH COLLECT(f) AS fs
UNWIND fs AS ccf
MATCH (fw:Week) WHERE fw.began <= ccf.from <= fw.ended
MERGE (ccf)-[:FROM_WEEK]->(fw)
WITH fw, ccf
MATCH (uw:Week) WHERE uw.began <= ccf.until <= uw.ended
MERGE (ccf)-[:UNTIL_WEEK]->(uw)
SET ccf.weeksDuration = uw.stepNumber - fw.stepNumber;

MATCH (f:ClaimFact) WITH COLLECT(f) AS fs
UNWIND fs AS ccf
MERGE (r:Region{name:ccf.region})-[:CLAIM_IN]->(ccf);
