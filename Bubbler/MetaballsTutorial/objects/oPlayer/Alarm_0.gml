/// @description Insert description here
// You can write your code in this editor

if (abs(wandRadius > 5) ) {
	
	
	wandHalfwayX = x+ 0.5*wandRadius*dcos(wandAngleInDegrees);
	wandHalfwayY = y + 0.5*wandRadius*dsin(wandAngleInDegrees);
	
	with (obj_control) {
	
	

	
		ds_list_add(balls, new Ball(other.wandHalfwayX, other.wandHalfwayY, other.wandRadius/4)); 
	
	}

}

