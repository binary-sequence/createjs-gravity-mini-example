require.config
	paths:
		css: '../css/'
		html: '../html/'
		js: '../js/'

require ['js/Ball'], (Ball)->
	# TODO
	console.info 'Beginning of main.js'
	ball = new Ball()
	console.info 'End of main.js'
	return 1
