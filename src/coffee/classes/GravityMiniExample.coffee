define ['js/classes/Ball'], (Ball)->
	console.info 'Beginning of GravityMiniExample.js'
##/**
## * @class GravityMiniExample
## * Set of application methods: Manage graphics and elements.
## */
	class GravityMiniExample
##	/**
##	  * Constructor of GravityMiniExample.
##	  * @constructor
##	  */
		constructor: (@debugMode, @width, @height)->
			console.info 'Instance of GravityMiniExample'
			@debugMode = false if debugMode is undefined
			@width = 320 if width is undefined
			@height = 240 if height is undefined
			@data_path = '../../data/'
			@images = {}
			@preloadjs = null
			@ball = new Ball()
			@stage = new createjs.Stage("canvasScreen")
			@stage.canvas.width = @width
			@stage.canvas.height = @height
			@adjustCanvasScreen()
			console.info @
##	/**
##	  * @method adjustCanvasScreen
##	  * Adjust the size of the canvas depending on actual ratio.
##	  */
		adjustCanvasScreen: ()->
			# Get desire ratio = width / height.
			widthToHeight = @width / @height;

			# Get actual ratio = width / height.
			newWidth = window.innerWidth;
			newHeight = window.innerHeight;
			newWidthToHeight = newWidth / newHeight;

			# If it is wider than higher...
			if (newWidthToHeight > widthToHeight)
				# fit height.
				newWidth = newHeight * widthToHeight
				@stage.canvas.style.height = newHeight + 'px'
				@stage.canvas.style.width = newWidth + 'px'
			else # If it is higher than wider...
				# fit width.
				newHeight = newWidth / widthToHeight
				@stage.canvas.style.width = newWidth + 'px'
				@stage.canvas.style.height = newHeight + 'px'

			# Center canvas.
			@stage.canvas.style.marginTop = (-newHeight / 2) + 'px';
			@stage.canvas.style.marginLeft = (-newWidth / 2) + 'px';
##	/**
##	  * @method handleComplete
##	  * It is fired when the entire queue has been loaded.
##	  * @param {Object} e Event data.
##	  */
		handleComplete: (e)->
			console.info 'handleComplete'
			console.info e
			return `void 0`
##	/**
##	  * @method handleFileError
##	  * It is fired when the loader encounters an error.
##	  * @param {Object} e Event data.
##	  */
		handleFileError: (e)->
			console.error 'handleFileError'
			console.error e
			return `void 0`
##	/**
##	  * @method handleFileLoad
##	  * It is fired when an individual file has loaded, and been processed.
##	  * @param {Object} e Event data.
##	  */
		handleFileLoad: (e)->
			console.info 'handleFileLoad'
			console.info e
			return e.item # Reference to the loaded file (<img/>, <audio>)
##	/**
##	  * @method handleFileProgress
##	  * It is fired when an an individual file progress changes.
##	  * @param {Object} e Event data.
##	  */
		handleFileProgress: (e)->
			console.info 'handleFileProgress'
			console.info e
			return `void 0`
##	/**
##	  * @method handleOverallProgress
##	  * It is fired when the overall progress changes.
##	  * @param {Object} e Event data.
##	  */
		handleOverallProgress: (e)->
			console.info 'handleOverallProgress'
			console.info 'Progress: ' + @preloadjs.progress * 100
			return @preloadjs.progress * 100
##	/**
##	  * @method updateCanvas
##	  * Update the graphics in the canvas.
##	  */
		updateCanvas: ()->
			circle = new createjs.Shape()
			circle.graphics.beginFill("red").drawCircle(0, 0, 50)
			circle.x = 100
			circle.y = 100
			@stage.addChild(circle)
			@stage.update()
##	/**
##	  * @method preload_data
##	  * Preloads images and sounds of the application.
##	  * @param {Object} e Event data.
##	  */
		preload_data: ()->
			data_manifest = [
				{id: "img/background",    src: "img/background.bmp"}
				{id: "img/ball0",         src: "img/ball0.png"}
				{id: "img/ball1",         src: "img/ball1.png"}
				{id: "sound/ballbounces", src: "sound/ballbounces.mp3"}
			]
			@preloadjs = new createjs.LoadQueue(true, @data_path)
			@preloadjs.addEventListener("fileload", @handleFileLoad)
			@preloadjs.addEventListener("complete", @handleComplete)
			@preloadjs.addEventListener("onProgress", @handleOverallProgress)
			@preloadjs.addEventListener("fileprogress", @handleFileProgress)
			@preloadjs.addEventListener("error", @handleFileError)
			@preloadjs.installPlugin(createjs.Sound)
			@preloadjs.loadManifest(data_manifest)
			return `void 0`

	console.info 'End of GravityMiniExample.js'
	return GravityMiniExample
