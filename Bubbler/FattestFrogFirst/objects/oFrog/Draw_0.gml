/// @description Insert description here
// You can write your code in this editor


//scr_drawDebugText("alarm 0: " + string(alarm[0]), x + 200, y, 10 );

//scr_drawDebugText("alarm 1: " + string(alarm[1]), x + 200, y, 100 );
 
var colourIndex = 2;

// frog colour
var frogColourSprite = GGJ2025_FROG_A1;

switch(frogEvolutionStage) {

	case 0:
		frogColourSprite = GGJ2025_FROG_A1;
		break;
	case 1:
		frogColourSprite = GGJ2025_FROG_B2;
		
		break;
	case 2:
		frogColourSprite = GGJ2025_FROG_B3;
		break;
	case 3:
		frogColourSprite = GGJ2025_FROG_B4;
		break;
	case 4:
		frogColourSprite = GGJ2025_FROG_B5;
		break;
	case 5:
		var gameOver = instance_create_depth(room_width/2,0,-1000,oGameOverWinner);
		
		gameOver.winner = myPlayerNumSide;
		
		frogColourSprite = GGJ2025_FROG_B5;
		break;
	default:
		frogColourSprite = GGJ2025_FROG_A1;
		break;
}


draw_sprite_ext(frogColourSprite,colourIndex,x,y,frogScale,frogScale,0,image_blend,image_alpha);
// frog ink
draw_sprite_ext(frogColourSprite,image_index,x,y,frogScale,frogScale,0,c_white,image_alpha);


////////////////// tongue /////////////////////////////////////////


if (xTongue != x) {
	draw_set_color(c_red);
	var tongueWidth = 8 + frogEvolutionStage;
	draw_line_width(x, y, xTongue, yTongue, tongueWidth);

	circleRadius = 12 + frogEvolutionStage;
	draw_ellipse(xTongue - circleRadius, yTongue - circleRadius, xTongue + circleRadius, yTongue + circleRadius,  false);

	draw_set_color(c_white);

}