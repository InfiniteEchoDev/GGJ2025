function scr_drawDebugText(argument0, argument1, argument2, argument3) {


	// eg scr_drawDebugText(text, phy_position_x, phy_position_y, offset);

	var TextToDraw = argument0;

	var objectX = argument1;
	var objectY = argument2;

	var offset = argument3;

	//draw_set_font(fScore_halfSize)
	draw_set_colour( image_blend);
	
	
	
	//draw_text(objectX + offset, objectY - offset ,  string(TextToDraw) );


}
