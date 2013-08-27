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
		// CREATE INSTANCE OF BALL
		result = new Ball();
		equal( typeof(result), 'object', "typeof(result) == 'object'" );
		equal( result.x, 150, "Ball(), x = 150" );
		equal( result.y, 50, "Ball() y = 50" );
	});

	console.info('End of tests.js');
});
