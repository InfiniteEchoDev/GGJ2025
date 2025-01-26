/// @description Insert description here
// You can write your code in this editor

 

//
//scr_drawDebugText("left " + string(input_value("aim_left")) , x -  240, y - 140, 0);
//
//scr_drawDebugText("right " + string(input_value("aim_right")) , x - 240, y - 160, 0);
//
//scr_drawDebugText("up " + string(input_value("aim_up")) , x - 240, y - 180, 0);
//
//scr_drawDebugText("down " + string(input_value("aim_down")) , x - 240, y - 200, 0);
//
//
//
//scr_drawDebugText( "exhaustJumpTimer: " + string(rh_axis),  x, y, 120 );
  //
 //
//scr_drawDebugText( " wandAngle: " + string( wandAngleInDegrees ),  x, y - 140, 0 );
//scr_drawDebugText( " wandClosePos: " + string( wandClosePos ),  x, y - 160, 0 );
//scr_drawDebugText( " wandRadius: " + string( wandRadius ),  x, y -180, 0 );
//scr_drawDebugText( " wandSpeed: " + string( wandSpeed ),  x, y - 200, 0 );
//scr_drawDebugText( " wandTransverseSpeed: " + string( wandTransverseSpeed ),  x, y - 220, 0 );
	  
	  
if (player == 1) {
	image_blend = c_orange;	 
}
	
	
draw_self();

//draw_line_width_color(x,y, wandX, wandY, wandWidth, c_purple, c_purple );
draw_line_width_color(wandClosePos.x, wandClosePos.y, wandFarPos.x, wandFarPos.y, wandWidth, c_purple, c_purple );

