#!/bin/bash

#  Dr Kent G Lau
#  kenty@kenty.com

#  HealthcareSIG Payer Subgroup 2020

# Exit on first error, print all commands.
set -e

# Shut down the Docker containers for the system tests.
docker-compose -f docker-compose-v2.2.0.yml kill && docker-compose -f docker-compose-v2.2.0.yml down 

# remove the local state
rm -f ~/.hfc-key-store/*

# remove chaincode docker images
docker rm $(docker ps -aq)
docker rmi $(docker images dev-* -q)

# Your system is now clean
