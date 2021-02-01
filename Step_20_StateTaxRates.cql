CREATE (d:Dataset{name:"State Initial Tax Rates",
  note:"The NMC MILEX divided by the computed annual gross tile production",
  filename:"calcd-taxrate.csv"})
WITH d
LOAD CSV WITH HEADERS FROM "file:///calcd-taxrate.csv" AS row
WITH row, d
MATCH (s:State{cowcode:row.cowcode}), (y:Year{name:toString(row.yr)})
WITH row, d, s, y
MERGE (d)-[:CONTRIBUTES]->(f:TaxRateFact{
	subject:s.name,
	predicate:"SIM_TAX_RATE",
    object:toString(row.yr),
    value:toFloat(row.rate)})-[:DURING{year:row.yr}]->(y)
MERGE (s)-[:SIM_TAX_RATE{during:row.yr}]->(f)