#!/usr/bin/env sh

ls -l /bin/bash && /bin/bash --version

npm install -g .

mkdir test-app && cd test-app || exit 1

elm create test-app || exit 1
elm test | grep "Running 1 test" || exit 1

cd .. && rm -rf test-app
