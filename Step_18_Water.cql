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
WITH d, [t1.mapKey, t2.mapKey] AS pair ORDER BY pair[0], pair[1]
WITH DISTINCT pair AS pairs, d
FOREACH (p IN CASE WHEN pairs[0] < pairs[1] THEN [1] ELSE [] END |
  MERGE (b:Border:Institution{year:d, subjects:pairs})
  MERGE (y:Year{name:toString(d)})
  MERGE (b)-[:DURING{during:d}]->(y)
  MERGE (t0:Territory{mapKey:pairs[0]})
  MERGE (t0)-[:BORDERS{during:d}]->(b)
  MERGE (t1:Territory{mapKey:pairs[1]})
  MERGE (t1)-[:BORDERS{during:d}]->(b)
  SET b.name = t0.name + "-" + t1.name + " border of " + y.name
);
MATCH (s:State)-[:OCCUPIED]->(t:Territory)-[:BORDERS]->(b:Border)<-[:BORDERS]-(tt:Territory) WHERE t<>tt
MERGE (s)-[:SHARES_BORDER{during:t.year}]-(bf:BorderFact:Fact{
    name:"Border Fact", subject:s.name, predicate:"SHARES_BORDER", object:tt.name})-[:BORDERS_WITH]->(b)



// After reworking tile mapping and HYDE-GCP validation, a new approach to water territories became necessary.
// test 
// MATCH (t:Territory{name:"Oceans"}) WITH COLLECT(t) AS oceans 
// UNWIND oceans AS ocean 
// WITH ocean, ["842c51dffffffff","842ceadffffffff","842c557ffffffff","842cee7ffffffff","842c623ffffffff","842c539ffffffff","842c757ffffffff","842c72bffffffff","842ce13ffffffff","842c441ffffffff","842cc51ffffffff","842c55bffffffff","842c727ffffffff","842cec9ffffffff","842cf1bffffffff","842ceddffffffff","842c565ffffffff","842c453ffffffff","842c621ffffffff","842c53dffffffff","842ce61ffffffff","842c70bffffffff","842c755ffffffff","842c52dffffffff","842cf5bffffffff","842c567ffffffff","842c443ffffffff","842ceedffffffff","842c445ffffffff","842cc01ffffffff","842cc53ffffffff","842ce53ffffffff","842ce6bffffffff","842cc55ffffffff","842cf13ffffffff","842ce51ffffffff","842ced9ffffffff","842cc6bffffffff","842ce2dffffffff","842c707ffffffff","842c545ffffffff","842c465ffffffff","842c551ffffffff","842c703ffffffff","842c45bffffffff","842cc0dffffffff","842c457ffffffff","842ce47ffffffff","842c561ffffffff","842c637ffffffff","842c721ffffffff","842c6a5ffffffff","842ce65ffffffff","842c459ffffffff","842c515ffffffff","842c62dffffffff","842ce55ffffffff","842c419ffffffff","842c469ffffffff","842c46dffffffff","842c753ffffffff","842c455ffffffff","842cee5ffffffff","842c569ffffffff","842ce43ffffffff","842c5e5ffffffff","842c535ffffffff","842c54dffffffff","842cecdffffffff","842cee9ffffffff","842cc0bffffffff","842ced1ffffffff","842ce25ffffffff","842cc45ffffffff","842c635ffffffff"] AS adds 
// MATCH (ocean)-[i:INCLUDES]->(ti:Tile) WHERE ti.address IN adds
// RETURN count( DISTINCT ti), ocean

MATCH (t:Territory{name:"Oceans"}) WITH COLLECT(t) AS oceans 
UNWIND oceans AS ocean 
CREATE (c:Territory{name:"Caspian Sea", year:ocean.year, mapKey:"Caspian Sea of " + ocean.year, resolution:4})
WITH ocean, c, ["842c51dffffffff","842ceadffffffff","842c557ffffffff","842cee7ffffffff","842c623ffffffff","842c539ffffffff","842c757ffffffff","842c72bffffffff","842ce13ffffffff","842c441ffffffff","842cc51ffffffff","842c55bffffffff","842c727ffffffff","842cec9ffffffff","842cf1bffffffff","842ceddffffffff","842c565ffffffff","842c453ffffffff","842c621ffffffff","842c53dffffffff","842ce61ffffffff","842c70bffffffff","842c755ffffffff","842c52dffffffff","842cf5bffffffff","842c567ffffffff","842c443ffffffff","842ceedffffffff","842c445ffffffff","842cc01ffffffff","842cc53ffffffff","842ce53ffffffff","842ce6bffffffff","842cc55ffffffff","842cf13ffffffff","842ce51ffffffff","842ced9ffffffff","842cc6bffffffff","842ce2dffffffff","842c707ffffffff","842c545ffffffff","842c465ffffffff","842c551ffffffff","842c703ffffffff","842c45bffffffff","842cc0dffffffff","842c457ffffffff","842ce47ffffffff","842c561ffffffff","842c637ffffffff","842c721ffffffff","842c6a5ffffffff","842ce65ffffffff","842c459ffffffff","842c515ffffffff","842c62dffffffff","842ce55ffffffff","842c419ffffffff","842c469ffffffff","842c46dffffffff","842c753ffffffff","842c455ffffffff","842cee5ffffffff","842c569ffffffff","842ce43ffffffff","842c5e5ffffffff","842c535ffffffff","842c54dffffffff","842cecdffffffff","842cee9ffffffff","842cc0bffffffff","842ced1ffffffff","842ce25ffffffff","842cc45ffffffff","842c635ffffffff"] AS adds 
MATCH (ocean)-[i:INCLUDES]->(ti:Tile) WHERE ti.address IN adds
MERGE (c)-[:INCLUDES{during:i.during}]->(ti)
DELETE i

MATCH (t:Territory{name:"Oceans"}) WITH COLLECT(t) AS oceans 
UNWIND oceans AS ocean 
CREATE (c:Territory{name:"Black Sea", year:ocean.year, mapKey:"Black Sea of " + ocean.year, resolution:4})
WITH ocean, c, ["842d22dffffffff","842d267ffffffff","841eeb3ffffffff","842d097ffffffff","841ee93ffffffff","842c253ffffffff","842d24bffffffff","842d0a5ffffffff","841e5bdffffffff","841e5a1ffffffff","842d057ffffffff","842d297ffffffff","842d09bffffffff","84d237ffffffff","841e581ffffffff","842d2c3ffffffff","842d741ffffffff","842d295ffffffff","842d56dffffffff","841e591ffffffff","842d2cbffffffff","842d0adffffffff","842d28dffffffff","842d0e7ffffffff","842d221ffffffff","842d743ffffffff","842d26ffffffff","841ecd1ffffffff","842d75dffffffff","842d761ffffffff","842d72dffffffff","842d749ffffffff","842d2c7ffffffff","842d011ffffffff","841e5a7ffffffff","842d0e9ffffffff","842d05dffffffff","842d223ffffffff","841e587ffffffff","842c24dfffffff","841ecd3ffffffff","842d709ffffffff","841ecd9ffffffff","842d565ffffffff","842d70bffffffff","842c247ffffffff","842d74bffffffff","842c257ffffffff","842d767ffffffff","841e58bffffffff","842d091ffffffff","842d235ffffffff","842d725fffffff","841e5a3ffffffff","842d0e1ffffffff","842d283ffffffff","841e5d7ffffffff","842d1dbffffffff","842d74dffffffff","842c20bffffffff","841e599ffffffff","842d051ffffffff","842d757ffffffff","842c241ffffffff","842d281ffffffff","842d017ffffffff","41e597ffffffff","842d755ffffffff","842c25bffffffff","842c209ffffffff","842d265ffffffff","842d249ffffffff","842d0a7ffffffff","842d019ffffffff","841ee9bffffffff","842d76dffffffff"] AS adds 
MATCH (ocean)-[i:INCLUDES]->(ti:Tile) WHERE ti.address IN adds
MERGE (c)-[:INCLUDES{during:i.during}]->(ti)
DELETE i


UNWIND [1816, 1880, 1914, 1938, 1945, 1994] AS d
MATCH (t1:Territory{year:d})-[:INCLUDES]->(tt1:Tile)-[:ABUTS]-(tt2:Tile)<-[:INCLUDES]-(t2:Territory{year:d})
  WHERE t1 <> t2 AND tt1 <> tt2
WITH d, [t1.mapKey, t2.mapKey] AS pair ORDER BY pair[0], pair[1]
WITH DISTINCT pair AS pairs, d
FOREACH (p IN CASE WHEN pairs[0] < pairs[1] THEN [1] ELSE [] END |
  MERGE (b:Border:Institution{year:d, subjects:pairs})
  MERGE (y:Year{name:toString(d)})
  MERGE (b)-[:DURING{during:d}]->(y)
  MERGE (t0:Territory{mapKey:pairs[0]})
  MERGE (t0)-[:BORDERS{during:d}]->(b)
  MERGE (t1:Territory{mapKey:pairs[1]})
  MERGE (t1)-[:BORDERS{during:d}]->(b)
  SET b.name = t0.name + "-" + t1.name + " border of " + y.name
)

MATCH (s:State)-[:OCCUPIED]->(t:Territory)-[:BORDERS]->(b:Border)<-[:BORDERS]-(tt:Territory) WHERE t<>tt
MERGE (s)-[:SHARES_BORDER{during:t.year}]-(bf:BorderFact:Fact{
    name:"Border Fact", subject:s.name, predicate:"SHARES_BORDER", object:tt.name})-[:BORDERS_WITH]->(b)