#!/bin/bash

#  Dr Kent G Lau
#  kenty@kenty.com

#  HealthcareSIG Payer Subgroup 2020


echo
echo "#################################################################"
echo "#######    Query Record:  PRESCRIPTION-ID 001   #################"
echo "#######                   PRESCRIPTION-ID 002   #################"
echo "#######                   PRESCRIPTION-ID 003   #################"
echo "#################################################################"
sudo docker exec cli peer chaincode query -o orderer.payer.com:7050 -C prescriptionchannel -n prescriptioncc -c '{"function":"queryRecord","Args":["001"]}' && \
sudo docker exec cli peer chaincode query -o orderer.payer.com:7050 -C prescriptionchannel -n prescriptioncc -c '{"function":"queryRecord","Args":["002"]}' && \
sudo docker exec cli peer chaincode query -o orderer.payer.com:7050 -C prescriptionchannel -n prescriptioncc -c '{"function":"queryRecord","Args":["003"]}'
