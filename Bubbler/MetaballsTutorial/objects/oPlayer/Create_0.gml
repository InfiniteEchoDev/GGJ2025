/// @description Insert description here
// You can write your code in this editor



x = room_width/2;
y = room_height/2;

mySpeed = 15;


player = 0;

wandX = x;
wandY = y;

wandRadius = 100;

wandAngle = 0;

wandWidth = 8;

rh_axis = 0;//gamepad_axis_value(myPlayerTruck.playerGamepadSlot, gp_axisrh);
 rv_axis = 0;//gamepad_axis_value(myPlayerTruck.playerGamepadSlot, gp_axisrv); 
 
 
 alarm[0] = 0.1*room_speed;