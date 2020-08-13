#!/bin/bash

#  Dr Kent G Lau
#  kenty@kenty.com

#  HealthcareSIG Payer Subgroup 2020


echo
echo "#################################################################"
echo "#######    Check if any chaincode installed yet   ###############"
echo "#################################################################"
sudo docker exec cli peer chaincode list --installed


echo
echo "#################################################################"
echo "#######    Package MPMCC chaincode   ###################"
echo "#################################################################"

sudo docker exec cli peer chaincode package MPMccpack.out -n MPMcc -v 1.0 -p /opt/gopath/src/github.com/MPM/nodejs -l node


echo
echo "#################################################################"
echo "#######    Install MPMCC chaincode package   ###########"
echo "#################################################################"

sudo docker exec cli peer chaincode install MPMccpack.out -n MPMcc -v 1.0 -l node
echo
echo "#################################################################"
echo "#######    List all INSTALLED chaincode   #######################"
echo "#################################################################"

sudo docker exec cli peer chaincode list --installed


echo
echo "#################################################################"
echo "#######    Instantiate MPMCC chaincode   ###############"
echo "#################################################################"

sudo docker exec cli peer chaincode instantiate MPMccpack.out -n MPMcc -v 1.0 -l node -o orderer.payer.com:7050 -C prescriptionchannel -c '{"Args":[]}'


echo
echo "#################################################################"
echo "#######    Chaincode instantiation complete!   ##################"
echo "#################################################################"

docker images | grep dev-peer
