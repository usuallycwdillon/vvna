#!/usr/bin/env bash
#
# This is a convenience script that loads all the data into an empty database. It has to be edited with the correct path
# variables for each installation.

CQL_PATH="/home/cw/Code/george/src/main/resources/cypherScripts"
#C_SHELL_PATH="\"/home/cw/.config/Neo4j\ Desktop/Application/neo4jDatabases/database-eaebf811-5dc3-445d-9133-3689ae02b7de/installation-3.4.9\""

SCRIPTS=(
    'Step_0_Timeline.cql'
    'Step_1_LevyGPW.cql'
    'Step_2_CowSystem.cql'
    'Step_3_CowDipEx.cql'
    'Step_4_CowTrade.cql'
    'Step_5_CowCapabilities.cql'
    'Step_6_CowWars.cql'
    'Step_7_CowAlliance-Orgs.cql'
    'Step_8_CowReligion.cql'
    'Step_9_CowMIDA-B.cql'
#    'Step_10_CowTerritory.cql'
#    'Step_11_CowMIDLOC.cql'
#    'Step_12_GleditschExpanded.cql'
#    'Step_13_CowContiguities.cql'
    'Step_14_CowIGO.cql'
    'Step_19_PolityIV_2016.cql'
)

# echo "cat $CQL_PATH/Step_1_LevyGPW.cql | bin/cypher-shell -u neo4j -p george --format plain"
for script in "${SCRIPTS[@]}"
do
    eval "cat $CQL_PATH/$script | $C_SHELL_PATH/bin/cypher-shell -u neo4j -p george --format plain"
done


