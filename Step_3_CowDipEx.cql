// Reviewed, updated 14 SEP 2018; includes named facts
// Begin Diplomatic Exchange data
CREATE (d:Source{
  project:'Correlates of War',
  name:'Diplomatic Exchange',
  version:toFloat(2016.1),
  published:date({year:2007, month:5, day:18}),
  validFrom:date({year:1817, month:1, day:1}),
  validUntil:date({year:2005, month:12, day:31}),
  citation:"Bayer, Reşat. 2006. 'Diplomatic Exchange Data set, v2006.1.' Online: http://correlatesofwar.org",
  host:'Reşat Bayer (Koç University)',
  url:'http://correlatesofwar.org/data-sets/formal-alliances',
  overview:"The Correlates of War Diplomatic Exchange data set captures diplomatic representation at the level of chargé d'affaires, minister, and ambassador between members of the Correlates of War interstate system. The 2006 version of the data set includes information for the following years:  1817, 1824, 1827, 1832, 1836, 1840, every five years between 1844 and 1914, every five years between 1920 and 1940, and every five years between 1950 and 2005. The dyadic data describe the level of diplomatic representation and diplomatic exchange between members in the COW system.",
  purpose:"The Diplomatic Exchange data set tracks diplomatic representation at the level of chargé d'affaires, minister, and ambassador between states from 1817-2005."
})
CREATE (d)-[:PROVIDES]->(:Dataset{
  name:'Diplomatic Exchange Data',
  version:toFloat(2016.1),
  published:date({year:2007, month:5, day:18}),
  purpose:'Data of diplomatic exchange',
  url:'http://correlatesofwar.org/data-sets/diplomatic-exchange/diplomatic-exchange-v2006-1-data/at_download/file',
  filename:'Diplomatic_Exchange_2006v1.csv',
  bytesize:toInteger(12037213)
})
CREATE (d)-[:PROVIDES]->(:File{
  name:'Diplomatic Exchange codebook',
  version:toFloat(2016.1),
  published:date({year:2007, month:5, day:18}),
  purpose:'Documentation of data.',
  url:'http://correlatesofwar.org/data-sets/diplomatic-exchange/diplomatic-exchange-codebook/at_download/file',
  filename:'Diplomatic_Exchange_2006v1_codebook.pdf',
  bytesize:toInteger(78806)
});


USING PERIODIC COMMIT 500
LOAD CSV WITH HEADERS FROM 'file:///Diplomatic_Exchange_2006v1.csv' AS row
  WITH row,
       CASE row.DR_at_1
         WHEN '0' THEN 'No evidence of diplomatic exchange'
         WHEN '1' THEN "chargé d'affaires"
         WHEN '2' THEN 'ambassador'
         ELSE 'other' END AS dr1,
       CASE row.DR_at_2
         WHEN '0' THEN 'No evidence of diplomatic exchange'
         WHEN '1' THEN "chargé d'affaires"
         WHEN '2' THEN 'ambassador'
         ELSE 'other' END AS dr2
  MATCH (s1:State{cowcode:row.ccode1}), (s2:State{cowcode:row.ccode2}), (d:Dataset{name:'Diplomatic Exchange Data'}),
    (y:Year{name:row.year, value:toInteger(row.year) })
  CREATE (d)-[:CONTRIBUTES]->(f1:Fact:DipExFact{
    name:'Diplomatic Exchange',
    version:toFloat(row.version),
    during:date({year:toInteger(row.year)}),
    code:toInteger(row.DR_at_1),
    level:dr1,
    subject:s1.name,
    predicate:'REPRESENTED',
    object:s2.name
  })
  CREATE (d)-[:CONTRIBUTES]->(f2:Fact:DipExFact{
    name:'Diplomatic Exchange',
    version:toFloat(row.version),
    during:date({year:toInteger(row.year)}),
    code:toInteger(row.DR_at_2),
    level:dr2,
    subject:s2.name,
    predicate:'REPRESENTED',
    object:s1.name
  })
  MERGE (f1)-[:REPRESENTED_AT]->(s2)-[:REPRESENTED]->(f2)
  MERGE (f2)-[:REPRESENTED_AT]->(s1)-[:REPRESENTED]->(f1)
  WITH row, s1, s2, f1, f2, y, dr1, dr2
  FOREACH (val IN CASE WHEN 3 > toInteger(row.DR_at_1) > 0 THEN [1]
    ELSE []
    END |
    CREATE (e:DiplomaticExchange{states:[s1.name, s2.name], during: row.year})-[:DURING]->(y)
    MERGE (s1)-[r1:REPRESENTATION{level: dr1}]->(e)<-[:REPRESENTAION_WITH]-(f1)
    FOREACH (val IN CASE WHEN 3 > toInteger(row.DR_at_2) > 0 THEN [1]
      ELSE []
      END |
      MERGE (s2)-[r2:REPRESENTATION{level: dr2}]->(e)<-[:REPRESENTAION_WITH]-(f2)
    )
  );
// End of the Dip Ex data

RETURN 'Import of Diplomatic_Exchange_2006v1.csv was successful. Files 1 of 1 COW Diplomatic Exchange files, 6 of 24 total files.';

