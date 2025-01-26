/// @description Insert description here
// You can write your code in this editor


if (instance_exists(oFly) ) {
 
	
	if (alarm[0] == -1) and (alarm[1] == -1) {
		
		show_debug_message("resetting time");
		alarm[0] = random(tongueTimer);
	}
	
}