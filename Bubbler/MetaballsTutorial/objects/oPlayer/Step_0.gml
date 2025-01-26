/// @description Insert description here
// You can write your code in this editor

 x += mySpeed*( -input_value("left", player) + input_value("right", player));

 y += mySpeed*(-input_value("up", player) + input_value("down", player));
 
 
 
 /*
rh_axis = gamepad_axis_value(myPlayerTruck.playerGamepadSlot, gp_axisrh);
rv_axis = gamepad_axis_value(myPlayerTruck.playerGamepadSlot, gp_axisrv); 
*/


/*
   aim_up:    input_binding_gamepad_axis(gp_axisrv, true),
            aim_down:  input_binding_gamepad_axis(gp_axisrv, false),
            aim_left:  input_binding_gamepad_axis(gp_axisrh, true),
            aim_right: input_binding_gamepad_axis(gp_axisrh, false),

*/

rh_axis = -input_value("aim_left", player) + input_value("aim_right", player);
rv_axis = -input_value("aim_up", player) + input_value("aim_down", player);

wandRadius = maxRadius*sqrt(rh_axis*rh_axis + rv_axis*rv_axis);

if (abs(wandRadius )> 5) and (alarm[0] <= 0) {
	
	 alarm[0] = 1*room_speed;
}


wandAngleInDegrees =  point_direction(  x, y , x + rh_axis*100,  y - rv_axis*100 );

/*
wandX = x + rh_axis*100;
wandY = y + rv_axis*100;
*/

wandX = x+ wandRadius*dcos(wandAngleInDegrees);
wandY = y + wandRadius*dsin(wandAngleInDegrees);

 