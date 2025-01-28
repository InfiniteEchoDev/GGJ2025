/// @desc Inititalize variables

//if (live_call()) return live_result; // GameMaker Live

size = 16; //32;                                                     //Grid size

width = 1 + (room_width/size);                                 //Grid width
height = 1 + (room_height/size);                               //Grid height

metaballInfluenceRange = size * metaballInfluenceRangeGridUnits;

grid = ds_grid_create(width,height);                           //Create grid of points

function Ball(xx, yy, size, ball = noone) constructor                        //Constructor function to make new ball struct
{
    x = xx;                                                    //X position
    y = yy;                                                    //Y position
	r = size;                                                  //Radius
    relatedBall = ball;
}

balls = ds_list_create();                                      //Create list of ball structs
ballsListSize = 0;
len = 0;                                                       //Variable to store number of balls

doCleanEmptyBalls = false;
/*
ds_list_add(balls, new Ball(room_width/2, room_height/2, 64)); //Create a ball at the room center
ds_list_add(balls, new Ball(mouse_x, mouse_y, 64));            //Create a ball at the mouse position
*/

//////////////////////////////////////////////////////////////////

mySpeed = 15;


// ds_ballFrameworkObjects = ds_list_create();