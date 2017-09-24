#!/usr/bin/env sh

abs(){
    if [[ -d "$1" ]]; then
        cd "$1"
        echo "$(pwd -P)"
    else
        cd "$(dirname "$1")"
        echo "$(pwd -P)/$(basename "$1")"
    fi
}

ELM_BOILERPLATE_DIR=$(abs $(dirname $(abs $0))/../lib/node_modules/elm-boilerplate)

error() {
  >&2 echo $*
  exit 1
}

[ "$*" == "" ] && error Usage: elm create "Your app name" && exit 1

[ "$(/usr/bin/env ls -A)" != "" ] && error Error: current folder should be empty

cp $ELM_BOILERPLATE_DIR/Makefile . || error Error: Makefile not found

echo Creating app : $*
APP_TITLE="$*" make
