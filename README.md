elm-boilerplate
================

A simple Makefile able to create Elm app.

[![Build Status](https://travis-ci.org/guillaumearm/elm-boilerplate.svg?branch=master)](https://travis-ci.org/guillaumearm/elm-boilerplate)

### Installation
Make sure you have `elm`, `elm-live`, `elm-test` and `elm-css` installed :

```bash
$ 2> /dev/null npm list --global --depth=0 | grep elm
```

or install them :

```bash
$ npm install --global elm elm-live elm-test elm-css
```

and simply install elm-boilerplate :
```bash
$ npm install --global elm-boilerplate
```

### Create app
```bash
$ mkdir hello-world
$ cd hello-world
$ elm create hello world
$ make help
```

### Start dev server
```bash
make dev # start dev server on port 8000
make dev PORT=1337 # start dev server on port 1337
```

### Start debug server
```bash
make debug # start debug server on port 8000
make debug PORT=1337 # start debug server on port 1337
```
