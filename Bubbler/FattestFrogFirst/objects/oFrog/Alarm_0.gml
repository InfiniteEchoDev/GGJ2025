/// @description Insert description here
// You can write your code in this editor

if (instance_exists(oFly) ) {

	closestFly = noone; // instance_nearest(x,y, oFly);
	
	for (i = 0; i < instance_number(oFly); i++)
	{
		// to add in where the players are looking, important if looking offscreen
		var tempFly = instance_find(oFly,i);
		
		//if (tempFly.capturedInBubble == true) {
		
		// tempFly is -1 playerNum by default
		if (tempFly.capturedByPlayerNum == myPlayerNumSide) {
			
			closestFly = tempFly;
			
			xTongue = closestFly.x;
			yTongue = closestFly.y;

	
			// reset timer
			alarm[1] = 0.5*room_speed;
	
			image_index = 1;
	
			break;
		}
		
	}
	
	
}

show_debug_message("resetting alarmZero");