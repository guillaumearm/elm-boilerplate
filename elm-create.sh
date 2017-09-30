#!/usr/bin/env sh

abs(){
    if [ -d "$1" ]; then
        cd "$1" 2> /dev/null
        echo "$(pwd -P)"
    else
        cd "$(dirname "$1")" 2> /dev/null
        echo "$(pwd -P)/$(basename "$1")"
    fi
}

ELM_DEFAULT_BOILERPLATE_DIR=$(abs $(dirname $(abs $0))/../lib/node_modules/elm-boilerplate)
: ${ELM_BOILERPLATE_DIR:=$ELM_DEFAULT_BOILERPLATE_DIR}

error() {
  >&2 echo $*
  exit 1
}

ELM_VERSION=$(elm --version)
VERSION=$($ELM_BOILERPLATE_DIR/print-version.js)

USAGE=`cat << --
elm-create $VERSION (Elm Platform $ELM_VERSION)\n
\n
Usage: elm-create <name-of-your-project>\n
\n
Available options:\n
  \t-h, --help      \tShow this help text\n
  \t-v, --version   \tShow version of elm-create\n

Examples:\n
  \telm-create "Hello World"\n
--`

[ "$1" == "--help" -o "$1" == "-h" ] && echo $USAGE && exit 0
[ "$1" == "--version" -o "$1" == "-v" ] && echo v$VERSION && exit 0

[ "$*" == "" ] && error $USAGE

[ "$(/usr/bin/env ls -A)" != "" ] && error Error: current folder should be empty

cp $ELM_BOILERPLATE_DIR/Makefile . || error Error: Makefile not found

echo Creating app : $*
APP_TITLE="$*" make install
