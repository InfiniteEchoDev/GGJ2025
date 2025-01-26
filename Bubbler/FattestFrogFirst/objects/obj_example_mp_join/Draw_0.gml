
draw_set_halign(fa_center);


counter += 0.05;

image_angle = 1 + 10*sin(counter);

imageScaleY = 0.3 + 0.5*sin(counter);

draw_sprite_ext(FFF_Logo, 0,room_width/2, 200+40, 0.3,imageScaleY, image_angle, c_white,1);

/*
//var strTitle = "Fattest Frog First!";
 scribble_color_set("frog",c_lime);
 //scribble_font_set_halign_offset(fTitle,fa_center,0);
// scribble_font_set_default(fTitle);
scribble("[wave][frog][scale, 4]Fattest Frog First![/wave]").draw(375, 150);
*/

string1colour = c_white;

draw_set_font(fTitle);

var _string = "";
var _string2 = "";
_string += "Multiplayer Setup\n";
_string += "\n";

if (!input_player_connected(0))
{
    _string += "Player 1: Press any key/button to join\n";
    _string += "\n";
    _string += "\n";
    _string += "Player 2: Please wait...\n";
    _string += "\n";
    _string += "\n";
}
else
{
    _string += "Player 1: Joined (press " + input_verb_get_icon("cancel", 0) + " to leave)\n";
    _string += "Using " + (input_source_using(INPUT_GAMEPAD, 0)? input_gamepad_get_description(input_player_get_gamepad(0)) : "keyboard + mouse") + "\n";
    _string += "\n";
    
    if (!input_player_connected(1))
    {
        _string += "Player 2: Press any key/button to join\n";
        _string += "\n";
        _string += "\n";
    }
    else
    {
        _string += "Player 2: Joined (press " + input_verb_get_icon("cancel", 1) + " to leave)\n";
        _string += "Using " + (input_source_using(INPUT_GAMEPAD, 1)? input_gamepad_get_description(input_player_get_gamepad(1)) : "keyboard + mouse") + "\n";
        //_string += "\n";
    }
}

//if (input_join_is_finished())
if (input_player_connected(0))
{
    _string2 += "\n";
    //_string += "Player 1: Please press and hold \"" + input_verb_get_icon("action") + "\" to play\n";
    _string2 += "Player 1:  Please press and hold \"" + input_verb_get_icon("action") + "\" to play\n";
	
	if (input_player_connected(1) ) {
		string1colour = c_grey;
	}
}

draw_set_color(string1colour);
draw_text(room_width/2, 390, _string);


draw_set_color(c_white);
draw_text(room_width/2, 0.8*room_height, _string2);



