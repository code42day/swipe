PROJECT=swipe

all: check compile

check: lint

lint:
	jshint index.js

compile: build/build.js

build:
	mkdir -p $@

build/build.js: node_modules index.js | build
	browserify --require ./index.js:$(PROJECT) --outfile $@

.DELETE_ON_ERROR: build/build.js

node_modules: package.json
	npm install
	touch $@

clean:
	rm -fr build node_modules

.PHONY: clean lint check all build
