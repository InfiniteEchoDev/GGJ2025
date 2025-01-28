/// @description Spawn insects when there are none


 
var xP = 0.1*room_width + 0.8*random(room_width);

var yP = -0.2*room_height;

if (random(100) > 50) {
	yP = 1.2*room_height;
} 

var tempFly = instance_create_depth( yP, xP, 5, oFly);

  
var xT = 0.15*room_width + 0.75*random(room_width);
var yT =  0.1*room_height + 0.8*random(room_height);

tempFly.startX = xP;
tempFly.targetX = xT;

tempFly.startY = yP;
tempFly.targetY = yT;