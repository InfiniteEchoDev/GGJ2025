/// @description Insert description here
// You can write your code in this editor

//y += path_get_y(AnimationCurve2, get_timer());


curvePercent += 1/50;
 
 if (curvePercent > 1.0) {
	curvePercent = 0;	 
 }



 y += 3*animcurve_channel_evaluate(curve, curvePercent );
 
 x += 3*sin(get_timer()/2); // don't use ogX because the fly moves toward the bubble