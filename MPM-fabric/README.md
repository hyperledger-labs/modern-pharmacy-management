# MPM-fabric

This project is a use-case example for the [Hyperledger Healthcare Special Interest Group - Payer Subgroup](https://wiki.hyperledger.org/display/HCSIG/HC-SIG+-+Payer+Subgroup) written by [Dr Kent Lau](linkedin.com/in/kentglau).

## Architecture

4 peers - payer, provider, pharmacist, member

4 couchDB

Certificate Authority (CA)

Command Line Interface (CLI)

1 channel - prescriptionchannel

1 chaincode - MPMcc

## Software Spec

hyperledger/fabric:2.2.0

hyperledger/fabric-couchDB:0.4

## Usage

Run automated demo steps:
<pre>
./1-start-fabric220.sh          # Starts network, creates channel, connects all peers to channel.

./2-MPMcc.sh                    # Packages, installs and instantiates MPM chaincode.

./3-MPMaddRecord.sh             # Adds 3 records of dummy data to ledger.

./4-MPMqueryRecord.sh           # Queries the data from those 3 records on the ledger.

./5-teardown-fabric220.sh       # Tears down the network and removes all related containers.
</pre>

## Data Elements in MPM Chaincode


     '001-PRESCRIPTION-ID:':prescriptionId,
     '002-PROVIDER-ID:':data1,
     '003-MEMBER-ID:':data2,
     '004-PAYER-ID:':data3,
     '005-PRESCRIPTION':data4,
     '006-REMARKS':data5,
     '007-CONSENT:':data6,

