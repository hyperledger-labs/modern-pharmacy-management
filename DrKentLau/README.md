# fabric-payer1

This project is a use-case example for the [Hyperledger Healthcare Special Interest Group - Payer Subgroup](https://wiki.hyperledger.org/display/HCSIG/HC-SIG+-+Payer+Subgroup) written by [Dr Kent Lau](kenty@kenty.com).

## Architecture

4 peers - payer, doctor, pharmacist, patient

4 couchDB

Certificate Authority (CA)

Command Line Interface (CLI)

1 channel - prescriptionchannel

1 chaincode - prescriptioncc


## Software Spec

Hyperledger Fabric with CouchDB

## Usage

Run automated demo steps:

./1-start.sh

./2-prescriptioncc.sh

./3-addRecord.sh

./4-queryRecord.sh

./5-teardown.sh