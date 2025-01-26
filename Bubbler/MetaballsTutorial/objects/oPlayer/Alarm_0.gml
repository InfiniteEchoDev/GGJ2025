/// @description Insert description here
// You can write your code in this editor

if (abs(wandRadius > 5) ) {
	
	
	wandHalfwayX = x+ 0.5*wandRadius*dcos(wandAngleInDegrees);
	wandHalfwayY = y + 0.5*wandRadius*dsin(wandAngleInDegrees);
	
	tempBubbleF = instance_create_depth(wandHalfwayX, wandHalfwayY, 5, oBubbleFramework);
	
	tempBubbleF.playerNum = player; 
	
		if (player == 1) {
	
			tempBubbleF.image_blend = c_green;
		}
	tempBubbleF.radius = wandRadius;
	
	var bubbleScale = abs(wandRadius)/maxRadius;
	tempBubbleF.image_xscale = bubbleScale;
	tempBubbleF.image_yscale = bubbleScale;
	
	/*
	with (obj_control) {
	 
	
		ds_list_add(balls, new Ball(other.wandHalfwayX, other.wandHalfwayY, other.wandRadius/4)); 
	
	}
	*/

}

