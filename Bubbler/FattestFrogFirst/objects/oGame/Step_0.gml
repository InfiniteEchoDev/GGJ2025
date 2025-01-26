/// @description Insert description here
// You can write your code in this editor

 
 if (instance_number(oFly) <= 1) and (alarm[0] == -1) {

		 alarm[0] = 0.2 + random(0.5*room_speed);
	 
 }
 
  // reset the game. It will save player controllers but you have to press X again still
 if (keyboard_check_pressed(vk_escape)){
	 
	
	// room_goto("rm_test")
 } else if (keyboard_check_pressed(ord("R"))){
	 
	  game_restart();
 }
 