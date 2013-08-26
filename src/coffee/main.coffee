require.config
	paths:
		css: '../css/'
		html: '../html/'
		js: '../js/'

require ['js/libs/createjs-2013.05.14.min', 'js/Ball'], (createjs, Ball)->
	# TODO
	console.info 'Beginning of main.js'
	ball = new Ball()
	console.info 'End of main.js'
	return 1
