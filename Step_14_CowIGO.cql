// Reviewed,    updated 14 SEP 2018; includes named facts
// ################################################################################################################### //
// ## The script below is for importing the state-to-IGO relationships from the IGO_stateunit data.                 ## //
// ## It's isolated down here because it's nearly 8,000 lines long.                                                 ## //
// ## There is a small script (19 lines) for each column of IGO data. It does not create connections for missing or ## //
// ## null relations.                                                                                               ## //
// ## There are 529 columns of IGOs,    so the 19-line script runs 529 times,    once for each IGO.                       ## //

// The data model follows the same pattern as other fact, subject, object year datasets.
// (PC1)-[c]-(fact1)<-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]-(state)           
//           (fact2)<-[c]-(PC2)
// (year)-[]-/     \-[:WITHIN_ORGANIZATION]-(IGO)-[FORMED]-/      \-[FORMED_WITHIN]->(system)
//
MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AAAID"})
WITH *,
  CASE row.AAAID
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AAAID) > -1 THEN [1] ELSE [] END | 
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
    subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membershipCode:row.AAAID,
    membership:membership,
    during:toInteger(row.year)
})-[:DURING{during:toInteger(row.year)}]->(p) 
  CREATE (s)-[m:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i) );

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AAB"})
WITH *,
  CASE row.AAB
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AAB) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membershipCode:row.AAB,
    membership:membership, during:toInteger(row.year)})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[m:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AACB"})
WITH *,
  CASE row.AACB
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN row.AACB <> "-1" AND row.AACB <> "-9" THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AACB})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AACarib"})
WITH *,
  CASE row.AACarib
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AACarib) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AACarib})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AALCO"})
WITH *,
  CASE row.AALCO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AALCO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AALCO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AARO"})
WITH *,
  CASE row.AARO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AARO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AARO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AATA"})
WITH *,
  CASE row.AATA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AATA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AATA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AATPO"})
WITH *,
  CASE row.AATPO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AATPO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AATPO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ABEDA"})
WITH *,
  CASE row.ABEDA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ABEDA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ABEDA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ABEPSEAC"})
WITH *,
  CASE row.ABEPSEAC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ABEPSEAC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ABEPSEAC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ACC"})
WITH *,
  CASE row.ACC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ACC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ACC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ACCT"})
WITH *,
  CASE row.ACCT
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ACCT) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ACCT})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);
MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ACDT"})
WITH *,
  CASE row.ACDT
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ACDT) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ACDT})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ACI"})
WITH *,
  CASE row.ACI
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ACI) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ACI})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ACML"})
WITH *,
  CASE row.ACML
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ACML) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ACML})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ACP"})
WITH *,
  CASE row.ACP
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ACP) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ACP})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ACPEU"})
WITH *,
  CASE row.ACPEU
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ACPEU) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ACPEU})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ACS"})
WITH *,
  CASE row.ACS
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ACS) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ACS})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ACSO"})
WITH *,
  CASE row.ACSO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ACSO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ACSO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ACSSRB"})
WITH *,
  CASE row.ACSSRB
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ACSSRB) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ACSSRB})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ACU"})
WITH *,
  CASE row.ACU
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ACU) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ACU})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ACWL"})
WITH *,
  CASE row.ACWL
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ACWL) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ACWL})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AFESD"})
WITH *,
  CASE row.AFESD
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AFESD) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AFESD})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AFEXIMB"})
WITH *,
  CASE row.AFEXIMB
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AFEXIMB) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AFEXIMB})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AFGEC"})
WITH *,
  CASE row.AFGEC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AFGEC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AFGEC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AFPU"})
WITH *,
  CASE row.AFPU
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AFPU) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AFPU})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AFRAND"})
WITH *,
  CASE row.AFRAND
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AFRAND) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AFRAND})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AFSPC"})
WITH *,
  CASE row.AFSPC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AFSPC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AFSPC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AFTE"})
WITH *,
  CASE row.AFTE
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AFTE) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AFTE})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AGC"})
WITH *,
  CASE row.AGC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AGC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AGC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AGPUNDO"})
WITH *,
  CASE row.AGPUNDO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AGPUNDO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AGPUNDO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AIC"})
WITH *,
  CASE row.AIC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AIC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AIC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AIDC"})
WITH *,
  CASE row.AIDC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AIDC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AIDC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AIDO"})
WITH *,
  CASE row.AIDO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AIDO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AIDO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AIOEC"})
WITH *,
  CASE row.AIOEC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AIOEC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AIOEC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AIPO"})
WITH *,
  CASE row.AIPO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AIPO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AIPO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AITIC"})
WITH *,
  CASE row.AITIC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AITIC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AITIC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ALO"})
WITH *,
  CASE row.ALO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ALO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ALO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AMCO"})
WITH *,
  CASE row.AMCO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AMCO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AMCO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AMCOW"})
WITH *,
  CASE row.AMCOW
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AMCOW) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AMCOW})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AMF"})
WITH *,
  CASE row.AMF
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AMF) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AMF})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AMIPO"})
WITH *,
  CASE row.AMIPO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AMIPO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AMIPO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AMPTU"})
WITH *,
  CASE row.AMPTU
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AMPTU) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AMPTU})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AMSC"})
WITH *,
  CASE row.AMSC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AMSC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AMSC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AMU"})
WITH *,
  CASE row.AMU
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AMU) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AMU})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ANZUS"})
WITH *,
  CASE row.ANZUS
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ANZUS) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ANZUS})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AOAD"})
WITH *,
  CASE row.AOAD
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AOAD) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AOAD})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AOCRS"})
WITH *,
  CASE row.AOCRS
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AOCRS) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AOCRS})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AOMR"})
WITH *,
  CASE row.AOMR
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AOMR) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AOMR})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AOPU"})
WITH *,
  CASE row.AOPU
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AOPU) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AOPU})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AP"})
WITH *,
  CASE row.AP
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AP) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AP})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"APCC"})
WITH *,
  CASE row.APCC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.APCC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.APCC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"APEC"})
WITH *,
  CASE row.APEC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.APEC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.APEC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"APFIC"})
WITH *,
  CASE row.APFIC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.APFIC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.APFIC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"APIBD"})
WITH *,
  CASE row.APIBD
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.APIBD) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.APIBD})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"APO"})
WITH *,
  CASE row.APO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.APO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.APO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"APPA"})
WITH *,
  CASE row.APPA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.APPA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.APPA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"APT"})
WITH *,
  CASE row.APT
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.APT) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.APT})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"APTU"})
WITH *,
  CASE row.APTU
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.APTU) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.APTU})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ARC"})
WITH *,
  CASE row.ARC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ARC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ARC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ARCAL"})
WITH *,
  CASE row.ARCAL
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ARCAL) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ARCAL})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ARIPO"})
WITH *,
  CASE row.ARIPO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ARIPO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ARIPO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ARPU"})
WITH *,
  CASE row.ARPU
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ARPU) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ARPU})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ASATP"})
WITH *,
  CASE row.ASATP
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ASATP) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ASATP})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ASBLAC"})
WITH *,
  CASE row.ASBLAC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ASBLAC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ASBLAC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ASCBC"})
WITH *,
  CASE row.ASCBC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ASCBC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ASCBC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ASCRubber"})
WITH *,
  CASE row.ASCRubber
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ASCRubber) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ASCRubber})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ASEAN"})
WITH *,
  CASE row.ASEAN
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ASEAN) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ASEAN})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ASECNA"})
WITH *,
  CASE row.ASECNA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ASECNA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ASECNA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ASEF"})
WITH *,
  CASE row.ASEF
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ASEF) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ASEF})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ASPAC"})
WITH *,
  CASE row.ASPAC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ASPAC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ASPAC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ATO"})
WITH *,
  CASE row.ATO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ATO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ATO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ATPC"})
WITH *,
  CASE row.ATPC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ATPC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ATPC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AU"})
WITH *,
  CASE row.AU
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AU) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AU})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AVRDC"})
WITH *,
  CASE row.AVRDC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AVRDC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AVRDC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AfDB"})
WITH *,
  CASE row.AfDB
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AfDB) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AfDB})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AfrOPDA"})
WITH *,
  CASE row.AfrOPDA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AfrOPDA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AfrOPDA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"Africare"})
WITH *,
  CASE row.Africare
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.Africare) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.Africare})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AmCC"})
WITH *,
  CASE row.AmCC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AmCC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AmCC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"Andean"})
WITH *,
  CASE row.Andean
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.Andean) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.Andean})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AralSea"})
WITH *,
  CASE row.AralSea
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AralSea) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AralSea})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ArticC"})
WITH *,
  CASE row.ArticC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ArticC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ArticC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"AsDB"})
WITH *,
  CASE row.AsDB
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.AsDB) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.AsDB})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"BALTBAT"})
WITH *,
  CASE row.BALTBAT
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.BALTBAT) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.BALTBAT})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"BC"})
WITH *,
  CASE row.BC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.BC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.BC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"BCSC"})
WITH *,
  CASE row.BCSC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.BCSC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.BCSC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"BEF"})
WITH *,
  CASE row.BEF
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.BEF) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.BEF})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"BEN"})
WITH *,
  CASE row.BEN
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.BEN) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.BEN})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"BENELUX"})
WITH *,
  CASE row.BENELUX
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.BENELUX) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.BENELUX})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"BESCC"})
WITH *,
  CASE row.BESCC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.BESCC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.BESCC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"BIISEF"})
WITH *,
  CASE row.BIISEF
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.BIISEF) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.BIISEF})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"BIONET"})
WITH *,
  CASE row.BIONET
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.BIONET) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.BIONET})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"BIPM"})
WITH *,
  CASE row.BIPM
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.BIPM) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.BIPM})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"BIS"})
WITH *,
  CASE row.BIS
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.BIS) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.BIS})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"BNDP"})
WITH *,
  CASE row.BNDP
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.BNDP) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.BNDP})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"BOBP"})
WITH *,
  CASE row.BOBP
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.BOBP) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.BOBP})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"BONN"})
WITH *,
  CASE row.BONN
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.BONN) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.BONN})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"BSEC"})
WITH *,
  CASE row.BSEC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.BSEC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.BSEC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CAAD"})
WITH *,
  CASE row.CAAD
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CAAD) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CAAD})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CAARC"})
WITH *,
  CASE row.CAARC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CAARC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CAARC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CAB"})
WITH *,
  CASE row.CAB
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CAB) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CAB})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CABI"})
WITH *,
  CASE row.CABI
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CABI) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CABI})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CACB"})
WITH *,
  CASE row.CACB
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CACB) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CACB})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CACI"})
WITH *,
  CASE row.CACI
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CACI) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CACI})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CAEC"})
WITH *,
  CASE row.CAEC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CAEC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CAEC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CAECC"})
WITH *,
  CASE row.CAECC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CAECC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CAECC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CAIPA"})
WITH *,
  CASE row.CAIPA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CAIPA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CAIPA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CAMES"})
WITH *,
  CASE row.CAMES
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CAMES) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CAMES})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CAMRSD"})
WITH *,
  CASE row.CAMRSD
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CAMRSD) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CAMRSD})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CAMSF"})
WITH *,
  CASE row.CAMSF
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CAMSF) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CAMSF})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CARICOM"})
WITH *,
  CASE row.CARICOM
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CARICOM) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CARICOM})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CARIFTA"})
WITH *,
  CASE row.CARIFTA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CARIFTA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CARIFTA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CARII"})
WITH *,
  CASE row.CARII
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CARII) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CARII})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CATC"})
WITH *,
  CASE row.CATC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CATC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CATC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CBFP"})
WITH *,
  CASE row.CBFP
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CBFP) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CBFP})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CBI"})
WITH *,
  CASE row.CBI
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CBI) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CBI})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CBSS"})
WITH *,
  CASE row.CBSS
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CBSS) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CBSS})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CCNR"})
WITH *,
  CASE row.CCNR
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CCNR) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CCNR})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CCOM"})
WITH *,
  CASE row.CCOM
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CCOM) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CCOM})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CCPA"})
WITH *,
  CASE row.CCPA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CCPA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CCPA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CComm"})
WITH *,
  CASE row.CComm
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CComm) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CComm})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CDB"})
WITH *,
  CASE row.CDB
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CDB) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CDB})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CEAO"})
WITH *,
  CASE row.CEAO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CEAO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CEAO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CEC"})
WITH *,
  CASE row.CEC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CEC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CEC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CEEPN"})
WITH *,
  CASE row.CEEPN
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CEEPN) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CEEPN})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CEFTA"})
WITH *,
  CASE row.CEFTA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CEFTA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CEFTA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CEI"})
WITH *,
  CASE row.CEI
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CEI) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CEI})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CELC"})
WITH *,
  CASE row.CELC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CELC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CELC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CEMAC"})
WITH *,
  CASE row.CEMAC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CEMAC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CEMAC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CENTO"})
WITH *,
  CASE row.CENTO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CENTO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CENTO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CEPGL"})
WITH *,
  CASE row.CEPGL
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CEPGL) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CEPGL})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CERN"})
WITH *,
  CASE row.CERN
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CERN) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CERN})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CFATF"})
WITH *,
  CASE row.CFATF
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CFATF) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CFATF})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CFC"})
WITH *,
  CASE row.CFC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CFC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CFC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CHSTEA"})
WITH *,
  CASE row.CHSTEA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CHSTEA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CHSTEA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CICA"})
WITH *,
  CASE row.CICA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CICA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CICA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CIFC"})
WITH *,
  CASE row.CIFC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CIFC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CIFC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CIMA"})
WITH *,
  CASE row.CIMA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CIMA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CIMA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CIS"})
WITH *,
  CASE row.CIS
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CIS) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CIS})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CMAEC"})
WITH *,
  CASE row.CMAEC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CMAEC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CMAEC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CMAOC"})
WITH *,
  CASE row.CMAOC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CMAOC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CMAOC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CMEA"})
WITH *,
  CASE row.CMEA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CMEA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CMEA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CMHASG"})
WITH *,
  CASE row.CMHASG
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CMHASG) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CMHASG})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"COE"})
WITH *,
  CASE row.COE
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.COE) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.COE})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"COLOMBO"})
WITH *,
  CASE row.COLOMBO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.COLOMBO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.COLOMBO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"COMESA"})
WITH *,
  CASE row.COMESA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.COMESA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.COMESA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CONFEJES"})
WITH *,
  CASE row.CONFEJES
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CONFEJES) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CONFEJES})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"COPTAC"})
WITH *,
  CASE row.COPTAC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.COPTAC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.COPTAC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"COSAVE"})
WITH *,
  CASE row.COSAVE
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.COSAVE) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.COSAVE})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"COrg"})
WITH *,
  CASE row.COrg
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.COrg) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.COrg})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CP"})
WITH *,
  CASE row.CP
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CP) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CP})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CPAB"})
WITH *,
  CASE row.CPAB
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CPAB) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CPAB})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CPSC"})
WITH *,
  CASE row.CPSC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CPSC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CPSC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CPU"})
WITH *,
  CASE row.CPU
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CPU) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CPU})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CSLF"})
WITH *,
  CASE row.CSLF
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CSLF) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CSLF})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CTCAf"})
WITH *,
  CASE row.CTCAf
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CTCAf) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CTCAf})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CTO"})
WITH *,
  CASE row.CTO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CTO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CTO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CWGC"})
WITH *,
  CASE row.CWGC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CWGC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CWGC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CXC"})
WITH *,
  CASE row.CXC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CXC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CXC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"CfRN"})
WITH *,
  CASE row.CfRN
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.CfRN) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.CfRN})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ComAB"})
WITH *,
  CASE row.ComAB
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ComAB) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ComAB})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ComSec"})
WITH *,
  CASE row.ComSec
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ComSec) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ComSec})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"DBGLS"})
WITH *,
  CASE row.DBGLS
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.DBGLS) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.DBGLS})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"DLCOEA"})
WITH *,
  CASE row.DLCOEA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.DLCOEA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.DLCOEA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"Danube"})
WITH *,
  CASE row.Danube
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.Danube) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.Danube})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"EACM"})
WITH *,
  CASE row.EACM
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.EACM) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.EACM})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"EACS"})
WITH *,
  CASE row.EACS
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.EACS) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.EACS})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"EACSO"})
WITH *,
  CASE row.EACSO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.EACSO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.EACSO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"EADB"})
WITH *,
  CASE row.EADB
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.EADB) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.EADB})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"EAPC"})
WITH *,
  CASE row.EAPC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.EAPC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.EAPC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"EAPO"})
WITH *,
  CASE row.EAPO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.EAPO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.EAPO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"EBRD"})
WITH *,
  CASE row.EBRD
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.EBRD) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.EBRD})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ECB"})
WITH *,
  CASE row.ECB
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ECB) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ECB})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ECCA"})
WITH *,
  CASE row.ECCA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ECCA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ECCA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ECCAS"})
WITH *,
  CASE row.ECCAS
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ECCAS) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ECCAS})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ECCB"})
WITH *,
  CASE row.ECCB
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ECCB) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ECCB})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ECCD"})
WITH *,
  CASE row.ECCD
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ECCD) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ECCD})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ECCM"})
WITH *,
  CASE row.ECCM
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ECCM) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ECCM})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ECCPIF"})
WITH *,
  CASE row.ECCPIF
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ECCPIF) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ECCPIF})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ECO"})
WITH *,
  CASE row.ECO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ECO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ECO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ECOWAS"})
WITH *,
  CASE row.ECOWAS
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ECOWAS) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ECOWAS})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ECPTA"})
WITH *,
  CASE row.ECPTA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ECPTA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ECPTA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ECSC"})
WITH *,
  CASE row.ECSC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ECSC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ECSC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"EEC"})
WITH *,
  CASE row.EEC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.EEC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.EEC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"EFCC"})
WITH *,
  CASE row.EFCC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.EFCC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.EFCC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"EFILWC"})
WITH *,
  CASE row.EFILWC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.EFILWC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.EFILWC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"EFTA"})
WITH *,
  CASE row.EFTA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.EFTA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.EFTA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"EIB"})
WITH *,
  CASE row.EIB
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.EIB) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.EIB})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"EIPA"})
WITH *,
  CASE row.EIPA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.EIPA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.EIPA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ELDO"})
WITH *,
  CASE row.ELDO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ELDO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ELDO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"EMB"})
WITH *,
  CASE row.EMB
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.EMB) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.EMB})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"EMBC"})
WITH *,
  CASE row.EMBC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.EMBC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.EMBC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"EMBL"})
WITH *,
  CASE row.EMBL
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.EMBL) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.EMBL})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"EMI"})
WITH *,
  CASE row.EMI
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.EMI) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.EMI})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"EMPPO"})
WITH *,
  CASE row.EMPPO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.EMPPO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.EMPPO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"EPA"})
WITH *,
  CASE row.EPA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.EPA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.EPA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"EPFSC"})
WITH *,
  CASE row.EPFSC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.EPFSC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.EPFSC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"EPO"})
WITH *,
  CASE row.EPO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.EPO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.EPO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"EPU"})
WITH *,
  CASE row.EPU
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.EPU) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.EPU})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ESA"})
WITH *,
  CASE row.ESA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ESA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ESA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ESO"})
WITH *,
  CASE row.ESO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ESO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ESO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ESRO"})
WITH *,
  CASE row.ESRO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ESRO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ESRO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ETF"})
WITH *,
  CASE row.ETF
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ETF) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ETF})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"EU"})
WITH *,
  CASE row.EU
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.EU) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.EU})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"EUFMD"})
WITH *,
  CASE row.EUFMD
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.EUFMD) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.EUFMD})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"EURATOM"})
WITH *,
  CASE row.EURATOM
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.EURATOM) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.EURATOM})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"EUROCONTROL"})
WITH *,
  CASE row.EUROCONTROL
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.EUROCONTROL) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.EUROCONTROL})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"EUROFIMA"})
WITH *,
  CASE row.EUROFIMA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.EUROFIMA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.EUROFIMA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"EUROMET"})
WITH *,
  CASE row.EUROMET
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.EUROMET) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.EUROMET})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"Entente"})
WITH *,
  CASE row.Entente
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.Entente) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.Entente})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"FAO"})
WITH *,
  CASE row.FAO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.FAO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.FAO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"FAPED"})
WITH *,
  CASE row.FAPED
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.FAPED) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.FAPED})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"FDIPLAC"})
WITH *,
  CASE row.FDIPLAC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.FDIPLAC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.FDIPLAC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"FEC"})
WITH *,
  CASE row.FEC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.FEC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.FEC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"G15"})
WITH *,
  CASE row.G15
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.G15) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.G15})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"G24"})
WITH *,
  CASE row.G24
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.G24) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.G24})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"G3"})
WITH *,
  CASE row.G3
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.G3) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.G3})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"GATT"})
WITH *,
  CASE row.GATT
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.GATT) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.GATT})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"GBACT"})
WITH *,
  CASE row.GBACT
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.GBACT) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.GBACT})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"GCC"})
WITH *,
  CASE row.GCC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.GCC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.GCC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"GCRSNC"})
WITH *,
  CASE row.GCRSNC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.GCRSNC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.GCRSNC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"GEF"})
WITH *,
  CASE row.GEF
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.GEF) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.GEF})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"GEO"})
WITH *,
  CASE row.GEO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.GEO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.GEO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"GHSI"})
WITH *,
  CASE row.GHSI
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.GHSI) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.GHSI})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"GLACSEC"})
WITH *,
  CASE row.GLACSEC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.GLACSEC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.GLACSEC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"GOIC"})
WITH *,
  CASE row.GOIC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.GOIC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.GOIC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"GRBDO"})
WITH *,
  CASE row.GRBDO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.GRBDO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.GRBDO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"HCPIL"})
WITH *,
  CASE row.HCPIL
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.HCPIL) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.HCPIL})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IABE"})
WITH *,
  CASE row.IABE
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IABE) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IABE})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IABath"})
WITH *,
  CASE row.IABath
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IABath) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IABath})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IACB"})
WITH *,
  CASE row.IACB
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IACB) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IACB})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IACI"})
WITH *,
  CASE row.IACI
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IACI) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IACI})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IACS"})
WITH *,
  CASE row.IACS
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IACS) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IACS})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IACSS"})
WITH *,
  CASE row.IACSS
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IACSS) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IACSS})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IACW"})
WITH *,
  CASE row.IACW
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IACW) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IACW})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IADB"})
WITH *,
  CASE row.IADB
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IADB) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IADB})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IADefB"})
WITH *,
  CASE row.IADefB
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IADefB) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IADefB})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IAEA"})
WITH *,
  CASE row.IAEA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IAEA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IAEA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IAFC"})
WITH *,
  CASE row.IAFC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IAFC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IAFC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IAHC"})
WITH *,
  CASE row.IAHC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IAHC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IAHC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IAIAS"})
WITH *,
  CASE row.IAIAS
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IAIAS) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IAIAS})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IAIC"})
WITH *,
  CASE row.IAIC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IAIC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IAIC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IAIGC"})
WITH *,
  CASE row.IAIGC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IAIGC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IAIGC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IAII"})
WITH *,
  CASE row.IAII
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IAII) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IAII})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IALong"})
WITH *,
  CASE row.IALong
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IALong) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IALong})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IAMLO"})
WITH *,
  CASE row.IAMLO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IAMLO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IAMLO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IAPhy"})
WITH *,
  CASE row.IAPhy
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IAPhy) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IAPhy})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IARA"})
WITH *,
  CASE row.IARA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IARA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IARA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IARHC"})
WITH *,
  CASE row.IARHC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IARHC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IARHC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IARadiO"})
WITH *,
  CASE row.IARadiO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IARadiO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IARadiO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IARuhr"})
WITH *,
  CASE row.IARuhr
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IARuhr) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IARuhr})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IAS"})
WITH *,
  CASE row.IAS
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IAS) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IAS})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IASAJ"})
WITH *,
  CASE row.IASAJ
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IASAJ) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IASAJ})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IATB"})
WITH *,
  CASE row.IATB
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IATB) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IATB})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IATSJ"})
WITH *,
  CASE row.IATSJ
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IATSJ) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IATSJ})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IATTC"})
WITH *,
  CASE row.IATTC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IATTC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IATTC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IBA"})
WITH *,
  CASE row.IBA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IBA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IBA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IBCS"})
WITH *,
  CASE row.IBCS
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IBCS) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IBCS})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IBE"})
WITH *,
  CASE row.IBE
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IBE) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IBE})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IBEC"})
WITH *,
  CASE row.IBEC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IBEC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IBEC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IBI"})
WITH *,
  CASE row.IBI
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IBI) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IBI})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IBIER"})
WITH *,
  CASE row.IBIER
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IBIER) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IBIER})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IBPMP"})
WITH *,
  CASE row.IBPMP
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IBPMP) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IBPMP})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IBRD"})
WITH *,
  CASE row.IBRD
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IBRD) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IBRD})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ICAC"})
WITH *,
  CASE row.ICAC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ICAC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ICAC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ICAI"})
WITH *,
  CASE row.ICAI
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ICAI) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ICAI})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ICAO"})
WITH *,
  CASE row.ICAO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ICAO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ICAO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ICAmO"})
WITH *,
  CASE row.ICAmO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ICAmO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ICAmO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ICC"})
WITH *,
  CASE row.ICC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ICC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ICC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ICCEC"})
WITH *,
  CASE row.ICCEC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ICCEC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ICCEC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ICCILMB"})
WITH *,
  CASE row.ICCILMB
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ICCILMB) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ICCILMB})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ICCO"})
WITH *,
  CASE row.ICCO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ICCO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ICCO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ICCROM"})
WITH *,
  CASE row.ICCROM
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ICCROM) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ICCROM})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ICCS"})
WITH *,
  CASE row.ICCS
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ICCS) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ICCS})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ICCSLT"})
WITH *,
  CASE row.ICCSLT
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ICCSLT) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ICCSLT})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ICDR"})
WITH *,
  CASE row.ICDR
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ICDR) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ICDR})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ICES"})
WITH *,
  CASE row.ICES
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ICES) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ICES})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ICFAM"})
WITH *,
  CASE row.ICFAM
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ICFAM) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ICFAM})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ICHRB"})
WITH *,
  CASE row.ICHRB
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ICHRB) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ICHRB})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ICMMP"})
WITH *,
  CASE row.ICMMP
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ICMMP) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ICMMP})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ICNC"})
WITH *,
  CASE row.ICNC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ICNC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ICNC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ICNWAF"})
WITH *,
  CASE row.ICNWAF
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ICNWAF) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ICNWAF})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ICPRP"})
WITH *,
  CASE row.ICPRP
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ICPRP) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ICPRP})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ICPTU"})
WITH *,
  CASE row.ICPTU
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ICPTU) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ICPTU})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ICRI"})
WITH *,
  CASE row.ICRI
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ICRI) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ICRI})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ICRPBC"})
WITH *,
  CASE row.ICRPBC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ICRPBC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ICRPBC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ICSE"})
WITH *,
  CASE row.ICSE
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ICSE) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ICSE})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ICSEAF"})
WITH *,
  CASE row.ICSEAF
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ICSEAF) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ICSEAF})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ICSG"})
WITH *,
  CASE row.ICSG
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ICSG) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ICSG})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ICTM"})
WITH *,
  CASE row.ICTM
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ICTM) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ICTM})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ICWMD"})
WITH *,
  CASE row.ICWMD
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ICWMD) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ICWMD})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ICfO"})
WITH *,
  CASE row.ICfO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ICfO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ICfO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IChemO"})
WITH *,
  CASE row.IChemO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IChemO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IChemO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ICivDO"})
WITH *,
  CASE row.ICivDO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ICivDO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ICivDO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IComO"})
WITH *,
  CASE row.IComO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IComO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IComO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IDC"})
WITH *,
  CASE row.IDC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IDC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IDC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IEA"})
WITH *,
  CASE row.IEA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IEA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IEA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IEC"})
WITH *,
  CASE row.IEC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IEC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IEC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IES"})
WITH *,
  CASE row.IES
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IES) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IES})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IEXB"})
WITH *,
  CASE row.IEXB
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IEXB) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IEXB})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IFAD"})
WITH *,
  CASE row.IFAD
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IFAD) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IFAD})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IFC"})
WITH *,
  CASE row.IFC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IFC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IFC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IFCA"})
WITH *,
  CASE row.IFCA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IFCA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IFCA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IGAD"})
WITH *,
  CASE row.IGAD
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IGAD) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IGAD})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IGC"})
WITH *,
  CASE row.IGC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IGC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IGC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IGCC"})
WITH *,
  CASE row.IGCC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IGCC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IGCC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IHO"})
WITH *,
  CASE row.IHO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IHO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IHO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IIA"})
WITH *,
  CASE row.IIA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IIA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IIA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IICom"})
WITH *,
  CASE row.IICom
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IICom) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IICom})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IIE"})
WITH *,
  CASE row.IIE
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IIE) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IIE})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IIF"})
WITH *,
  CASE row.IIF
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IIF) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IIF})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IIWEE"})
WITH *,
  CASE row.IIWEE
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IIWEE) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IIWEE})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IJO"})
WITH *,
  CASE row.IJO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IJO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IJO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ILO"})
WITH *,
  CASE row.ILO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ILO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ILO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ILZSG"})
WITH *,
  CASE row.ILZSG
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ILZSG) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ILZSG})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IMBSlav"})
WITH *,
  CASE row.IMBSlav
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IMBSlav) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IMBSlav})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IMC"})
WITH *,
  CASE row.IMC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IMC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IMC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IMF"})
WITH *,
  CASE row.IMF
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IMF) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IMF})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IMI"})
WITH *,
  CASE row.IMI
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IMI) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IMI})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IMO"})
WITH *,
  CASE row.IMO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IMO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IMO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IMSO"})
WITH *,
  CASE row.IMSO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IMSO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IMSO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"INCAP"})
WITH *,
  CASE row.INCAP
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.INCAP) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.INCAP})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"INFOFISH"})
WITH *,
  CASE row.INFOFISH
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.INFOFISH) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.INFOFISH})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"INFSMK"})
WITH *,
  CASE row.INFSMK
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.INFSMK) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.INFSMK})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"INRO"})
WITH *,
  CASE row.INRO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.INRO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.INRO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"INSG"})
WITH *,
  CASE row.INSG
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.INSG) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.INSG})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"INTELSAT"})
WITH *,
  CASE row.INTELSAT
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.INTELSAT) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.INTELSAT})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"INTERPOL"})
WITH *,
  CASE row.INTERPOL
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.INTERPOL) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.INTERPOL})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IOATHRE"})
WITH *,
  CASE row.IOATHRE
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IOATHRE) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IOATHRE})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IOCom"})
WITH *,
  CASE row.IOCom
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IOCom) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IOCom})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IOEz"})
WITH *,
  CASE row.IOEz
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IOEz) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IOEz})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IOLM"})
WITH *,
  CASE row.IOLM
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IOLM) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IOLM})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IOMig"})
WITH *,
  CASE row.IOMig
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IOMig) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IOMig})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IOOC"})
WITH *,
  CASE row.IOOC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IOOC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IOOC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IOPCF"})
WITH *,
  CASE row.IOPCF
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IOPCF) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IOPCF})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IOPH"})
WITH *,
  CASE row.IOPH
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IOPH) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IOPH})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IOcC"})
WITH *,
  CASE row.IOcC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IOcC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IOcC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IPC"})
WITH *,
  CASE row.IPC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IPC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IPC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IPGRI"})
WITH *,
  CASE row.IPGRI
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IPGRI) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IPGRI})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IPI"})
WITH *,
  CASE row.IPI
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IPI) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IPI})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IPedI"})
WITH *,
  CASE row.IPedI
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IPedI) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IPedI})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IPentC"})
WITH *,
  CASE row.IPentC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IPentC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IPentC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IPhyL"})
WITH *,
  CASE row.IPhyL
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IPhyL) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IPhyL})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IPrizeC"})
WITH *,
  CASE row.IPrizeC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IPrizeC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IPrizeC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IRC"})
WITH *,
  CASE row.IRC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IRC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IRC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IRLCS"})
WITH *,
  CASE row.IRLCS
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IRLCS) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IRLCS})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IRO"})
WITH *,
  CASE row.IRO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IRO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IRO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IRSG"})
WITH *,
  CASE row.IRSG
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IRSG) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IRSG})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IRU"})
WITH *,
  CASE row.IRU
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IRU) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IRU})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ISA"})
WITH *,
  CASE row.ISA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ISA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ISA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ISB"})
WITH *,
  CASE row.ISB
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ISB) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ISB})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ISDB"})
WITH *,
  CASE row.ISDB
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ISDB) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ISDB})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ISHREST"})
WITH *,
  CASE row.ISHREST
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ISHREST) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ISHREST})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ISRBC"})
WITH *,
  CASE row.ISRBC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ISRBC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ISRBC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ISUPT"})
WITH *,
  CASE row.ISUPT
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ISUPT) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ISUPT})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ISuC"})
WITH *,
  CASE row.ISuC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ISuC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ISuC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ITC"})
WITH *,
  CASE row.ITC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ITC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ITC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ITCC"})
WITH *,
  CASE row.ITCC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ITCC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ITCC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ITCLE"})
WITH *,
  CASE row.ITCLE
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ITCLE) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ITCLE})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ITPA"})
WITH *,
  CASE row.ITPA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ITPA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ITPA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ITRO"})
WITH *,
  CASE row.ITRO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ITRO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ITRO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ITTO"})
WITH *,
  CASE row.ITTO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ITTO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ITTO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ITU"})
WITH *,
  CASE row.ITU
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ITU) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ITU})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"ITVRC"})
WITH *,
  CASE row.ITVRC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.ITVRC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.ITVRC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IUIC"})
WITH *,
  CASE row.IUIC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IUIC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IUIC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IUPCT"})
WITH *,
  CASE row.IUPCT
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IUPCT) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IUPCT})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IUPIP"})
WITH *,
  CASE row.IUPIP
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IUPIP) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IUPIP})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IUPLAW"})
WITH *,
  CASE row.IUPLAW
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IUPLAW) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IUPLAW})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IUPNVP"})
WITH *,
  CASE row.IUPNVP
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IUPNVP) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IUPNVP})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IUPR"})
WITH *,
  CASE row.IUPR
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IUPR) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IUPR})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IVWO"})
WITH *,
  CASE row.IVWO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IVWO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IVWO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IWSG"})
WITH *,
  CASE row.IWSG
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IWSG) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IWSG})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"IWhale"})
WITH *,
  CASE row.IWhale
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.IWhale) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.IWhale})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"Iocean"})
WITH *,
  CASE row.Iocean
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.Iocean) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.Iocean})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"JALAAO"})
WITH *,
  CASE row.JALAAO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.JALAAO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.JALAAO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"JINR"})
WITH *,
  CASE row.JINR
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.JINR) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.JINR})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"JNOLCRH"})
WITH *,
  CASE row.JNOLCRH
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.JNOLCRH) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.JNOLCRH})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"LACAC"})
WITH *,
  CASE row.LACAC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.LACAC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.LACAC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"LACP"})
WITH *,
  CASE row.LACP
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.LACP) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.LACP})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"LAEO"})
WITH *,
  CASE row.LAEO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.LAEO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.LAEO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"LAFDO"})
WITH *,
  CASE row.LAFDO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.LAFDO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.LAFDO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"LAFTA"})
WITH *,
  CASE row.LAFTA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.LAFTA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.LAFTA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"LAIA"})
WITH *,
  CASE row.LAIA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.LAIA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.LAIA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"LAIEC"})
WITH *,
  CASE row.LAIEC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.LAIEC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.LAIEC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"LATIN"})
WITH *,
  CASE row.LATIN
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.LATIN) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.LATIN})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"LCBC"})
WITH *,
  CASE row.LCBC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.LCBC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.LCBC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"LGIDA"})
WITH *,
  CASE row.LGIDA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.LGIDA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.LGIDA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"LOAS"})
WITH *,
  CASE row.LOAS
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.LOAS) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.LOAS})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"LoN"})
WITH *,
  CASE row.LoN
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.LoN) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.LoN})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"MARRI"})
WITH *,
  CASE row.MARRI
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.MARRI) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.MARRI})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"MCPTTC"})
WITH *,
  CASE row.MCPTTC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.MCPTTC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.MCPTTC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"MCWCASM"})
WITH *,
  CASE row.MCWCASM
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.MCWCASM) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.MCWCASM})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"MEMTTA"})
WITH *,
  CASE row.MEMTTA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.MEMTTA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.MEMTTA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"MFO"})
WITH *,
  CASE row.MFO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.MFO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.MFO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"MIGA"})
WITH *,
  CASE row.MIGA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.MIGA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.MIGA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"MOPAN"})
WITH *,
  CASE row.MOPAN
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.MOPAN) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.MOPAN})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"MRU"})
WITH *,
  CASE row.MRU
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.MRU) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.MRU})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"MWN"})
WITH *,
  CASE row.MWN
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.MWN) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.MWN})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"Mercosur"})
WITH *,
  CASE row.Mercosur
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.Mercosur) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.Mercosur})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"Montreal"})
WITH *,
  CASE row.Montreal
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.Montreal) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.Montreal})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"NACAP"})
WITH *,
  CASE row.NACAP
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.NACAP) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.NACAP})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"NAFO"})
WITH *,
  CASE row.NAFO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.NAFO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.NAFO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"NAFTA"})
WITH *,
  CASE row.NAFTA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.NAFTA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.NAFTA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"NAM"})
WITH *,
  CASE row.NAM
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.NAM) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.NAM})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"NAPPO"})
WITH *,
  CASE row.NAPPO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.NAPPO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.NAPPO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"NASCO"})
WITH *,
  CASE row.NASCO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.NASCO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.NASCO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"NATO"})
WITH *,
  CASE row.NATO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.NATO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.NATO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"NCM"})
WITH *,
  CASE row.NCM
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.NCM) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.NCM})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"NCRR"})
WITH *,
  CASE row.NCRR
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.NCRR) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.NCRR})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"NCTR"})
WITH *,
  CASE row.NCTR
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.NCTR) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.NCTR})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"NDF"})
WITH *,
  CASE row.NDF
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.NDF) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.NDF})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"NEAFC"})
WITH *,
  CASE row.NEAFC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.NEAFC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.NEAFC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"NERC"})
WITH *,
  CASE row.NERC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.NERC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.NERC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"NIB"})
WITH *,
  CASE row.NIB
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.NIB) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.NIB})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"NPAFC"})
WITH *,
  CASE row.NPAFC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.NPAFC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.NPAFC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"NPFSC"})
WITH *,
  CASE row.NPFSC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.NPFSC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.NPFSC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"NRC"})
WITH *,
  CASE row.NRC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.NRC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.NRC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"NTSC"})
WITH *,
  CASE row.NTSC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.NTSC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.NTSC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"NWHF"})
WITH *,
  CASE row.NWHF
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.NWHF) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.NWHF})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"NordC"})
WITH *,
  CASE row.NordC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.NordC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.NordC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"OAPEC"})
WITH *,
  CASE row.OAPEC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.OAPEC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.OAPEC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"OAS"})
WITH *,
  CASE row.OAS
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.OAS) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.OAS})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"OAU"})
WITH *,
  CASE row.OAU
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.OAU) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.OAU})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"OCAM"})
WITH *,
  CASE row.OCAM
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.OCAM) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.OCAM})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"OCAS"})
WITH *,
  CASE row.OCAS
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.OCAS) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.OCAS})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"OCCEDCA"})
WITH *,
  CASE row.OCCEDCA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.OCCEDCA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.OCCEDCA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"OCR"})
WITH *,
  CASE row.OCR
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.OCR) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.OCR})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"OECD"})
WITH *,
  CASE row.OECD
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.OECD) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.OECD})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"OECS"})
WITH *,
  CASE row.OECS
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.OECS) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.OECS})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"OEEC"})
WITH *,
  CASE row.OEEC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.OEEC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.OEEC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"OESAS"})
WITH *,
  CASE row.OESAS
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.OESAS) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.OESAS})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"OIC"})
WITH *,
  CASE row.OIC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.OIC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.OIC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"OIV"})
WITH *,
  CASE row.OIV
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.OIV) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.OIV})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"OMDKR"})
WITH *,
  CASE row.OMDKR
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.OMDKR) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.OMDKR})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"OPANAL"})
WITH *,
  CASE row.OPANAL
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.OPANAL) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.OPANAL})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"OPEC"})
WITH *,
  CASE row.OPEC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.OPEC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.OPEC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"OSCE"})
WITH *,
  CASE row.OSCE
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.OSCE) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.OSCE})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"OSLO"})
WITH *,
  CASE row.OSLO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.OSLO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.OSLO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"OSPAR"})
WITH *,
  CASE row.OSPAR
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.OSPAR) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.OSPAR})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"OTIF"})
WITH *,
  CASE row.OTIF
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.OTIF) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.OTIF})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"PAHC"})
WITH *,
  CASE row.PAHC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.PAHC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.PAHC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"PAHO"})
WITH *,
  CASE row.PAHO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.PAHO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.PAHO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"PAIGH"})
WITH *,
  CASE row.PAIGH
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.PAIGH) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.PAIGH})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"PAP"})
WITH *,
  CASE row.PAP
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.PAP) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.PAP})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"PC"})
WITH *,
  CASE row.PC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.PC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.PC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"PCA"})
WITH *,
  CASE row.PCA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.PCA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.PCA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"PCB"})
WITH *,
  CASE row.PCB
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.PCB) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.PCB})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"PCSP"})
WITH *,
  CASE row.PCSP
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.PCSP) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.PCSP})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"PED"})
WITH *,
  CASE row.PED
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.PED) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.PED})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"PIARC"})
WITH *,
  CASE row.PIARC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.PIARC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.PIARC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"PIBAC"})
WITH *,
  CASE row.PIBAC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.PIBAC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.PIBAC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"PICDCS"})
WITH *,
  CASE row.PICDCS
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.PICDCS) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.PICDCS})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"PICES"})
WITH *,
  CASE row.PICES
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.PICES) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.PICES})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"PICS"})
WITH *,
  CASE row.PICS
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.PICS) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.PICS})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"PIF"})
WITH *,
  CASE row.PIF
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.PIF) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.PIF})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"PIPD"})
WITH *,
  CASE row.PIPD
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.PIPD) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.PIPD})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"PMAESA"})
WITH *,
  CASE row.PMAESA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.PMAESA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.PMAESA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"PSI"})
WITH *,
  CASE row.PSI
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.PSI) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.PSI})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"PSNARCO"})
WITH *,
  CASE row.PSNARCO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.PSNARCO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.PSNARCO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"PTASEA"})
WITH *,
  CASE row.PTASEA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.PTASEA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.PTASEA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"PUASP"})
WITH *,
  CASE row.PUASP
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.PUASP) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.PUASP})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"RASCOM"})
WITH *,
  CASE row.RASCOM
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.RASCOM) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.RASCOM})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"RCAELA"})
WITH *,
  CASE row.RCAELA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.RCAELA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.RCAELA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"RCC"})
WITH *,
  CASE row.RCC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.RCC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.RCC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"RECSA"})
WITH *,
  CASE row.RECSA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.RECSA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.RECSA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"RIMMO"})
WITH *,
  CASE row.RIMMO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.RIMMO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.RIMMO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"RIOPPAH"})
WITH *,
  CASE row.RIOPPAH
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.RIOPPAH) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.RIOPPAH})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"RIOgroup"})
WITH *,
  CASE row.RIOgroup
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.RIOgroup) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.RIOgroup})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"RadioU"})
WITH *,
  CASE row.RadioU
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.RadioU) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.RadioU})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"RepCom"})
WITH *,
  CASE row.RepCom
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.RepCom) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.RepCom})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"SAAFA"})
WITH *,
  CASE row.SAAFA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.SAAFA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.SAAFA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"SAARC"})
WITH *,
  CASE row.SAARC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.SAARC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.SAARC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"SACEP"})
WITH *,
  CASE row.SACEP
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.SACEP) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.SACEP})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"SACU"})
WITH *,
  CASE row.SACU
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.SACU) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.SACU})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"SADC"})
WITH *,
  CASE row.SADC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.SADC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.SADC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"SADCC"})
WITH *,
  CASE row.SADCC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.SADCC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.SADCC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"SAMI"})
WITH *,
  CASE row.SAMI
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.SAMI) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.SAMI})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"SARTC"})
WITH *,
  CASE row.SARTC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.SARTC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.SARTC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"SCA"})
WITH *,
  CASE row.SCA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.SCA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.SCA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"SCAf"})
WITH *,
  CASE row.SCAf
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.SCAf) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.SCAf})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"SCH"})
WITH *,
  CASE row.SCH
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.SCH) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.SCH})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"SCHENGEN"})
WITH *,
  CASE row.SCHENGEN
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.SCHENGEN) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.SCHENGEN})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"SEAMEO"})
WITH *,
  CASE row.SEAMEO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.SEAMEO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.SEAMEO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"SEATO"})
WITH *,
  CASE row.SEATO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.SEATO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.SEATO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"SEGIB"})
WITH *,
  CASE row.SEGIB
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.SEGIB) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.SEGIB})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"SELA"})
WITH *,
  CASE row.SELA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.SELA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.SELA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"SICA"})
WITH *,
  CASE row.SICA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.SICA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.SICA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"SIECA"})
WITH *,
  CASE row.SIECA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.SIECA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.SIECA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"SITTDEC"})
WITH *,
  CASE row.SITTDEC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.SITTDEC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.SITTDEC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"SPC"})
WITH *,
  CASE row.SPC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.SPC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.SPC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"SRDO"})
WITH *,
  CASE row.SRDO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.SRDO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.SRDO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"SWAPU"})
WITH *,
  CASE row.SWAPU
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.SWAPU) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.SWAPU})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"SWPD"})
WITH *,
  CASE row.SWPD
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.SWPD) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.SWPD})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"SugU"})
WITH *,
  CASE row.SugU
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.SugU) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.SugU})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"TARHEC"})
WITH *,
  CASE row.TARHEC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.TARHEC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.TARHEC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"TCRMG"})
WITH *,
  CASE row.TCRMG
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.TCRMG) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.TCRMG})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"TIC"})
WITH *,
  CASE row.TIC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.TIC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.TIC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"Turksoy"})
WITH *,
  CASE row.Turksoy
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.Turksoy) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.Turksoy})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"UASC"})
WITH *,
  CASE row.UASC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.UASC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.UASC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"UBEC"})
WITH *,
  CASE row.UBEC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.UBEC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.UBEC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"UDEAC"})
WITH *,
  CASE row.UDEAC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.UDEAC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.UDEAC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"UEMOA"})
WITH *,
  CASE row.UEMOA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.UEMOA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.UEMOA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"UIUCV"})
WITH *,
  CASE row.UIUCV
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.UIUCV) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.UIUCV})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"UKDWD"})
WITH *,
  CASE row.UKDWD
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.UKDWD) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.UKDWD})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"UMAC"})
WITH *,
  CASE row.UMAC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.UMAC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.UMAC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"UMOA"})
WITH *,
  CASE row.UMOA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.UMOA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.UMOA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"UN"})
WITH *,
  CASE row.UN
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.UN) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.UN})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"UNDROIT"})
WITH *,
  CASE row.UNDROIT
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.UNDROIT) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.UNDROIT})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"UNESCO"})
WITH *,
  CASE row.UNESCO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.UNESCO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.UNESCO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"UNIDO"})
WITH *,
  CASE row.UNIDO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.UNIDO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.UNIDO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"UPU"})
WITH *,
  CASE row.UPU
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.UPU) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.UPU})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"USP"})
WITH *,
  CASE row.USP
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.USP) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.USP})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"VALDIVIA"})
WITH *,
  CASE row.VALDIVIA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.VALDIVIA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.VALDIVIA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"VASAB"})
WITH *,
  CASE row.VASAB
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.VASAB) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.VASAB})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"WAEC"})
WITH *,
  CASE row.WAEC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.WAEC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.WAEC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"WAHC"})
WITH *,
  CASE row.WAHC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.WAHC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.WAHC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"WAHO"})
WITH *,
  CASE row.WAHO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.WAHO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.WAHO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"WARDA"})
WITH *,
  CASE row.WARDA
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.WARDA) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.WARDA})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"WCDC"})
WITH *,
  CASE row.WCDC
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.WCDC) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.WCDC})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"WCO"})
WITH *,
  CASE row.WCO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.WCO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.WCO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"WEU"})
WITH *,
  CASE row.WEU
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.WEU) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.WEU})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"WHO"})
WITH *,
  CASE row.WHO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.WHO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.WHO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"WIPO"})
WITH *,
  CASE row.WIPO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.WIPO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.WIPO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"WMO"})
WITH *,
  CASE row.WMO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.WMO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.WMO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"WNF"})
WITH *,
  CASE row.WNF
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.WNF) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.WNF})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"WPact"})
WITH *,
  CASE row.WPact
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.WPact) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.WPact})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"WTO"})
WITH *,
  CASE row.WTO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.WTO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.WTO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"WTOURO"})
WITH *,
  CASE row.WTOURO
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.WTOURO) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.WTOURO})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

MATCH (d:Dataset{filename:"IGO_stateunit_v2.3.zip"})
LOAD CSV WITH HEADERS FROM "file:///IGO_stateunit_v2.3.csv" AS row
MATCH (s:State{cowcode:row.ccode}),(p:Year{name:row.year}),(i:IGO{name:"Wassen"})
WITH *,
  CASE row.Wassen
    WHEN "1" THEN "Full Member"
    WHEN "2" THEN "Associate Member"
    WHEN "3" THEN "Observer"
    WHEN "0" THEN "Not a Member"
    WHEN "-9" THEN "Missing Data"
    ELSE "Ignore" END AS membership
FOREACH (datum IN CASE WHEN toInteger(row.Wassen) > -1 THEN [1] ELSE [] END |
  CREATE (d)-[:CONTRIBUTES]->(f:Fact:IGOMembershipFact{
    name:"IGO Membership",
  subject:s.name,
    predicate:'MEMBERSHIP',
    object:i.name,
    membership:membership, during:toInteger(row.year),
    membershipCode:row.Wassen})-[:DURING{during:toInteger(row.year)}]->(p)
  CREATE (s)-[:MEMBERSHIP{status:membership, during:toInteger(row.year)}]->(f)-[:WITHIN_ORGANIZATION]->(i)
);

RETURN "Whew! Imported IGO_stateunit_v2.3.csv,
    file 23 of 24";