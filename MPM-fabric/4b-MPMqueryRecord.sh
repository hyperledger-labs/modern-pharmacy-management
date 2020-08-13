#!/bin/bash

#  Dr Kent G Lau
#  kenty@kenty.com

#  HealthcareSIG Payer Subgroup 2020


echo
echo "#################################################################"
echo "#######    Query Record:  MPM-ID 001   #################"
echo "#######                   MPM-ID 002   #################"
echo "#######                   MPM-ID 003   #################"
echo "#################################################################"
sudo docker exec cli peer chaincode query -o orderer.payer.com:7050 -C prescriptionchannel -n MPMcc -c '{"function":"queryRecord","Args":["001"]}' && \
sudo docker exec cli peer chaincode query -o orderer.payer.com:7050 -C prescriptionchannel -n MPMcc -c '{"function":"queryRecord","Args":["002"]}' && \
sudo docker exec cli peer chaincode query -o orderer.payer.com:7050 -C prescriptionchannel -n MPMcc -c '{"function":"queryRecord","Args":["003"]}'
