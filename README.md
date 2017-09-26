elm-boilerplate
================

A simple Makefile able to create a new Elm app.

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

### Create a new app
elm-boilerplate allows you to create a new Elm app by using `elm-create`

```bash
$ mkdir hello-world
$ cd hello-world
$ elm create hello world
$ make help
```

### Start dev server
During development, you can use `make dev` to start `elm-live` and benefit from livereload
```bash
make dev # start dev server on port 8000
make dev PORT=1337 # start dev server on port 1337
```

### Start debug server
During debug, you can use `make debug` to start `elm-reactor` and benefit from the history
```bash
make debug # start debug server on port 8000
make debug PORT=1337 # start debug server on port 1337
```

### Run tests
You can run all tests suites with `make test` or use the watch mode with `make test-watch`
```bash
make test # run tests suites
make test-watch # watch mode
```
