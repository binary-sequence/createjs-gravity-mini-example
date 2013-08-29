define ()->
	console.info 'Beginning of GravityMiniExample.js'
##/**
## * @class GravityMiniExample
## * Set of application methods.
## */
	class GravityMiniExample
##	/**
##	  * Constructor of GravityMiniExample.
##	  * @constructor
##	  */
		constructor: ()->
			console.info 'Instance of GravityMiniExample'
			@data_path = '../data/'
			@images = {}
			@preload = null
			console.info @
##	/**
##	  * @method handleFileError
##	  * Executed when preloading of an image fails.
##	  * @param {Object} e Event data.
##	  */
		handleFileError: (e)->
			console.error 'handleFileError'
			console.error e
			return `void 0`
##	/**
##	  * @method handleFileLoad
##	  * Executed when an image is preloaded.
##	  * @param {Object} e Event data.
##	  */
		handleFileLoad: (e)->
			console.info 'handleFileLoad'
			console.info e
			@images[e.src] = e.result # Get a reference to the loaded image (<img/>)
			return e.result
##	/**
##	  * @method handleFileProgress
##	  * TODO: Description.
##	  * @param {Object} e Event data.
##	  */
		handleFileProgress: (e)->
			console.info 'handleFileProgress'
			console.info e
			return `void 0`
##	/**
##	  * @method handleOverallProgress
##	  * TODO: Description.
##	  * @param {Object} e Event data.
##	  */
		handleOverallProgress: (e)->
			console.info 'handleOverallProgress'
			console.info 'Progress: ' + @preload.progress * 100
			return @preload.progress * 100
##	/**
##	  * @method preload_data
##	  * Preloads images and sounds of the application.
##	  * @param {Object} e Event data.
##	  */
		preload_data: ()->
			images_paths: [
				@data_path + "img/background.bmp"
				@data_path + "img/ball0.png"
				@data_path + "img/ball1.png"
			]
			console.info @preload
			#@preload.close() if @preload != null and @preload != 'undefined'
			@preload = new createjs.PreloadJS()
			console.info @preload
			@preload.onFileLoad = handleFileLoad
			@preload.onProgress = handleOverallProgress
			@preload.onFileProgress = handleFileProgress
			@preload.onError = handleFileError
			@preload.setMaxConnections(5)
			while (@images_paths.length > 0)
				item = @images_paths.shift()
				@preload.loadFile(item)
			return `void 0`

	console.info 'End of GravityMiniExample.js'
	return GravityMiniExample
