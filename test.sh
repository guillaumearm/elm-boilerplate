#!/usr/bin/env sh
mkdir test-app && cd test-app || exit 1

ELM_BOILERPLATE_DIR=.. ../elm-create.sh test-app || exit 1
elm test | grep "Running 1 test" || exit 1

cd .. && rm -rf test-app
