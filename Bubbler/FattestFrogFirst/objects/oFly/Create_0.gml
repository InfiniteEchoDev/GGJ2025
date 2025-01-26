/// @description Insert description here
// You can write your code in this editor


ogX = x;

if (random(100) > 50) {
	sprite_index = sFly_CarrotCritter;
	myScale = 0.5;
}

var flipMe = 1;
if (random(100) > 50) {
	flipMe = -1;
}

image_xscale = myScale*flipMe;
image_yscale = myScale;

curvePercent = 0.0;

curve = animcurve_get_channel(AnimationCurve2, "curve1");