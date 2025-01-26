/// @desc Balls
//if (live_call()) return live_result; // GameMaker Live


scr_tallyBallObjs(forPlayer );


 
if (ds_list_size(balls) > 0) {

	/*
	var gamepadBall = ds_list_find_value(balls,0);    

	if (instance_exists(oPlayer)) {
	
		gamepadBall.x = oPlayer.x; // mySpeed*( -input_value("left") + input_value("right"));

		gamepadBall.y = oPlayer.y; // mySpeed*(-input_value("up") + input_value("down"));
	}
	*/

	/*
	var b = ds_list_find_value(balls,1);                  //Reference the ball at the mouse position

	//Move the second ball to the mouse position

	b.x = mouse_x;
	b.y = mouse_y;

*/

	len = ds_list_size(balls);                            //Update number of balls

	//Loop through all grid points

	for (var i = 0; i < width; i++;)
	{
		for (var j = 0; j < height; j++;)
		{
			//Find mid-point of grid square
		
			var xx = (size/2)+(i*size);
			var yy = (size/2)+(j*size);
		
			var sum = 0;                                  //Sum of distance to each ball
		
			//Loop through all balls
		
			for (var k = 0; k < len; k++;)
			{
				var c = ds_list_find_value(balls,k);      //Reference ball
				var dist = point_distance(xx,yy,c.x,c.y); //Store distance between mid point and ball position
				if( dist < bubble_too_far_thresh )
					sum += c.r/(power( dist, 1.55 ));                          //Inverse proportion between radius and distance (high distance and size = small value)
			}
		
			//var s = -2; // -1;
			//var s = -1;
			var s = -1;
			
			ds_grid_set(grid,i,j,                         //Set value of grid point
			sum                                           //Sum of distance
			+ s);                                         //Reduce size
		}	
	}

}