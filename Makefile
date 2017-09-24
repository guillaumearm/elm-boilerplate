.PHONY: re all test clean dev
### ENVIRONMENT VARIABLES ###

# BASIC
APP_TITLE?=elm-boilerplate
ELM_STUFF=elm-stuff
ELM_PACKAGE=elm-package.json
MAIN=Main.elm
BUNDLE=elm.js

# INSTALL
ELMINSTALL=elm package install -y

# DEV
ELMLIVE=elm live --open --pushstate

# TESTS
TESTS_FOLDER=tests
TESTS_ELM_STUFF=$(TESTS_FOLDER)/$(ELM_STUFF)
ELMTEST=elm test

# MISC
CD=cd
ECHO=echo
RIMRAF=rm -rf

# GIT
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

all: $(ELM_PACKAGE) $(GITIGNORE) $(MAIN) $(INDEX_HTML) $(STYLES_CSS)

dev: all
	$(ELMLIVE) $(MAIN) --output=$(BUNDLE)

# install
$(ELM_PACKAGE) $(ELM_STUFF):
	$(ELMINSTALL)

# tests
$(TESTS_ELM_STUFF):
	@$(CD) $(TESTS_FOLDER) && $(ELMINSTALL)

clean:
	@$(RIMRAF) $(ELM_STUFF) $(TESTS_ELM_STUFF) $(BUNDLE)

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
