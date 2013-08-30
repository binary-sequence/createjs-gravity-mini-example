compile: force
	mkdir -p build/html
	jade -o build/html src/jade/
	mkdir -p build/css
	stylus -o build/css/ src/stylus/*
	mkdir -p build/js
	coffee -c -o build/js src/coffee
	cp -r src/css/libs/ build/css/
	cp -r src/js/libs/ build/js/

docs: force
	mkdir -p tmp_dir/
	cp -r src/coffee/ tmp_dir/
	find tmp_dir/ -type f -exec \
	sed -i \
		-e 's_^_//_' \
		-e 's_^//##_\t_' {} \;
	jsduck tmp_dir/coffee/* -o docs/ --title="Gravity (mini example)" --categories="jsduck.categories.json"
	rm -rf tmp_dir/
	find docs/source/ -type f -exec \
	sed -i \
		-e 's_^//__' \
		-e 's_>//_>_' {} \;
	google-chrome `pwd`/docs/index.html

force:

install-dependencies:
	# INSTALLING GIT
	apt-get install git
	# INSTALLING BUILD-ESSENTIAL
	apt-get install build-essential
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
	# INSTALLING RUBY
	# apt-get install ruby irb rdoc
	# INSTALLING RUBYGEMS
	apt-get install ruby1.9.1-dev
	ruby setup.rb
	# INSTALLING JsDuck
	gem install jsduck

tests: compile
	google-chrome localhost/test/createjs-gravedad-mini-ejemplo/tests/html/tests.html localhost/test/createjs-gravedad-mini-ejemplo/build/html/index.html
