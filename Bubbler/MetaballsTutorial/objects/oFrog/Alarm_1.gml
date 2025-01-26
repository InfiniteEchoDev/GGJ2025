/// @description Insert description here
// You can write your code in this editor

if (instance_exists(closestFly)) {

	

	instance_destroy(closestFly);
	closestFly = noone;	
	
	if (frogEvolutionStage < 5) {
		
		frogEvolutionStage++;
	}
	
}

xTongue = x;
yTongue = y;

alarm[0] = tongueTimer;

image_index = 0;