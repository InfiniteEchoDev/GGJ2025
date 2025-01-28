// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_tallyBallObjs(forPlayer){

	

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
                    
                    if( bubbleSegment.relatedBall == noone ) {
                        var newBall = new Ball(tempBubbleObj.x + bubbleSegment.x, tempBubbleObj.y + bubbleSegment.y, bubbleSegment.r, bubbleSegment);
                        bubbleSegment.relatedBall = newBall;
                        ds_list_add(balls, newBall);
                    }
                    
                    bubbleSegment.relatedBall.x = tempBubbleObj.x + bubbleSegment.x;
                    bubbleSegment.relatedBall.y = tempBubbleObj.y + bubbleSegment.y;
                    bubbleSegment.relatedBall.r = bubbleSegment.r;
                }
				
			}
		}
	}


	


}