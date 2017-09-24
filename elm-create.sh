#!/usr/bin/env sh

function error() {
  >&2 echo $*
  exit 1
}

[ "$*" == "" ] && error Usage: elm create "Your app name" && exit 1

[ "$(/usr/bin/env ls -A)" != "" ] && error Error: current folder should be empty

cp ~/trap/elm/boilerplate/Makefile . || error Error: Makefile not found

echo Creating app : $*
APP_TITLE="$*" make
