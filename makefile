compile: force
	jade -o build/html src/jade/
	stylus -o build/css/ src/stylus/*
	coffee -c -o build/js src/coffee

docs:
	# TODO

force:

install-dependencies:
	# INSTALLING GIT
	apt-get install git
	# INSTALLING NODE.JS
	wget http://nodejs.org/dist/v0.10.16/node-v0.10.16.tar.gz
	tar xzvf node-v0.10.16.tar.gz
	cd node-v0.10.16/ \
	./configure
	make
	make install
	rm -r node-v0.10.16/ node-v0.10.16.tar.gz
	# INSTALLING COFFEESCRIPT
	npm install -g coffee-script
	# INSTALLING JADE
	npm install -g jade
	# INSTALLING STYLUS
	npm install -g stylus

tests: compile
	google-chrome `pwd`/tests/html/tests.html `pwd`/build/html/index.html
