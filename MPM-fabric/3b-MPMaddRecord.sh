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
sudo docker exec cli peer chaincode invoke -o orderer.payer.com:7050 -C prescriptionchannel -n MPMcc -c '{"function":"addRecord","Args":["001","patient-111","provider-AAA","Doc1","Pharm1","Insurance","Y"]}' &&
sudo docker exec cli peer chaincode invoke -o orderer.payer.com:7050 -C prescriptionchannel -n MPMcc -c '{"function":"addRecord","Args":["002","patient-222","provider-BBB","Doc2","Pharm2","     Self","N"]}' &&
sudo docker exec cli peer chaincode invoke -o orderer.payer.com:7050 -C prescriptionchannel -n MPMcc -c '{"function":"addRecord","Args":["003","patient-333","provider-CCC","Doc2","Pharm2"," Medicare","N"]}'


    #   '001-PRESCRIPTION-ID:':prescriptionId,
    #   '002-PATIENT-ID:':data1,
    #   '003-PROVIDER-ID:':data2,
    #   '004-DOCTOR-ID:':data3,
    #   '005-PHARMACY-ID':data4,
    #   '006-PAYER-ID':data5,
    #   '007-CONSENT:':data6,
