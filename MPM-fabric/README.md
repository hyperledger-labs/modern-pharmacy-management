# fabric-payer1

This project is a use-case example for the [Hyperledger Healthcare Special Interest Group - Payer Subgroup](https://wiki.hyperledger.org/display/HCSIG/HC-SIG+-+Payer+Subgroup) written by [Dr Kent Lau](linkedin.com/in/kentglau).

## Architecture

4 peers - payer, provider, pharmacist, member

4 couchDB

Certificate Authority (CA)

Command Line Interface (CLI)

1 channel - prescriptionchannel

1 chaincode - MPMcc


## Software Spec

Hyperledger Fabric v2.2.0 with CouchDB v0.4

## Usage

Run automated demo steps:

./1-start-fabric220.sh

./2-MPMcc.sh

./3-MPMaddRecord.sh

./4-MPMqueryRecord.sh

./5-teardown-fabric220.sh