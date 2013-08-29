define ()->
	console.info 'Beginning of Ball.js'
##/**
## * @class Ball
## * A 2 dimensional ball that bounces.
## */
	class Ball
##	/**
##	  * Constructor of Ball.
##	  * @constructor
##	  * @param {Numeric} [x=150] Position in the x-axis.
##	  * @param {Numeric} [y=50] Position in the y-axis.
##	  * @param {Numeric} [speed_x=4] Speed in the x-axis.
##	  * @param {Numeric} [speed_y=0] Speed in the y-axis.
##	  */
		constructor: (@x, @y, @speed_x, @speed_y)->
			console.info 'Instance of Ball '
			@x = 150 if x is undefined
			@y = 50 if y is undefined
			@speed_x = 4 if speed_x is undefined
			@speed_y = 0 if speed_y is undefined
			console.info @
##	/**
##	  * @method update
##	  * Executed each frame to update properties.
##	  */
		update: ()->
			if @y >= 176 and -0.4 < @speed_y < 0.4
				@speed_y = 0 # Fix infinite movement.
			else
				@speed_y += 0.4 # Gravity.
				if @y + @speed_y >= 176
				  @speed_y -= 0.8 # Collision, loses speed.
				  @speed_y *= -1  # Invert direction.
				  @y = 176        # Does not go through floor.
				else
				  @y += @speed_y # Vertical movement.


			# Decrease acceleration.
			@speed_x -= 0.01 * @speed_x if @speed_x isnt 0

			# Fix infinite movement.
			@speed_x = 0 if -0.1 < @speed_x < 0.1

			if 0 < @x + @speed_x < 302
				@x += @speed_x # Horizontal movement.
			else
				@speed_x *= -1        # Collision, invert direction.
				@x = 0 if @x < 0      # Does not go through walls.
				@x = 301 if @x >= 302 # Does not go through walls.

			return undefined

	console.info 'End of Ball.js'
	return Ball
