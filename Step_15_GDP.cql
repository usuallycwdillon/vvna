// First import Geiger`s Gross Cell Product data, then import the Anders, et al SDP data
CREATE (s:Source)-[:PROVIDES{during:2017}]->(d:Dataset)
SET s.name = "Spatially-explicit Gross Cell Product (GCP) time series",
  s.version = toFloat(2017.007),
  s.published = date({year:2017}),
  s.validFrom = date({year:1850, month:01, day:01}),
  s.validUntil = date({year:2100, month:12, day:31}),
  s.url = "http://doi.org/10.5880/pik.2017.007",
  s.overview = "We here provide spatially-explicit economic time series for Gross Cell Product (GCP) with global coverage in 10-year increments between 1850 and 2100 with a spatial resolution of 5 arcmin. GCP is based on a statistcal downscaling procedure that among other predictors uses national Gross Domestic Product (GDP) time series and gridded population estimates as input. Historical estimates until 2000 are harmonized with future socio-economic projections from the Shared Socioeconomic Pathways (SSPs) according to SSP2 from 2010 onwards.",
  s.purpose = "This dataset has already been used to create a global and spatially-explicit dataset for tropical cyclone exposure (TCE-DAT), for details see http://doi.org/10.5880/pik.2017.011.",
  s.citation = "Geiger, Tobias; Murakami, Daisuke; Frieler, Katja; Yamagata, Yoshiki (2017): Spatially-explicit Gross Cell Product (GCP) time series: past observations (1850-2000) harmonized with future projections according the Shared Socioeconomic Pathways (2010-2100). GFZ Data Services.",
  d.name = "Gross Cell Product 1850-2100",
  d.filename = "GCP_PPP-2005_1850-2100.nc",
  d.url = "https://dataservices.gfz-potsdam.de/pik/showshort.php?id=escidoc:2740907",
  d.version = toFloat(2017.007),
  d.published = date({year:2017}),
  d.description = "GCP in 10-year increments between 1850-2100 with a resolution of 5 arcmin.",
  d.format = "NETCDF4 format (.nc) "
WITH d
MERGE (d)-[:INPUT_TO]->(c:Computation{filename:"geiger.R"})-[:COMPUTES]->(:Dataset{
  name:"Gross Cell Product 1850",
  note:"This data file is extracted and converted from Geiger, et al`s original NETCDF4 formated dataset: GCP 1850-2100 at 2005 ppp",
  purpose:"Spatially-explicit Gross Cell Product for year 1850.",
  year:1850,
  filename:"gcp1850.csv"
})
MERGE (c)-[:COMTUTES]->(:Dataset{
  name:"Gross Cell Product 1880",
  note:"This data file is this author`s converted and extracted data from Geiger, et al`s GCP data set from their original NETCDF4 format",
  purpose:"Spatially-explicit Gross Cell Product for year 1880.",
  year:1880,
  filename:"gcp1880.csv"
})
MERGE (c)-[:COMTUTES]->(:Dataset{
  name:"Gross Cell Product 1914",
  note:"This data file is this author`s converted and extracted data from Geiger, et al`s GCP data set from their original NETCDF4 format; representing a weighted average between the decenials before and after.",
  purpose:"Spatially-explicit Gross Cell Product for year 1914.",
  year:1914,
  filename:"gcp1914.csv"
})
MERGE (c)-[:COMTUTES]->(:Dataset{
  name:"Gross Cell Product 1938",
  note:"This data file is this author's converted and extracted data from Geiger, et al's GCP data set from their original NETCDF4 format; representing a weighted average between the decenials before and after.",
  purpose:"Spatially-explicit Gross Cell Product for year 1938.",
  year:1938,
  filename:"gcp1938.csv"
})
MERGE (c)-[:COMTUTES]->(:Dataset{
  name:"Gross Cell Product 1945",
  note:"This data file is this author's converted and extracted data from Geiger, et al's GCP data set from their original NETCDF4 format; representing a weighted average between the decenials before and after.",
  purpose:"Spatially-explicit Gross Cell Product for year 1945.",
  year:1945,
  filename:"gcp1945.csv"
})
MERGE (c)-[:COMTUTES]->(:Dataset{
  name:"Gross Cell Product 1994",
  note:"This data file is this author's converted and extracted data from Geiger, et al's GCP data set from their original NETCDF4 format; representing a weighted average between the decenials before and after.",
  purpose:"Spatially-explicit Gross Cell Product for year 1994.",
  year:1994,
  filename:"gcp1994.csv"
});
MATCH (d:Dataset{name:"Gross Cell Product 1850"})
WITH d
CALL wog.writeHydeFacts(d, "1850", "gtp", true) YIELD value RETURN value;
MATCH (d:Dataset{name:"Gross Cell Product 1880"})
WITH d
CALL wog.writeHydeFacts(d, "1880", "gtp", true) YIELD value RETURN value;
MATCH (d:Dataset{name:"Gross Cell Product 1914"})
WITH d
CALL wog.writeHydeFacts(d, "1914", "gtp", true) YIELD value RETURN value;
MATCH (d:Dataset{name:"Gross Cell Product 1938"})
WITH d
CALL wog.writeHydeFacts(d, "1938", "gtp", true) YIELD value RETURN value;
MATCH (d:Dataset{name:"Gross Cell Product 1945"})
WITH d
CALL wog.writeHydeFacts(d, "1945", "gtp", true) YIELD value RETURN value;
MATCH (d:Dataset{name:"Gross Cell Product 1994"})
WITH d
CALL wog.writeHydeFacts(d, "1994", "gtp", true) YIELD value RETURN value;
// Done with Geiger (for now)

// Starting Anders, et al`s SDP data
CREATE (s:Source)-[:PROVIDES{during:2020}]->(d:Dataset)
SET s.name = "Bread Before Guns or Butter",
  s.published = date({year:2020}),
  s.validFrom = date({year:1800, month:01, day:01}),
  s.validUntil = date({year:2016, month:12, day:31}),
  s.url = "http://cfariss.com/documents/AndersFarissMarkowitz2020ISQ.pdf",
  s.overview = "Surplus domestic product (SDP) corrects for measurement error (GDP as proxy for the income states can deovte to arming) by decomposing
subsistence income and surplus income from total GDP",
  s.purpose = "Subsistence income represents resources needed to provide the 'bread' necessary to cover
the basic subsistence needs of the population. Surplus income represents the remaining resources that could be allocated to
'guns' or 'butter.'",
  s.citation = "Anders, Therese et al. (2020) Bread Before Guns or Butter: Introducing Surplus Domestic Product (SDP). International Studies Quarterly, doi: 10.1093/isq/sqaa013",
  d.name = "SDP Estimates",
  d.filename = "gdp_pop_sdp_estimates.csv",
  d.published = date({year:2020, month:06, day:23}),
  d.url = "https://github.com/thereseanders/sdp",
  d.description = "GDP, population, and SDP estimates (based on $3 per day minimum subsistence threshold) and standard deviations expressed as natural logs.";

// SDP population and National GDP estimates
MATCH (d:Dataset{name:"SDP Estimates"})
WITH d
LOAD CSV WITH HEADERS FROM "file:///gdp_pop_sdp_estimates.csv" AS row
WITH row, d
MERGE (p:Polity{cowcode:row.gwno})
ON CREATE 
  SET p.creation = "sdp estimates data",
      p.cowcode = row.gwno,
      p.name = "TODO: Look this up"
WITH row, p, d, toFloat(row.WorldBank_gdp_2011_ppp_estimate) AS gdp, toFloat(row.WorldBank_pop_estimate) AS pop
MATCH (y:Year{name:row.year})
MERGE (p)-[:PRODUCED{during:toInteger(y.name)}]->(gf:Fact:GdpFact{
    value:toFloat(exp(gdp)/1000), 
    subject:p.name, 
    predicate:"PRODUCED", 
    object:y.name,
    factor:toInteger(1000),
    currency:"GDP in thousands of 2011 G-K Dollars"
  })-[:DURING{year:toInteger(y.name)}]-(y)
MERGE (p)-[:POPULATION{during:toInteger(y.name)}]->(pf:Fact:PopulationFact{
    value:toFloat(exp(pop)/1000), 
    subject:p.name, 
    predicate:"POPULATION", 
    object:y.name,
    factor:toInteger(1000),
    currency:"Population in thousands"
  })-[:DURING{year:toInteger(y.name)}]-(y)
MERGE (d)-[:CONTRIBUTES]-(gf) 
MERGE (d)-[:CONTRIBUTES]-(pf); 

// Estimate 1816 GTPs by a ratio of national 1816 GDPs/1850 GDPs to the 1850 GTP
// 
CREATE (c:Computation{name:"Estimate 1816 GTPs by SDP Ratios", time:datetime()})
WITH c
MATCH (p:Polity)--(:GdpFact{object:"1850"})--(d:Dataset{name:"SDP Estimates"}), 
      (p)--(:GdpFact{object:"1816"})--(d), 
      (y:Year{name:"1816"})
WITH COLLECT(p) AS polities, y, d, c
UNWIND polities AS pol
  MATCH (pol)--(g50:GdpFact{object:"1850"})--(d), 
        (pol)--(g16:GdpFact{object:"1816"})--(d), 
        (pol)--(t:Territory{year:1816})--(h:Tile)
  WITH COLLECT(h) AS tiles, g16.value / g50.value AS factor, y, c
  UNWIND tiles AS t
    MATCH (t)--(gf:GrossTileProductionFact{during:1850})
    WITH t, y, factor * gf.value AS gtp, c
    MERGE (t)-[:SIM_PRODUCTION_1816{during:1816}]-(cf:Fact:GrossTileProductionFact{
      subject:t.address,
      predicate:"SIM_PRODUCTION_1816",
      object:"1816",
      during:1816,
      name:"Simulated gtp",
      value:gtp 
      })-[:DURING{year:1816}]->(y)
    MERGE (c)-[:COMPUTES]->(cf);

//
// Now to deal with Italy and Germany, two states that didn't exist until the late 
// 19th C but get treated as if they did, My solution is to create placeholder states 
// (Territories of future...) and attribute their data to the collection
// of states/kingdoms that eventually coelesce into these future states.
// CREATE (e:NotionalDataEntity{name:"Future Italy", cowcode:"325"})
// MATCH (d:Dataset{name:"SDP Estimates"})
// WITH e, d, ["325", "327", "329", "335", "337"] AS codes
// MATCH (p:Polity)
// WHERE p.cowcode IN codes
// MERGE (e)-[:PLACEHOLDER_FOR]->(p)
// WITH e, d
// LOAD CSV WITH HEADERS FROM "file:///futureItaly_sdp_gdppc.csv" AS row
// WITH e, d, row
// MATCH (y:Year)
// WHERE y.name = row.year 
// MERGE (e)-[:PRODUCED{during:toInteger(row.year)}]->(f:Fact:GdpFact{
//   subject:e.name,
//   predicate:"PRODUCED",
//   object:y.name,
//   value:toFloat(row.gdppc),
//   currency:"GDP per capita in 2005 G-K Dollars"
//   })-[:DURING{year:toInteger(y.name)}]->(y)
// MERGE (d)-[:PROVIDES]->(f) ;
// 
// MATCH (e:NotionalDataEntity{name:"Future Italy"})--(g50:GdpFact{object:"1850"}), (e)--(g16:GdpFact{object:"1816"}), 
//   (y:Year{name:"1816"})
// WITH e, g50, g16, y
// MATCH (e)--(p:Polity)--(t:Territory{year:1816})--(h:Tile)
// WITH COLLECT(h) AS tiles, g16.value / g50.value AS factor, y
// UNWIND tiles AS t
// MATCH (t)--(gf:GrossTileProductionFact{during:1850}), (t)-[:SIM_POPULATION_1816]->(epf:PopulationFact), 
//   (t)-[:SIM_POPULATION_1850]->(opf:PopulationFact)
// WITH t, y, (gf.value / opf.value) * factor * epf.value AS gtp
// MERGE (t)-[:SIM_PRODUCTION_1816]-(:Fact:GrossTileProductionFact{
//   subject:t.address,
//   predicate:"SIM_PRODUCTION_1816",
//   object:"1816",
//   during:1816,
//   name:"Simulated gtp",
//   value:gtp 
//   })-[:DURING{year:1816}]->(y);
// 
// CREATE (e:NotionalDataEntity{name:"Future Germany", cowcode:"255"})
// WITH e, ["255", "240", "245", "267", "269", "271", "273", "275", "280"] AS codes
// MATCH (p:Polity)
// WHERE p.cowcode IN codes
// MERGE (e)-[:PLACEHOLDER_FOR]->(p)
// WITH e
// LOAD CSV WITH HEADERS FROM "file:///futureGermany_sdp_gdppc.csv" AS row
// WITH e, row
// MATCH (y:Year)
// WHERE y.name = row.year 
// MERGE (e)-[:PRODUCED{during:toInteger(row.year)}]->(f:Fact:GdpFact{
//   subject:e.name,
//   predicate:"PRODUCED",
//   object:y.name,
//   value:toFloat(row.gdppc),
//   currency:"GDP per capita in 2005 G-K Dollars"
//   })-[:DURING{year:toInteger(y.name)}]->(y);
// 
// MATCH (e:NotionalDataEntity{name:"Future Germany"})--(g50:GdpFact{object:"1850"}), (e)--(g16:GdpFact{object:"1816"}), 
//   (y:Year{name:"1816"})
// WITH e, g50, g16, y
// MATCH (e)--(p:Polity)--(t:Territory{year:1816})--(h:Tile)
// WITH COLLECT(h) AS tiles, g16.value / g50.value AS factor, y
// UNWIND tiles AS t
// MATCH (t)--(gf:GrossTileProductionFact{during:1850}), (t)-[:SIM_POPULATION_1816]->(epf:PopulationFact), 
//   (t)-[:SIM_POPULATION_1850]->(opf:PopulationFact)
// WITH t, y, (gf.value / opf.value) * factor * epf.value AS gtp
// MERGE (t)-[:SIM_PRODUCTION_1816]-(:Fact:GrossTileProductionFact{
//   subject:t.address,
//   predicate:"SIM_PRODUCTION_1816",
//   object:"1816",
//   during:1816,
//   name:"Simulated gtp",
//   value:gtp 
//   })-[:DURING{year:1816}]->(y);

// Finally, the rest of the world


// WITH row, [key in keys(row) WHERE toInteger(key) >= 1800 AND toInteger(key) <= 2015 AND row[key] IS NOT NULL] as keys, d
// MERGE (p:Polity{cowcode:row.ccode})
// ON CREATE
//   SET p.creation = "gdp data",
//       p.cowcode = row.ccode,
//       p.name:"TODO: Look up this name"
// WITH row, keys, p, d
// MATCH (y:Year) 
// WHERE y.name IN keys
// FOREACH (attempt IN CASE WHEN row[y.name] <> "" THEN [1] ELSE [] END | MERGE (p)-[:PRODUCED{
//   during:toInteger(y.name)
//   }]->(f:Fact:GdpFact{
//     value:toFloat(exp(row[y.name])/1000), 
//     subject:p.name, 
//     predicate:"PRODUCED", 
//     object:y.name,
//     factor:toInteger(1000),
//     currency:"GDP in thousands of 2011 G-K Dollars"
//   })-[:DURING]-(y), (d)-[:CONTRIBUTES]-(f) );
// To apply the 1850 GTP distribution to the 1816 GDPPC estimates, we iterate over each polity with data (from SDP) for
// 1850 that also has data for 1816 and calculate the 1816/1850 GDPPC ratio to be used a factor in the tile-level 
// calculation; find the tiles included in its territory along with their 1850 GrossTileProduct value and their 
// populations in 1816 and 1850,



MATCH (p:Polity)--(:GdpFact{object:"1850"})--(d:Dataset{name:"SDP Estimates"}), 
      (p)--(:GdpFact{object:"1816"})--(d)
WHERE p.cowcode IN ["240","245","255","260","265","267","269","271","273","275"]
WITH COLLECT(p) AS polities, d
UNWIND polities AS pol
  MATCH (pol)--(g50:GdpFact{object:"1850"})--(d), 
        (pol)--(g16:GdpFact{object:"1816"})--(d), 
        (pol)--(t:Territory{year:1816})--(h:Tile)
  WITH COLLECT(h) AS tiles, g16.value / g50.value AS factor, pol, g16, g50
  UNWIND tiles AS t
    MATCH (t)--(gf:GrossTileProductionFact{during:1850}), (t)--(ngp:GrossTileProductionFact{during:1816})
    WITH t, factor * gf.value AS gtp, pol, g16, g50, factor, gf, ngp
    RETURN pol.name, t.address, factor, gf.value, gtp, ngp.value, g16.value, g50.value


MATCH (s:State)--(t:Territory) 
WHERE s.cowcode IN ["240","245","255","260","265","267","269","271","273","275"]
WITH s, t, COLLECT(t) AS ters
    UNWIND ters as ter
MATCH (ter)-[i:INCLUDES]-(h:Tile)
WITH ter, i, h, s
MATCH (ter)-[i]-(h)-[pr]-(pf:PopulationFact) WHERE i.during = pr.during
OPTIONAL MATCH (ter)-[i]-(h)-[gr]-(gf:GrossTileProductionFact) WHERE i.during = gr.during
OPTIONAL MATCH (ter)-[i]-(h)-[ur]-(uf:UrbanPopulationFact) WHERE i.during = ur.during
OPTIONAL MATCH (ter)-[i]-(h)-[br]-(bf:BuiltAreaFact) WHERE i.during = br.during
RETURN ter.mapKey AS territory, s.cowcode AS cow, count(h) AS tiles, i.during AS yr, sum(pf.value) AS pop, sum(gf.value) AS gtp, sum(uf.value) AS upop, sum(bf.value) AS bua ORDER BY i.during