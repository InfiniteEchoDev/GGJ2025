/// @description Insert description here
// You can write your code in this editor

if (instance_exists(closestFly)) {

	

	instance_destroy(closestFly);
	closestFly = noone;	
	
	if (frogEvolutionStage < 5) {
		
		insectsEaten++;
		
		if (insectsEaten >= insectsBeforeEvolution) {
			frogEvolutionStage++;
			insectsEaten = 0;
			// evolution will require more flies eaten next time
			insectsBeforeEvolution = 1 + frogEvolutionStage;
			
			 myState = stateGrowing;
			 audio_play_sound(SFX_frog_grow, 20,0);
			 
		}
	}
	
}

xTongue = x;
yTongue = y;

alarm[0] = tongueTimer;

image_index = 0;