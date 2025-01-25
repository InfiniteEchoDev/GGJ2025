/// @description Insert description here
// You can write your code in this editor

 

if (Mode == "PlayerSetup") {
	
	
	//Set the number of players required to exactly 2
	input_join_params_set(1, 2);

	//Start the JOIN source mode, enabling automatic device assignment
	input_source_mode_set(INPUT_SOURCE_MODE.JOIN);
	
	if (input_join_is_finished())
	{
	    if (input_check_long("action", 0) || input_check_long("action", 1))
	    {
	        input_source_mode_set(INPUT_SOURCE_MODE.FIXED);
			Mode = "Game";
		}
	}
	
	
	
} else if (Mode == "Game") {
	
	 
	if (array_length(input_players_get_status().__new_disconnections) > 0)
	{
	    input_source_mode_set(INPUT_SOURCE_MODE.JOIN);
	   // PauseGame();
	}
	
}
