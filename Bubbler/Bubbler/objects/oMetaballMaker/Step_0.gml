/// @description Balls

var b = ds_list_find_value(balls,1);

// Move the ball to the mouse position

b.x = mouse_x;
b.y = mouse_y;

len = ds_list_size(balls); // update number of balls

// loop through all grid poitns

for (var i = 0; i < width; i++;)
{

	for (j = 0; j < height; j++;)
	{
		// Find mid-point of grid square
		
		var xx = (size/2) + (i*size);
		var yy = (size/2) + (j*size);
		
		var sum = 0;  // Sum of distance to each ball
		
		// Loop through all balls
		
		for (var k = 0; k < len; k++;)
		{
			var c = ds_list_find_value(balls, k); // Reference ball
			var dist = point_distance(xx,yy,c.x, c.y); // store distance between mid point and ball position
			sum += c.r/dist;			// i Inver proportion between radius and distance (high distance andsize = smaller if far away from circle 
		}
		
		var s = -1;
		
		ds_grid_set(grid, i, j,			// set value of grid point
		sum								// sum of distance
		+ s);							// reduce size
	
		
	}

}
