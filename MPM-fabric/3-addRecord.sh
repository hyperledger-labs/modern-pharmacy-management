#!/bin/bash

#  Dr Kent G Lau
#  kenty@kenty.com

#  HealthcareSIG Payer Subgroup 2020


echo
echo "#################################################################"
echo "#######    Add Record:  PRESCRIPTION-ID 001   ###################"
echo "#######                 PRESCRIPTION-ID 002   ###################"
echo "#######                 PRESCRIPTION-ID 003   ###################"
echo "#################################################################"
sudo docker exec cli peer chaincode invoke -o orderer.payer.com:7050 -C prescriptionchannel -n prescriptioncc -c '{"function":"addRecord","Args":["001","     filled"," paracetamol","Doc1","Pharm1","Insurance","no more"]}' &&
sudo docker exec cli peer chaincode invoke -o orderer.payer.com:7050 -C prescriptionchannel -n prescriptioncc -c '{"function":"addRecord","Args":["002","part-filled","     aspirin","Doc2","Pharm2","     Self","with food"]}' &&
sudo docker exec cli peer chaincode invoke -o orderer.payer.com:7050 -C prescriptionchannel -n prescriptioncc -c '{"function":"addRecord","Args":["003"," incomplete","fluorouracil","Doc2","Pharm2"," Medicare","contact DR"]}'



# async addRecord(ctx,prescriptionId,data1,data2,data3,data4,data5,data6) {

#     let data={
#       '001-PRESCRIPTION-ID:':prescriptionId,
#       '002-STATUS:':data1,
#       '003-INSTRUCTIONS:':data2,
#       '004-DOCTOR-ID:':data3,
#       '005-PHARMACIST-ID':data4,
#       '006-PAYER-ID':data5,
#       '007-REMARKS:':data6,
#        };
