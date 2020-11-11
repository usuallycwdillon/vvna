CREATE (s:Source{name:"Hex Factory Resolution 4 H3 Hexagonal Grid Tiles",
  version:toFloat(0.9),
  purpose:"Created by the author to facilitate discrete spatial partitioning of territorial extent of world polities.",
  note:"Created by the author using the Uber H3 Hierarchical Hexagonal Discrete Data Grid and Neo4j in the HexFactory class of GEORGE.",
  published:date({year:2019,month:5,day:26})
})-[:PROVIDES]->(:Dataset{
  name:"H3 Addresses of the Coastal Borders of World Oceans",
  purpose:"Created by the author to define the borders of oceans and seas in order to facilitate water transportation between territories.",
  published:date({year:2019,month:5,day:26}),
  filename:"oceans_addresses.csv"
})-[:CONTRIBUTES]->(:Territory{name:"World Oceans", mapKey:"Oceans"})
CREATE (s)-[:PROVIDES]->(:Dataset{
name:"H3 Addresses of the Coastal Borders of the Caspian Sea",
purpose:"Created by the author to define the borders of oceans and seas in order to facilitate water transportation between territories.",
published:date({year:2019,month:5,day:26}),
filename:"caspianSea_addresses.csv"
})-[:CONTRIBUTES]->(:Territory{name:"Caspian Sea", mapKey:"Caspian Sea"})
CREATE (s)-[:PROVIDES]->(:Dataset{
  name:"H3 Addresses of the Coastal Borders of the Black Sea",
  purpose:"Created by the author to define the borders of oceans and seas in order to facilitate water transportation between territories.",
  published:date({year:2019,month:5,day:26}),
  filename:"blackSea_addresses.csv"
})-[:CONTRIBUTES]->(:Territory{name:"Black Sea", mapKey:"Black Sea"});

MATCH (t:Territory{name:"World Oceans"})
LOAD CSV WITH HEADERS FROM "file:///oceans_addresses.csv" AS row
MATCH (h:Tile{address:row.H3Address})
MERGE (t)-[:INCLUDES]->(h)
SET h.population = 0, h.urbanization = 0.0;

MATCH (t:Territory{name:"Black Sea"})
LOAD CSV WITH HEADERS FROM "file:///blackSea_addresses.csv" AS row
MATCH (h:Tile{address:row.H3Address})
MERGE (t)-[:INCLUDES]->(h)
SET h.population = 0, h.urbanization = 0.0;

MATCH (t:Territory{name:"Caspian Sea"})
LOAD CSV WITH HEADERS FROM "file:///caspianSea_addresses.csv" AS row
MATCH (h:Tile{address:row.H3Address})
MERGE (t)-[:INCLUDES]->(h)
SET h.population = 0, h.urbanization = 0.0;

UNWIND ["World Oceans", "Black Sea", "Caspian Sea"] AS w
MATCH (water:Territory{name:w})-[:INCLUDES]->(t:Tile)-[:ABUTS]-(tt:Tile)<-[:INCLUDES]-(tera:Territory)
WHERE water <> tera AND t<>tt
MERGE (b:Border{year:tera.year, subjects:[water.mapKey, tera.mapKey]})
MERGE (water)-[:BORDERS{during:tera.year}]->(b)<-[:BORDERS{during:tera.year}]-(tera)
MERGE (y:Year{name:toString(tera.year)})
MERGE (b)-[:DURING]->(y)


UNWIND [1816, 1880, 1914, 1938, 1945, 1994] AS d
MATCH (t1:Territory{year:d})-[:INCLUDES]->(tt1:Tile)-[:ABUTS]-(tt2:Tile)<-[:INCLUDES]-(t2:Territory{year:d})
  WHERE t1 <> t2 AND tt1 <> tt2
WITH d, [t1.mapKey, t2.mapKey] AS pair ORDER BY pair
WITH DISTINCT pair AS pairs, d
FOREACH (p IN CASE WHEN pairs[0] < pairs[1] THEN [1] ELSE [] END |
  MERGE (b:Border{year:d, subjects:pairs})
  MERGE (y:Year{name:toString(d)})
  MERGE (t0:Territory{mapKey:pairs[0]})
  MERGE (t1:Territory{mapKey:pairs[1]})
  MERGE (b)-[:DURING{during:d}]->(y)
  MERGE (t0)-[:BORDERS{during:d}]->(b)
  MERGE (t1)-[:BORDERS{during:d}]->(b)
)