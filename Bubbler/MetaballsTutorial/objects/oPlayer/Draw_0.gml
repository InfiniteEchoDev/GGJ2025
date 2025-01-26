/// @description Insert description here
// You can write your code in this editor

 


scr_drawDebugText("left " + string(input_value("aim_left")) , x -  240, y, 140);

scr_drawDebugText("right " + string(input_value("aim_right")) , x - 240, y, 160);

scr_drawDebugText("up " + string(input_value("aim_up")) , x - 240, y, 180);

scr_drawDebugText("down " + string(input_value("aim_down")) , x - 240, y, 200);



 scr_drawDebugText( "exhaustJumpTimer: " + string(rh_axis),  x, y, 120 );
  
 
scr_drawDebugText( " wandAngle: " + string( wandAngleInDegrees),  x, y, 180 );
	  
	  
if (player == 1) {
	image_blend = c_orange;	 
}
	
	
	draw_self();

draw_line_width_color(x,y, wandX, wandY, wandWidth, c_purple, c_purple );


