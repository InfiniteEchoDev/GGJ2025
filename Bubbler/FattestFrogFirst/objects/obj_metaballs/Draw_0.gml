/// @desc Visualize field

//if (live_call()) return live_result; // GameMaker Live

var bubbleShines = 0;

function Vector2(xx, yy) constructor                                      //Constructor function to make new 2d vector struct
{
	x = xx;
	y = yy;
}

function getState(a, b, c, d)                                             //Convert binary to base 10
{
	//if a > 0 return 8 else 0
	
	return (a > 0 ? 8 : 0) + (b > 0 ? 4 : 0) + (c > 0 ? 2 : 0) + (d > 0 ? 1 : 0);
}

draw_set_colour(c_red);

//for (var i = 0; i < len; i++;)                                            //Loop through all balls
//{
	//var b = ds_list_find_value(balls,i);                                  //Reference ball
	//if (instance_exists(b)) {
		////draw_circle(b.x,b.y,b.r,true);                                        //Draw a circle with the correct position and radius
	//}
//}

if (forPlayer == 0) {
	draw_set_colour(c_lime);
} else {
	draw_set_colour(c_orange);
}


//Loop through all grid points

for (var i = 0; i < width-1; i++;)                                        //Stop before the end because you can't reference points off the grid
{
	for (var j = 0; j < height-1; j++;)
	{
		//Find values of corner points
		
		var f0 = ds_grid_get(grid,i,j);                                   //Top left
		var f1 = ds_grid_get(grid,i+1,j);                                 //Top right
		var f2 = ds_grid_get(grid,i+1,j+1);                               //Bottom right
		var f3 = ds_grid_get(grid,i,j+1);                                 //Bottom left

		function l(a,b)                                                   //Function for linear interpolation
		{
			return a/(a-b);                                               //return 0.5 to disable linear interpolation
		}

		var pos = new Vector2(i*size, j*size);                            //New vector 2 in top left corner
		var a = new Vector2(pos.x + size * l(f0,f1), pos.y);              //A point in top left
		var b = new Vector2(pos.x + size, pos.y + size * l(f1,f2));       //B point in top right
		var c = new Vector2(pos.x + size * (1 - l(f2,f3)), pos.y + size); //C point in bottom right
		var d = new Vector2(pos.x, pos.y + size * (1 - l(f3,f0)));        //D point in bottom left
		
		state = getState(f0, f1, f2, f3);                                 //State variable to store the base 10 representation of the grid state
		
		var w = 4;                                                        //Line width
		var m = 2;                                                        //Circle radius (multiplier of line width, 1 for no visible circles)
		
		switch state                                                      //Draw lines and circles of metaballs
		{
			case 1:                                                       //Same case for 1 and 14
			case 14:
				draw_line_width(c.x,c.y,d.x,d.y,w);                       //Draw line between points
			 
				var bubX = c.x + (  d.x - c.x)/2;
				var bubY = c.y + ( d.y-c.y)/2;
				if (bubbleShines == 0) {
					draw_sprite_ext(Bubble_Sheen_1rotated, 0, bubX, bubY,0.20,0.2,0,c_white,0.3);
					bubbleShines++;	
				}
			//	draw_circle(d.x,d.y,(w/2)*m,false);                       //Draw circle at end point
				break;
			case 2:
			case 13:
				var p = new Vector2(b.x,b.y);
				var q = new Vector2(c.x,c.y);
				draw_line_width(p.x,p.y,q.x,q.y,w);
			//	draw_circle(q.x,q.y,(w/2)*m,false);
				break;
			case 3:
			case 12:
				draw_line_width(b.x,b.y,d.x,d.y,w);
			//	draw_circle(d.x,d.y,(w/2)*m,false);
				break;
			case 4:
			case 11:
				draw_line_width(a.x,a.y,b.x,b.y,w);
				//draw_circle(b.x,b.y,(w/2)*m,false);
				break;
			case 5:
				draw_line_width(a.x,a.y,d.x,d.y,w);
				draw_line_width(b.x,b.y,c.x,c.y,w);
				//draw_circle(d.x,d.y,(w/2)*m,false);
				//draw_circle(c.x,c.y,(w/2)*m,false);
				break;
			case 6:
			case 9:
				draw_line_width(a.x,a.y,c.x,c.y,w);
			//	draw_circle(c.x,c.y,(w/2)*m,false);
				break;
			case 7:
			case 8:
				draw_line_width(a.x,a.y,d.x,d.y,w);
				//draw_circle(d.x,d.y,(w/2)*m,false);
				break;
			case 10:
				draw_line_width(a.x,a.y,b.x,b.y,w);
				draw_line_width(c.x,c.y,d.x,d.y,w);
				//draw_circle(d.x,d.y,(w/2)*m,false);
				break;
		}
	}
}


//scr_drawDebugText( "num balls: " + string( len ), 0, 0, 0 );
//scr_drawDebugText( "fps: " + string_format( 1 / ( delta_time / 1000000 ), 4, 8 ), 0, 20, 0 );