require.config
	paths:
		css: '../css/'
		html: '../html/'
		js: '../js/'

require ['js/libs/requirejs.domReady', 'js/Ball'], (domReady, Ball)->
	console.info 'Beginning of main.js'
	# TODO: Preload images.
	# TODO: Preload sounds.
	ball = new Ball()
	# TODO: Initialize createjs.
	domReady ()->
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
