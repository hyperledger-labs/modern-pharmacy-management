#!/bin/bash

#  Dr Kent G Lau
#  kenty@kenty.com

#  HealthcareSIG Payer Subgroup 2020

echo
echo "#################################################################"
echo "#######    Clearing network:  ###################################"
echo "#################################################################"

sudo docker-compose -f docker-compose.yml down -v

echo
echo "#################################################################"
echo "#######    Starting network:  ###################################"
echo "#################################################################"

sudo docker-compose -f docker-compose.yml up -d 

echo
echo "#################################################################"
echo "#######    List of all network containers   #####################"
echo "#################################################################"

sudo docker ps -a

# wait for Hyperledger Fabric to start
# incase of errors when running later commands, issue export FABRIC_START_TIMEOUT=<larger number>
export FABRIC_START_TIMEOUT=10
#echo ${FABRIC_START_TIMEOUT}
sleep ${FABRIC_START_TIMEOUT}


echo
echo "#################################################################"
echo "#######    Creating prescriptionchannel     #####################"
echo "#################################################################"

### Create the channel - peer0.payer.com
# sudo docker exec -e "CORE_PEER_LOCALMSPID=PayerMSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@payer.com/msp" peer0.payer.com peer channel create -o orderer.payer.com:7050 -c prescriptionchannel -f /etc/hyperledger/configtx/prescriptionchannel.tx

### Create the channel - CLI for peer0.payer.com
sudo docker exec -e "CORE_PEER_LOCALMSPID=PayerMSP" -e "CORE_PEER_ADDRESS=peer0.payer.com:7051" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/payer.com/users/Admin@payer.com/msp/" cli peer channel create -o orderer.payer.com:7050 -c prescriptionchannel -f /etc/hyperledger/configtx/prescriptionchannel.tx


echo
echo "#################################################################"
echo "#######    Joining peer0.payer.com to channels   ################"
echo "#################################################################"

### Join peer0.payer.com to the channel.
# sudo docker exec -e "CORE_PEER_LOCALMSPID=PayerMSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@payer.com/msp" peer0.payer.com peer channel join -b prescriptionchannel.block

### CLI join peer0.payer.com to the channel.
sudo docker exec -e "CORE_PEER_LOCALMSPID=PayerMSP" -e "CORE_PEER_ADDRESS=peer0.payer.com:7051" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/payer.com/users/Admin@payer.com/msp/" cli peer channel join -b prescriptionchannel.block


echo
echo "#################################################################"
echo "#######    Joining peer0.pharmacy.com to channels   #############"
echo "#################################################################"

### CLI join peer0.payer.com to the channel.
sudo docker exec -e "CORE_PEER_LOCALMSPID=PharmacyMSP" -e "CORE_PEER_ADDRESS=peer0.pharmacy.com:7051" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/pharmacy.com/users/Admin@pharmacy.com/msp/" cli peer channel join -b prescriptionchannel.block


echo
echo "#################################################################"
echo "#######    Joining peer0.doctor.com to channel   ################"
echo "#################################################################"

### CLI join peer0.payer.com to the channel.
sudo docker exec -e "CORE_PEER_LOCALMSPID=DoctorMSP" -e "CORE_PEER_ADDRESS=peer0.doctor.com:7051" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/doctor.com/users/Admin@doctor.com/msp/" cli peer channel join -b prescriptionchannel.block


echo
echo "#################################################################"
echo "#######    Joining peer0.patient.com to channels   ##############"
echo "#################################################################"

### CLI join peer0.payer.com to the channel.
sudo docker exec -e "CORE_PEER_LOCALMSPID=PatientMSP" -e "CORE_PEER_ADDRESS=peer0.patient.com:7051" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/patient.com/users/Admin@patient.com/msp/" cli peer channel join -b prescriptionchannel.block


echo
echo "#################################################################"
echo "#######    List of all channels joined by peer0.payer.com  ######"
echo "#################################################################"

### Peer channel list
# sudo docker exec -e "CORE_PEER_LOCALMSPID=PayerMSP" -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@payer.com/msp" peer0.payer.com peer channel list

### Peer channel list - Payer

sudo docker exec -e "CORE_PEER_LOCALMSPID=PayerMSP" -e "CORE_PEER_ADDRESS=peer0.payer.com:7051" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/payer.com/users/Admin@payer.com/msp/" cli peer channel list
