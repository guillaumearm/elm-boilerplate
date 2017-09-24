.PHONY: re all build test clean clean-stuff dev
### ENVIRONMENT VARIABLES ###

# BASIC
APP_TITLE?=elm-boilerplate
ELM_STUFF=elm-stuff
ELM_PACKAGE=elm-package.json
MAIN=Main.elm
BUNDLE=elm.js

# CACHE
ELM_STUFF_ARTIFACTS=$(ELM_STUFF)/build-artifacts
TESTS_ELM_STUFF_ARTIFACTS=$(TESTS_FOLDER)/$(ELM_STUFF_ARTIFACTS)

# INSTALL
ELMINSTALL=elm package install -y

# BUILD
ELMMAKE=elm make

# DEV
PORT?=8000
ELMLIVE=elm live --open --pushstate --port=$(PORT)

# TESTS
TESTS_FOLDER=tests
TESTS_ELM_STUFF=$(TESTS_FOLDER)/$(ELM_STUFF)
ELMTEST=elm test

# MISC
CD=cd
ECHO=echo
RIMRAF=rm -rf

# GIT
GIT=git
GIT_INITIAL_MESSAGE="Init $(APP_TITLE)"
GIT_FOLDER=.git
GITIGNORE=.gitignore

define GITIGNORE_CONTENT
$(ELM_STUFF)
$(BUNDLE)
endef
export GITIGNORE_CONTENT

# Main.elm
define MAIN_CONTENT
module Main exposing (..)

import Html exposing (..)


main = text "$(APP_TITLE)"
endef
export MAIN_CONTENT

# index.html
INDEX_HTML=index.html
define INDEX_HTML_CONTENT
<!DOCTYPE HTML>
<html>

<head>
  <meta charset="UTF-8">
  <title>$(APP_TITLE)</title>
  <script type="text/javascript" src="/$(BUNDLE)"></script>

  <link rel="stylesheet" href="/$(STYLES_CSS)">
</head>

<body>
</body>

<script type="text/javascript">
  var app = Elm.Main.fullscreen();
</script>

</html>
endef
export INDEX_HTML_CONTENT

# STYLES
STYLES_CSS=style.css
define STYLES_CSS_CONTENT
endef
export STYLES_CSS_CONTENT

### BASIC COMMANDS

all: $(ELM_PACKAGE) $(TESTS_FOLDER) \
	$(GITIGNORE) $(MAIN) $(INDEX_HTML) $(STYLES_CSS) \
	$(TESTS_ELM_STUFF) $(ELM_STUFF) \
	$(ELM_STUFF_ARTIFACTS) $(TESTS_ELM_STUFF_ARTIFACTS) \
	$(GIT_FOLDER)

dev: all
	$(ELMLIVE) $(MAIN) --output=$(BUNDLE)

# install
$(ELM_PACKAGE) $(ELM_STUFF):
	$(ELMINSTALL)

# build
$(ELM_STUFF_ARTIFACTS):
	@$(ELMMAKE)

$(TESTS_ELM_STUFF_ARTIFACTS):
	@$(CD) $(TESTS_FOLDER) && $(ELMMAKE)

# tests
$(TESTS_FOLDER):
	$(ELMTEST) init

$(TESTS_ELM_STUFF):
	@$(CD) $(TESTS_FOLDER) && $(ELMINSTALL)

# git
$(GIT_FOLDER):
	$(GIT) init && $(GIT) add . && $(GIT) commit -m $(GIT_INITIAL_MESSAGE)

clean:
	@$(RIMRAF) $(BUNDLE) $(ELM_STUFF_ARTIFACTS) $(TESTS_ELM_STUFF_ARTIFACTS) && $(ECHO) Cleaned!

clean-stuff:
	@$(RIMRAF) $(ELM_STUFF) $(TESTS_ELM_STUFF)

test: all
	$(ELMTEST)

re: clean all

### INIT PROJECT ###
LOG=$(ECHO) create
$(GITIGNORE):
	@$(ECHO) "$$GITIGNORE_CONTENT" > $(GITIGNORE) && $(LOG) $(GITIGNORE)

$(MAIN):
	@$(ECHO) "$$MAIN_CONTENT" > $(MAIN) && $(LOG) $(MAIN)

$(INDEX_HTML):
	@$(ECHO) "$$INDEX_HTML_CONTENT" > $(INDEX_HTML) && $(LOG) $(INDEX_HTML)

$(STYLES_CSS):
	@$(ECHO) "$$STYLES_CSS_CONTENT" > $(STYLES_CSS) && $(LOG) $(STYLES_CSS)
