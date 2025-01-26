/// @description Insert description here
// You can write your code in this editor


alarm[0] = random(tongueTimer) ;

xTongue = x;
yTongue = y;


 curvePercent = 0.0;
curve = animcurve_get_channel(AnimationCurveFrogGrowing, "curve1");
 
 
 
stateSearching = function() {
	 
	if (instance_exists(oFly) ) {
 
	
		if (alarm[0] == -1) and (alarm[1] == -1) {
		
			//show_debug_message("resetting time");
			alarm[0] = random(tongueTimer);
		}
	
	}
}
 
 
stateGrowing = function(){
	 curvePercent += 1/25;
 
	 if (curvePercent > 1.0) {
		curvePercent = 0;	
		myState = stateSearching;
	 }
	 
	 frogScale = 0.25*(1 + 1*animcurve_channel_evaluate(curve, curvePercent ) );
	 
	  
 }
 
 
 
myState = stateSearching;