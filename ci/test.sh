#!/bin/bash -e

echo "running ui tests"
npm run lint
npm run coverage

echo "running the server tests"
./lein.sh lint
./lein.sh unit

echo "moving test reports"
mkdir -p ./target/test-reports/client
mv ./target/client/*.xml ./target/test-reports/client
mkdir -p ./target/test-reports/server
mv ./target/surefire-reports/*.xml ./target/test-reports/server
