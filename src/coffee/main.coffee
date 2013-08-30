require.config
	paths:
		css: '../css/'
		html: '../html/'
		js: '../js/'

require ['js/libs/requirejs.domReady', 'js/classes/GravityMiniExample'], (domReady, GravityMiniExample)->
	console.info 'Beginning of main.js'
	domReady ()->
		console.info "DOM is ready"
		gravity_mini_example = new GravityMiniExample(true)
		gravity_mini_example.preload_data()
		gravity_mini_example.updateCanvas()
		# TODO: Initialize stats (fps).
		# TODO: Events: onload, click, resize, oncontextmenu
	console.info 'End of main.js'
	return 1
