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
			@data_path = '../../data/'
			@images = {}
			@preloadjs = null
			console.info @
##	/**
##	  * @method handleComplete
##	  * Executed when preloading is completed.
##	  * @param {Object} e Event data.
##	  */
		handleComplete: (e)->
			console.info 'handleComplete'
			console.info e
			return `void 0`
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
			return e.item # Reference to the loaded file (<img/>, <audio>)
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
			console.info 'Progress: ' + @preloadjs.progress * 100
			return @preloadjs.progress * 100
##	/**
##	  * @method preload_data
##	  * Preloads images and sounds of the application.
##	  * @param {Object} e Event data.
##	  */
		preload_data: ()->
			data_manifest = [
				{id: "img/background",    src: @data_path + "img/background.bmp"}
				{id: "img/ball0",         src: @data_path + "img/ball0.png"}
				{id: "img/ball1",         src: @data_path + "img/ball1.png"}
				{id: "sound/ballbounces", src: @data_path + "sound/ballbounces.mp3"}
			]
			@preloadjs = new createjs.LoadQueue(true)
			@preloadjs.addEventListener("fileload", @handleFileLoad)
			@preloadjs.addEventListener("complete", @handleComplete)
			@preloadjs.addEventListener("onProgress", @handleOverallProgress)
			@preloadjs.addEventListener("fileprogress", @handleFileProgress)
			@preloadjs.addEventListener("error", @handleFileError)
			# @preloadjs.setMaxConnections(5)
			@preloadjs.installPlugin(createjs.Sound)
			@preloadjs.loadManifest(data_manifest)
			return `void 0`

	console.info 'End of GravityMiniExample.js'
	return GravityMiniExample
