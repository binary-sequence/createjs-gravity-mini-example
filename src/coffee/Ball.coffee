define ()->
  console.info 'Beginning of Ball.js'

  class Ball
    constructor: (@x, @y, @speed_x, @speed_y)->
      console.info 'Instance of Ball '
      @x = 150 if not x
      @y = 50 if not y
      @speed_x = 4 if not speed_x
      @speed_y = 0 if not speed_y
      console.info @

    update: ()->
      # Fix infinite movement.
      @vel_y = 0 if @y >= 176 and -0.4 < @speed_y < 0.4

      @speed_y += 0.4; # Gravity.

      if @y + @speed_y >= 176
        @speed_y -= 0.8 # Colision, loses speed.
        @speed_y *= -1  # Invert direction.
        @y = 176        # Does not go through floor.
      else
        @y += speed_y

      # Decrease acceleration.
      @speed_x -= 0.01 * @speed_x if @speed_x isnt 0

      # Fix infinite movement.
      @speed_x = 0 if -0.1 < @speed_x < 0.1

      # Colision, invert direction.
      @speed_x *= -1 if @x >= 302 or @x < 0

      @x += @speed_x # Horizontal movement.

      return undefined

  console.info 'End of Ball.js'
  return Ball