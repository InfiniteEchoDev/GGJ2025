/// @description Insert description here
// You can write your code in this editor

x += mySpeed*( -input_value("left", player) + input_value("right", player));
y += mySpeed*(-input_value("up", player) + input_value("down", player));
   
// stay in the room!
var edgeBuffer = 32;
x = clamp(x, 0 + edgeBuffer, room_width - edgeBuffer);
y = clamp(y, 0+ edgeBuffer, room_height - edgeBuffer);


rh_axis = -input_value("aim_left", player) + input_value("aim_right", player);
rv_axis = -input_value("aim_up", player) + input_value("aim_down", player);

wandRadius = wandLength*sqrt(rh_axis*rh_axis + rv_axis*rv_axis);



//if (abs(wandRadius )> 5) and (alarm[0] <= 0) {
	//
	 //alarm[0] = 1*room_speed;
//}


wandAngleInDegrees =  point_direction(  x, y , x + rh_axis*100,  y - rv_axis*100 );

/*
wandX = x + rh_axis*100;
wandY = y + rv_axis*100;
*/

//wandX = x+ wandRadius*dcos(wandAngleInDegrees);
//wandY = y + wandRadius*dsin(wandAngleInDegrees);

 

playerPosPrev.Copy( playerPos );
playerPos.Set( x, y );
playerPosDelta.Set( playerPos.x - playerPosPrev.x, playerPos.y - playerPosPrev.y );

wandClosePosPrev.Copy( wandClosePos );
wandClosePos.Set( 
    x + dcos( wandAngleInDegrees ) * playerRadius, 
    y + dsin( wandAngleInDegrees ) * playerRadius
);
wandClosePosDelta.Set( wandClosePos.x - wandClosePosPrev.x, wandClosePos.y - wandClosePosPrev.y );

wandFarPosPrev.Copy( wandFarPos );
wandFarPos.Set( 
    x + dcos( wandAngleInDegrees ) * ( playerRadius + wandRadius ), 
    y + dsin( wandAngleInDegrees ) * ( playerRadius + wandRadius )
);
wandFarPosDelta.Set( wandFarPos.x - wandFarPosPrev.x, wandFarPos.y - wandFarPosPrev.y );

wandCentrePos.Set( ( wandClosePos.x + wandFarPos.x ) / 2, ( wandClosePos.y + wandFarPos.y ) / 2 );


wandNormal.Set( wandClosePos.y - wandFarPos.y, -( wandClosePos.x - wandFarPos.x ) );
wandNormal.Normalize();


wandSpeedVec.Set( ( wandClosePosDelta.x + wandFarPosDelta.x ) / 2, ( wandClosePosDelta.y + wandFarPosDelta.y ) / 2 );
wandSpeed = wandSpeedVec.Magnitude();
wandTransverseSpeed = abs( wandSpeedVec.Dot( wandNormal ) );

//show_debug_message( string( wandNormal ) );


if( wandTransverseSpeed > wandSpeedCreatesBubble && wandRadius > wandRadiusCreatesBubble ) {
    if( wandCentrePos.SqrDistance( lastBubbleCreatedPoint ) > createNewBubbleDistSqr && current_time > afterTimeCanCreateBubble ) {

        
        // Create a new Bubble or add to currently-creating Bubble
        if( currentBubbleFramework == noone ) {
            currentBubbleFramework = instance_create_depth(wandCentrePos.x, wandCentrePos.y, 5, oBubbleFramework);
	
      	    currentBubbleFramework.playerNum = player;
            for (i = 0; i < instance_number(obj_metaballs); i++)
            {
                var obj_metaballInst = instance_find(obj_metaballs,i);
                if( obj_metaballInst.forPlayer == player )
                    currentBubbleFramework.obj_metaballParent = obj_metaballInst
            }
      	
      		if (player == 1) {
      			currentBubbleFramework.image_blend = c_green;
      		}
            
            currentBubbleFramework.maxRadius = wandRadius * 1.5;
            currentBubbleFramework.radius = wandRadius * 1.5;
        }
        
        if( instance_exists( currentBubbleFramework ) ) {
    	    
    	
    	    //var bubbleScale = abs(wandRadius)/maxRadius;
    	    //currentBubbleFramework.image_xscale = bubbleScale;
    	    //currentBubbleFramework.image_yscale = bubbleScale;
    
    
            currentBubbleFramework.AddNewBall( wandCentrePos.x, wandCentrePos.y, currentBubbleFramework.radius );
            // ds_list_add(obj_metaballs.balls, new obj_metaballs.Ball( wandCentrePos.x, wandCentrePos.y, wandRadius/2));
            
            //currentBubbleFramework.direction = ( currentBubbleFramework.direction + 
                //point_direction( wandCentrePos.x, wandCentrePos.y, wandCentrePos.x + wandSpeedVec.x, wandCentrePos.y + wandSpeedVec.y ) ) / ds_list_size( currentBubbleFramework.bubbleSegments );
            currentBubbleFramework.direction = 
                point_direction( wandCentrePos.x, wandCentrePos.y, wandCentrePos.x + wandSpeedVec.x, wandCentrePos.y + wandSpeedVec.y );
            currentBubbleFramework.speed += ( currentBubbleFramework.speed + sqrt( wandTransverseSpeed * wandToBubbleSpeedFactor ) ) / power( ds_list_size( currentBubbleFramework.bubbleSegments ), 2);
        
            if( !audio_is_playing( SFX_bubble_wand_loop ) )
                audio_play_sound(SFX_bubble_wand_loop, 10, 0);
            
            if( ds_list_size( currentBubbleFramework.bubbleSegments ) > maxBubbleSegments )
                currentBubbleFramework = noone;
        }


        afterTimeCanCreateBubble = current_time + createBubbleCooldownMS;
        lastBubbleCreatedPoint.Copy( wandCentrePos );
    }
} else {
    currentBubbleFramework = noone;
}


/////////////////////////////////////////
// floating movement. Ideally for body only, not the wand
 curvePercent += 1/50;
  if (curvePercent > 1.0) {
	curvePercent = 0;	 
 }
 
 y += 0.1*animcurve_channel_evaluate(curve, curvePercent );
 image_yscale = myScale + 0.01*animcurve_channel_evaluate(curve, curvePercent );
  