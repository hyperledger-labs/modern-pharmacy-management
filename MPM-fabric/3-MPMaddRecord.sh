#!/bin/bash

#  Dr Kent G Lau
#  kenty@kenty.com

#  HealthcareSIG Payer Subgroup 2020


echo
echo "#################################################################"
echo "#######    Add Record:  MPM-ID 001   ###################"
echo "#######                 MPM-ID 002   ###################"
echo "#######                 MPM-ID 003   ###################"
echo "#################################################################"
sudo docker exec cli peer chaincode invoke -o orderer.payer.com:7050 -C prescriptionchannel -n MPMcc -c '{"function":"addRecord","Args":["001","provider-111","pharmacy-AAA","MEM-1","payer-X","Paracetamol","OK","Y"]}' &&
sudo docker exec cli peer chaincode invoke -o orderer.payer.com:7050 -C prescriptionchannel -n MPMcc -c '{"function":"addRecord","Args":["002","provider-222","pharmacy-BBB","MEM-2","payer-Y","    Aspirin","OK","N"]}' &&
sudo docker exec cli peer chaincode invoke -o orderer.payer.com:7050 -C prescriptionchannel -n MPMcc -c '{"function":"addRecord","Args":["003","provider-333","pharmacy-CCC","MEM-3","payer-Z","  Ibuprofen","OK","N"]}'

#      '001-PRESCRIPTION-ID:':prescriptionId,
#      '002-PROVIDER-ID:':data1,
#      '003-PHARMACY-ID:':data2,
#      '004-MEMBER-ID:':data3,
#      '005-PAYER-ID:':data4,
#      '006-PRESCRIPTION':data5,
#      '007-REMARKS':data6,
#      '008-CONSENT:':data7

