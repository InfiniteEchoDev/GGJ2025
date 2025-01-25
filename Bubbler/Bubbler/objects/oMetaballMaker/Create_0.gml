/// @description Initialize variables


size = 16;

width = 1 + (room_width/size);		// grid size. +1 for checking
height = 1 + (room_height/size);

grid = ds_grid_create(width, height); // create grid of points


function Ball(xx, yy, size) constructor   // Constructor function to make new ball struct
{
	
		x = xx;		// X position
		y = yy;		// Y position
		r = size; // Raidus
	
}


balls = ds_list_create();		// create list of ball structs
len = 0;					// variable to store number of balls

ds_list_add(balls, new Ball(room_width/2, room_height/2, 64)); // Create a ball at the room center
ds_list_add(balls, new Ball(mouse_x, mouse_y, 64)); // create at mouse pos


