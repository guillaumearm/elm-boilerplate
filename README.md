elm-boilerplate
================


### Installation
In your .bashrc or .zshrc or whatever, make sure you have :
```bash
export PATH=$PATH:~/bin
```

then in a terminal :
```bash
$ cd ~
$ mkdir -p bin
$ git clone https://github.com/guillaumearm/elm-boilerplate.git
$ ln -s ~/elm-boilerplate/elm-create.sh ./bin/elm-create
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
