// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_tallyBallObjs(forPlayer){

 
	//ds_list_clear(ds_ballFrameworkObjects);
	
	ds_list_clear(balls);
	

	for (i = 0; i < instance_number(oBubbleFramework); i++)
	{
		// to add in where the players are looking, important if looking offscreen
		var tempBubbleObj = instance_find(oBubbleFramework,i);
		
		if (instance_exists(tempBubbleObj) ) {
			
			if (tempBubbleObj.playerNum = forPlayer) {
	 
			// going to try using outer player trackers only
			//	ds_list_add(ds_ballFrameworkObjects, tempBubbleObj   );
			
				//ds_list_add(balls, new Ball(tempBubbleObj.x, tempBubbleObj.y, tempBubbleObj.radius, tempBubbleObj.playerNum) ); 
				ds_list_add(balls, new Ball(tempBubbleObj.x, tempBubbleObj.y, tempBubbleObj.radius, tempBubbleObj.playerNum ) ); 
			}  
		}
	}


	


}