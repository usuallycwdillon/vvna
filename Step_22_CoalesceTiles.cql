CREATE CONSTRAINT ON (g:Grid) ASSERT g.address IS UNIQUE;
CALL apoc.periodic.iterate(
  "MATCH (d:Tile{year:2000}) RETURN d.address AS a",
  "MERGE (g:Grid{address:a}) RETURN count(g)",
  {batchSize:500, parallel:true}
)

// batchSize = 48 because: 48 x 26 = 1,248 relations per commit
CALL apoc.periodic.iterate(
  "MATCH (g:Grid) RETURN g",
  "CALL wog.linkGrid2r4Datatiles(g) YIELD value RETURN value",
  {parallel:true, batchMode:'SINGLE', batchSize:1}
) 

// This took 81ms (return in 83ms); expecting all ~422k to take about 23min. 
// CALL wog.dataTileGTPregression("8526f3cffffffff");
CALL apoc.periodic.rock_n_roll(
  "MATCH (g:Grid) RETURN g.address AS a",
  "CALL wog.calculateGTPbyOLS({a}) YIELD value RETURN value",
  100
  );

// Estimate the wealth that tiles can put toward economic production each week
// but, only in the years where the model can start from.
CALL apoc.periodic.iterate(
  "MATCH (t:Tile{year:1816}) RETURN t",
  "CALL wog.estimateTileWealth(t.addressYear) YIELD value RETURN value",
  {batchSize:1, parallel:true, batchMode:'SINGLE'}
  );
CALL apoc.periodic.iterate(
  "MATCH (t:Tile{year:1880}) RETURN t",
  "CALL wog.estimateTileWealth(t.addressYear) YIELD value RETURN value",
  {batchSize:1, parallel:true, batchMode:'SINGLE'}
  );
CALL apoc.periodic.iterate(
  "MATCH (t:Tile{year:1914}) RETURN t",
  "CALL wog.estimateTileWealth(t.addressYear) YIELD value RETURN value",
  {batchSize:1, parallel:true, batchMode:'SINGLE'}
  );
CALL apoc.periodic.iterate(
  "MATCH (t:Tile{year:1938}) RETURN t",
  "CALL wog.estimateTileWealth(t.addressYear) YIELD value RETURN value",
  {batchSize:1, parallel:true, batchMode:'SINGLE'}
  );
CALL apoc.periodic.iterate(
  "MATCH (t:Tile{year:1945}) RETURN t",
  "CALL wog.estimateTileWealth(t.addressYear) YIELD value RETURN value",
  {batchSize:1, parallel:true, batchMode:'SINGLE'}
  );
CALL apoc.periodic.iterate(
  "MATCH (t:Tile{year:1994}) RETURN t",
  "CALL wog.estimateTileWealth(t.addressYear) YIELD value RETURN value",
  {batchSize:1, parallel:true, batchMode:'SINGLE'}
  );
CALL apoc.periodic.iterate(
  "MATCH (t:Tile{year:1800}) RETURN t",
  "CALL wog.estimateTileWealth(t.addressYear) YIELD value RETURN value",
  {batchSize:1, parallel:true, batchMode:'SINGLE'}
  );
CALL apoc.periodic.iterate(
  "MATCH (t:Tile{year:1810}) RETURN t",
  "CALL wog.estimateTileWealth(t.addressYear) YIELD value RETURN value",
  {batchSize:1, parallel:true, batchMode:'SINGLE'}
  );
CALL apoc.periodic.iterate(
  "MATCH (t:Tile{year:1820}) RETURN t",
  "CALL wog.estimateTileWealth(t.addressYear) YIELD value RETURN value",
  {batchSize:1, parallel:true, batchMode:'SINGLE'}
  );
CALL apoc.periodic.iterate(
  "MATCH (t:Tile{year:1830}) RETURN t",
  "CALL wog.estimateTileWealth(t.addressYear) YIELD value RETURN value",
  {batchSize:1, parallel:true, batchMode:'SINGLE'}
  );
CALL apoc.periodic.iterate(
  "MATCH (t:Tile{year:1840}) RETURN t",
  "CALL wog.estimateTileWealth(t.addressYear) YIELD value RETURN value",
  {batchSize:1, parallel:true, batchMode:'SINGLE'}
  );
CALL apoc.periodic.iterate(
  "MATCH (t:Tile{year:1850}) RETURN t",
  "CALL wog.estimateTileWealth(t.addressYear) YIELD value RETURN value",
  {batchSize:1, parallel:true, batchMode:'SINGLE'}
  );
CALL apoc.periodic.iterate(
  "MATCH (t:Tile{year:1860}) RETURN t",
  "CALL wog.estimateTileWealth(t.addressYear) YIELD value RETURN value",
  {batchSize:1, parallel:true, batchMode:'SINGLE'}
  );
CALL apoc.periodic.iterate(
  "MATCH (t:Tile{year:1870}) RETURN t",
  "CALL wog.estimateTileWealth(t.addressYear) YIELD value RETURN value",
  {batchSize:1, parallel:true, batchMode:'SINGLE'}
  );
CALL apoc.periodic.iterate(
  "MATCH (t:Tile{year:1890}) RETURN t",
  "CALL wog.estimateTileWealth(t.addressYear) YIELD value RETURN value",
  {batchSize:1, parallel:true, batchMode:'SINGLE'}
  );
CALL apoc.periodic.iterate(
  "MATCH (t:Tile{year:1900}) RETURN t",
  "CALL wog.estimateTileWealth(t.addressYear) YIELD value RETURN value",
  {batchSize:1, parallel:true, batchMode:'SINGLE'}
  );
CALL apoc.periodic.iterate(
  "MATCH (t:Tile{year:1910}) RETURN t",
  "CALL wog.estimateTileWealth(t.addressYear) YIELD value RETURN value",
  {batchSize:1, parallel:true, batchMode:'SINGLE'}
  );
CALL apoc.periodic.iterate(
  "MATCH (t:Tile{year:1920}) RETURN t",
  "CALL wog.estimateTileWealth(t.addressYear) YIELD value RETURN value",
  {batchSize:1, parallel:true, batchMode:'SINGLE'}
  );
CALL apoc.periodic.iterate(
  "MATCH (t:Tile{year:1930}) RETURN t",
  "CALL wog.estimateTileWealth(t.addressYear) YIELD value RETURN value",
  {batchSize:1, parallel:true, batchMode:'SINGLE'}
  );
CALL apoc.periodic.iterate(
  "MATCH (t:Tile{year:1940}) RETURN t",
  "CALL wog.estimateTileWealth(t.addressYear) YIELD value RETURN value",
  {batchSize:1, parallel:true, batchMode:'SINGLE'}
  );CALL apoc.periodic.iterate(
  "MATCH (t:Tile{year:1950}) RETURN t",
  "CALL wog.estimateTileWealth(t.addressYear) YIELD value RETURN value",
  {batchSize:1, parallel:true, batchMode:'SINGLE'}
  );
CALL apoc.periodic.iterate(
  "MATCH (t:Tile{year:1960}) RETURN t",
  "CALL wog.estimateTileWealth(t.addressYear) YIELD value RETURN value",
  {batchSize:1, parallel:true, batchMode:'SINGLE'}
  );
CALL apoc.periodic.iterate(
  "MATCH (t:Tile{year:1970}) RETURN t",
  "CALL wog.estimateTileWealth(t.addressYear) YIELD value RETURN value",
  {batchSize:1, parallel:true, batchMode:'SINGLE'}
  );
CALL apoc.periodic.iterate(
  "MATCH (t:Tile{year:1980}) RETURN t",
  "CALL wog.estimateTileWealth(t.addressYear) YIELD value RETURN value",
  {batchSize:1, parallel:true, batchMode:'SINGLE'}
  );
CALL apoc.periodic.iterate(
  "MATCH (t:Tile{year:1990}) RETURN t",
  "CALL wog.estimateTileWealth(t.addressYear) YIELD value RETURN value",
  {batchSize:1, parallel:true, batchMode:'SINGLE'}
  );
CALL apoc.periodic.iterate(
  "MATCH (t:Tile{year:2000}) RETURN t",
  "CALL wog.estimateTileWealth(t.addressYear) YIELD value RETURN value",
  {batchSize:1, parallel:true, batchMode:'SINGLE'}
  )




WITH [1816, 1880, 1914, 1938, 1945, 1994] AS years
UNWIND years AS year
CREATE (r:Territory{mapKey:"World Oceans of " + year, year:year, resolution:4, name:"Oceans"})
WITH r
MATCH (t:Tile{missing:true, year:year}) WHERE NOT (t)-[:INCLUDES]-(:Territory)
MERGE (r)-[:INCLUDES{during:year}]->(t)

// In order to calculate regression models for population growth, all tiles on a grid need to have a weeklyGTP calculation
WITH [1800, 1810, 1816, 1820, 1830, 1840, 1850, 1860, 1870, 1880, 1890, 1900, 1910, 1914, 1920, 1930, 1938, 1940, 1945, 1950, 1960, 1970, 1980, 1990, 1994, 2000] AS years
UNWIND years AS yr
MATCH (y:Year) WHERE y.began.year = yr
WITH yr, y
MATCH (t:Tile{year:yr}) WHERE t.weeklyGTP IS NULL AND (t.gtp IS NOT NULL AND t.gtp > 0.0)
SET t.weeklyGTP = t.gtp / y.weeksThisYear

