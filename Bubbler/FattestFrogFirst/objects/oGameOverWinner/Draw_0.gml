/// @description Insert description here
// You can write your code in this editor



if (winner != -1) {
	image_index = winner;


	
	draw_sprite_ext(green_winsV2, image_index, x,y, image_xscale, image_yscale,0,c_white,1);	
	
	
	
}

 
	
	
	
	var strRestartText = "Hold " + input_verb_get_icon("action") + " to restart!";
	
	draw_set_color(c_black);
	draw_text(room_width/2, 0.85*room_height-2, strRestartText);	
	
	draw_set_color(c_white);
	draw_text(room_width/2, 0.85*room_height, strRestartText);	
 