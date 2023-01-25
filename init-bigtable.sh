#!/bin/bash

#set -e

BIGTABLE_EMULATOR_HOST="0.0.0.0:8086"
INSTANCE="0.0.0.0:8086"
PROJECT="explorer"

cbt -project $PROJECT -instance $INSTANCE createtable beaconchain
cbt -project $PROJECT -instance $INSTANCE createtable blocks
cbt -project $PROJECT -instance $INSTANCE createtable cache
cbt -project $PROJECT -instance $INSTANCE createtable data
cbt -project $PROJECT -instance $INSTANCE createtable metadata
cbt -project $PROJECT -instance $INSTANCE createtable metadata_updates
cbt -project $PROJECT -instance $INSTANCE createtable machine_metrics

cbt -project $PROJECT -instance $INSTANCE createfamily data f
cbt -project $PROJECT -instance $INSTANCE createfamily data c

cbt -project $PROJECT -instance $INSTANCE createfamily beaconchain at
cbt -project $PROJECT -instance $INSTANCE createfamily beaconchain pr
cbt -project $PROJECT -instance $INSTANCE createfamily beaconchain sc
cbt -project $PROJECT -instance $INSTANCE createfamily beaconchain vb
cbt -project $PROJECT -instance $INSTANCE createfamily beaconchain ati

cbt -project $PROJECT -instance $INSTANCE createfamily machine_metrics mm

cbt -project $PROJECT -instance $INSTANCE setgcpolicy beaconchain ati maxage=1d

cbt -project $PROJECT -instance $INSTANCE createfamily blocks default

cbt -project $PROJECT -instance $INSTANCE createfamily cache 10_min
cbt -project $PROJECT -instance $INSTANCE createfamily cache 1_day
cbt -project $PROJECT -instance $INSTANCE createfamily cache 1_hour

cbt -project $PROJECT -instance $INSTANCE setgcpolicy cache 10_min maxage=10m
cbt -project $PROJECT -instance $INSTANCE setgcpolicy cache 1_hour maxage=1h
cbt -project $PROJECT -instance $INSTANCE setgcpolicy cache 1_day maxage=1d

cbt -project $PROJECT -instance $INSTANCE createfamily metadata a
cbt -project $PROJECT -instance $INSTANCE createfamily metadata c
cbt -project $PROJECT -instance $INSTANCE createfamily metadata erc1155
cbt -project $PROJECT -instance $INSTANCE createfamily metadata erc20
cbt -project $PROJECT -instance $INSTANCE createfamily metadata erc721

cbt -project $PROJECT -instance $INSTANCE createfamily metadata_updates blocks
cbt -project $PROJECT -instance $INSTANCE createfamily metadata_updates f
