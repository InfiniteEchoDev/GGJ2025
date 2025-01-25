/// @description Insert description here
// You can write your code in this editor

 x += mySpeed*( -input_value("left") + input_value("right"));

 y += mySpeed*(-input_value("up") + input_value("down"));
 
 
 
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

rh_axis = -input_value("aim_left") + input_value("aim_right");
rv_axis = -input_value("aim_up") + input_value("aim_down");

wandRadius = 100*sqrt(rh_axis*rh_axis + rv_axis*rv_axis);


wandAngle =  point_direction( x + rh_axis *1000,  y + rv_axis*1000, x, y  );


wandX = x +rh_axis*100;
wandY = y + rv_axis*100;

/*
wandX = x + wandRadius*dcos(wandAngle);
wandY = y - wandRadius*dsin(wandAngle);
*/