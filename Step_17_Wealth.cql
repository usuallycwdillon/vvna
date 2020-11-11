CREATE (c:Computation{
  name:"Wealth Estimates", 
  description:"Estimated tile wealth computed from Cobb-Douglas formula with total factor of production equal to 1.0",
  timestamp:datetime()})-[:COMPUTES]->(d:Dataset{name:"Estimated Tile Wealth"})

CALL apoc.periodic.iterate(
  "MATCH (tile:Tile)-[pr]-(pf:PopulationFact) WHERE pf.value > 0.0 RETURN DISTINCT tile",
  "MATCH (d:Dataset{name:'Estimated Tile Wealth'})
   WITH tile, d, [1816, 1880, 1914, 1938, 1945, 1994] AS yrs
   UNWIND yrs AS yr
    MATCH (tile)-[pr]-(pf:PopulationFact{during:yr})-[dd:DURING{year:yr}]-(y:Year) WHERE pf.value > 0.0 AND pr.during=yr
    MATCH (tile)-[gr]-(gf:GrossTileProductionFact{during:yr}) WHERE gf.value > 0.0
    OPTIONAL MATCH (tile)-[ur]-(uf:UrbanPopulationFact{during:yr})
    WITH d, y, tile, yr, gf.value AS gtp, pf.value AS pop, uf.value AS upop, pf.value-uf.value AS rpop, 'SIM_WEALTH_' + y.name AS pred
    WITH d, y, tile, yr, pred, gtp, upop, rpop, (rpop*0.65)+(upop*0.75) AS lab, log(gtp) AS logGtp
    WITH d, y, tile, yr, pred, logGtp, 0.75*log(lab) AS aLogL
    MERGE (d)-[:CONTRIBUTES{asOf:datetime()}]->(wf:WealthFact:Fact{
        subject:tile.address,
        predicate:pred,
        object:y.name,
        name:'Estimated Wealth',
        ruralLaborRate:0.65,
        urbanLaborRate:0.75,
        laborElasticity:0.6 + (upop/pop) * 0.1,
        capitalElasticity:4 - (upop/pop) * 0.1,
        value:0.0,
        processed:FALSE
        })-[:DURING{year:yr}]->(y)
        SET wf.value = exp(logGtp-aLogL)/wf.capitalElasticity, wf.processed = TRUE
        FOREACH(yx IN CASE WHEN yr=1816 THEN [1] ELSE [] END | MERGE (tile)-[:SIM_WEALTH_1816{during:1816}]->(wf))
        FOREACH(yx IN CASE WHEN yr=1880 THEN [1] ELSE [] END | MERGE (tile)-[:SIM_WEALTH_1880{during:1880}]->(wf))
        FOREACH(yx IN CASE WHEN yr=1914 THEN [1] ELSE [] END | MERGE (tile)-[:SIM_WEALTH_1914{during:1914}]->(wf))
        FOREACH(yx IN CASE WHEN yr=1938 THEN [1] ELSE [] END | MERGE (tile)-[:SIM_WEALTH_1938{during:1938}]->(wf))
        FOREACH(yx IN CASE WHEN yr=1945 THEN [1] ELSE [] END | MERGE (tile)-[:SIM_WEALTH_1945{during:1945}]->(wf))
        FOREACH(yx IN CASE WHEN yr=1994 THEN [1] ELSE [] END | MERGE (tile)-[:SIM_WEALTH_1994{during:1994}]->(wf))",
        {batchSize:500, parallel:true}
        )

CALL apoc.periodic.iterate(
"MATCH (t:Tile)-[wr]-(wf:WealthFact{processed:FALSE}) RETURN t",
"MATCH (t)-[wr]-(wf:WealthFact{processed:FALSE})-[:DURING]-(y:Year)
 OPTIONAL MATCH (t)-[pr]-(pf:PopulationFact)-[:DURING]-(y)
 OPTIONAL MATCH (t)-[ur]-(uf:UrbanPopulationFact)-[:DURING]-(y)
 OPTIONAL MATCH (t)-[gr]-(gf:GrossTileProductionFact)-[:DURING]-(y)
 WITH wf,
    0.6+((uf.value/pf.value)*0.1) AS b,
    0.4-((uf.value/pf.value)*0.1) AS a,
    (0.65*(pf.value-uf.value))+(0.75*uf.value) AS lab,
    gf.value AS gtp,
    y.weeksThisYear AS weeks
 SET wf.laborElasticity = b,
     wf.capitalElasticity = a,
     wf.value = exp( (log(gtp*weeks)-(b*log(lab*weeks)) )/a) / weeks,
     wf.processed = TRUE ",
     {batchSize:100, parallel:true} )
