require.config({
	paths: {
		css: '../../build/css',
		html: '../../build/html',
		js: '../../build/js'
	}
});

require(['js/libs/createjs-2013.05.14.min', 'js/Ball'], function(createjs, Ball) {
	console.info('Beginning of tests.js');

	test("Ball class", function() {
		var result = null;
		var expected = null;
		// Test properties on Ball().
		result = new Ball();
		equal( typeof(result), 'object', "typeof(Ball()) == 'object'" );
		equal( result.x, 150, "Ball(), x = 150" );
		equal( result.y, 50, "Ball() y = 50" );
		equal( result.speed_x, 4, "Ball() speed_x = 4" );
		equal( result.speed_y, 0, "Ball() speed_y = 0" );
		// Test properties on Ball(1, 2, 3, 4).
		result = new Ball(1, 2, 3, 4);
		equal( typeof(result), 'object', "typeof(Ball(1, 2, 3, 4)) == 'object'" );
		equal( result.x, 1, "Ball(1, 2, 3, 4), x = 1" );
		equal( result.y, 2, "Ball(1, 2, 3, 4) y = 2" );
		equal( result.speed_x, 3, "Ball(1, 2, 3, 4) speed_x = 3" );
		equal( result.speed_y, 4, "Ball(1, 2, 3, 4) speed_y = 4" );
		// Test update method.
		result = new Ball(150, 50, 4, 0);
		result.update();
		expected = new Ball(150, 50, 4, 0);
		expected.speed_y += 0.4;
		expected.y += expected.speed_y;
		expected.speed_x -= 0.01 * expected.speed_x;
		expected.x += expected.speed_x;
		deepEqual(result, expected, "update(), gravity, acceleration, friction.");
		result = new Ball(150, 175.6, 4, 0);
		result.update();
		expected = new Ball(150, 175.6, 4, 0);
		expected.speed_y += 0.4;
		expected.speed_y -= 0.8;
		expected.speed_y *= -1;
		expected.y = 176;
		expected.speed_x -= 0.01 * expected.speed_x;
		expected.x += expected.speed_x;
		deepEqual(result, expected, "update(), bottom collision.");
		// TODO: Check stop.
	});

	console.info('End of tests.js');
});
