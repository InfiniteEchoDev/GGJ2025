// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_tallyBallObjs(forPlayer){

 
	//ds_list_clear(ds_ballFrameworkObjects);
	
	ds_list_clear(obj_metaballs.balls);
	

	for (i = 0; i < instance_number(oBubbleFramework); i++)
	{
		// to add in where the players are looking, important if looking offscreen
		var tempBubbleObj = instance_find(oBubbleFramework,i);
		
		if (instance_exists(tempBubbleObj) ) {
			
			if (tempBubbleObj.playerNum == forPlayer) {
	 
			// going to try using outer player trackers only
			//	ds_list_add(ds_ballFrameworkObjects, tempBubbleObj   );
			
				//ds_list_add(balls, new Ball(tempBubbleObj.x, tempBubbleObj.y, tempBubbleObj.radius, tempBubbleObj.playerNum) ); 
                
                for (j = 0; j < ds_list_size(tempBubbleObj.bubbleSegments); j++)
                {
                    var bubbleSegment = ds_list_find_value( tempBubbleObj.bubbleSegments, j );
                    //show_debug_message( "bubseg #" + string( j ) + " " + string( bubbleSegment ) );
                    ds_list_add(obj_metaballs.balls, new Ball(tempBubbleObj.x + bubbleSegment.x, tempBubbleObj.y + bubbleSegment.y, bubbleSegment.r, tempBubbleObj.playerNum ) );
                }
				
			}
		}
	}


	


}