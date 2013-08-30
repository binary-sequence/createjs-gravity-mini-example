require.config
	paths:
		css: '../css/'
		html: '../html/'
		js: '../js/'

require ['js/libs/requirejs.domReady', 'js/classes/GravityMiniExample', 'js/classes/Ball'], (domReady, GravityMiniExample, Ball)->
	console.info 'Beginning of main.js'
	domReady ()->
		gravity_mini_example = new GravityMiniExample()
		gravity_mini_example.preload_data()
		# TODO: Preload images.
		# TODO: Preload sounds.
		# TODO: Initialize createjs.
		console.info "DOM is ready"
		stage = new createjs.Stage("canvasScreen")
		circle = new createjs.Shape()
		circle.graphics.beginFill("red").drawCircle(0, 0, 50)
		circle.x = 100
		circle.y = 100
		stage.addChild(circle)
		stage.update()
		# TODO: Initialize stats (fps).
		# TODO: Events: onload, click, resize, oncontextmenu
	console.info 'End of main.js'
	return 1
