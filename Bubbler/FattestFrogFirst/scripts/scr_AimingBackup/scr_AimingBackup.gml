// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/*
function aimingBackup(){
/// @description  TowArm Movement   




 // x = oPlayer.x - 10*cos(oPlayer.image_angle*2*pi/360);
 // y = oPlayer.y  + 10*sin(oPlayer.image_angle*2*pi/360);
 
if ((myPlayerTruck != noone) and instance_exists(myPlayerTruck)) {
 

	if (myPlayerTruck.height < 700) {
		image_alpha = 1;	
	}


    // Previous method was to calculate the point
 // newXYpoint= CalculatePointInRotation(myPlayerTruck.phy_position_x, myPlayerTruck.phy_position_y, TowTruckArmDistance,  myPlayerTruck.phy_rotation);
 
     // Sent from truck indexFromPlayerTruck = myPlayerTruck.image_index;
 

var playerTruckImageIndex = indexFromPlayerTruck % 16;

if (playerTruckImageIndex <0) or (playerTruckImageIndex> 16) {
	playerTruckImageIndex = 0;	
}
 newXYPoint[0] = myPlayerTruck.x + TowArmPositions[ playerTruckImageIndex, 0];
 newXYPoint[1] = myPlayerTruck.y + TowArmPositions[ playerTruckImageIndex, 1];
 
  
  
  
  x = newXYPoint[0];
  y = newXYPoint[1];
  // breaks game phy_position_x = x;
 // phy_position_y = y;
 
 }
  
 
depth = 5; // oPlayer.depth + 1;


 

// Facing = point_direction(x, y, mouse_x, mouse_y)

 MouseFacing = 0;
if checkInstanceExists(myPlayerTruck) {

			if (myPlayerTruck.myPlayerData == noone) {
				
				// if not alive in StockTaker mode
				scr_AutoAimTowArm();  // auto aim to match truck but be slightly wild
				// initialTowArmRotationAdjustment = true;
			 
			 
			 } else if (myPlayerTruck.playerGamepadSlot != -1) and (myPlayerTruck.controllerReticle == true) and (myPlayerTruck.myPlayerData != noone) {
				 
				gamepad_set_axis_deadzone(myPlayerTruck.playerGamepadSlot, 0.3);
				 
					
                 rh_axis = gamepad_axis_value(myPlayerTruck.playerGamepadSlot, gp_axisrh);
                 rv_axis = gamepad_axis_value(myPlayerTruck.playerGamepadSlot, gp_axisrv); 
                    
                    // I know common sense says this should be "and" but
                    // the last_rh_axis and last_rv_axis are the used variables
                    // Without the "or," 180 degree changes in tow arm direction isn't possible
                 
						 if ((rh_axis != 0) or (rv_axis != 0))  {
                        
		                        last_rh_axis = rh_axis;
		                        last_rv_axis = rv_axis;
						
								alarm[0] = 1*room_speed;  // 1 second delay before reverting back
						
								   // MouseFacing =  point_direction( x+ rh_axis*1000,  y+rv_axis*1000, x, y  );
								//MouseFacing =  point_direction( x+ last_rh_axis *1000,  y+last_rv_axis*1000, x, y    );
						
								// image_blend = c_red;
						
								MouseFacing =  point_direction( x+ last_rh_axis *1000,  y+last_rv_axis*1000, x, y  );
								image_angle = MouseFacing;
                   
						   }  else if (alarm[0] <= 0)   {
						
								// To follow the truck rotation if the right stick is not used
								 scr_AutoAimTowArm();
						 
						
							} else if (myPlayerTruck.simultaneousGrapple == false) {
						   
								// MouseFacing =  point_direction( x+ rh_axis*1000,  y+rv_axis*1000, x, y  );
								MouseFacing =  point_direction( x + last_rh_axis *1000,  y+last_rv_axis*1000, x, y    );	
								MouseFacing2 = MouseFacing;
								image_angle = MouseFacing;
							}
                    
                
               
             } else if (myPlayerTruck.controllerReticle == false) and (myPlayerTruck.myPlayerData != noone)  {
                // Use the mouse
                
                 MouseFacing =  point_direction(  mouse_x, mouse_y,  x,  y)
                 //MouseFacing2 =  point_direction(   x,-y,  mouse_x, -mouse_y) 
                 MouseFacing2 =   point_direction(   mouse_x,  mouse_y, x, -y) 
				 
             }  
			
					
}
  
    
    

    
    
// Take into account dragging a car

if (checkInstanceExists(myPlayerTruck)){
    if ( checkInstanceExists(myPlayerTruck.CarObjectClicked) and (myPlayerTruck.GrapplingCar == true))   {
        if (myPlayerTruck.CarObjectClicked  != undefined) and (myPlayerTruck.detachedHarpoon == false)  {
        
                // x for tow arm SHOULD CHANGE TO END POINT
                // carTruckXDiff = (EndXYofTowArm[0] - myPlayerTruck.CarObjectClicked.x)
                 // carTruckYDiff = (EndXYofTowArm[1] - myPlayerTruck.CarObjectClicked.y)
                 
                 carTruckXDiff = ( myPlayerTruck.CarObjectClicked.x - myPlayerTruck.x )
                 carTruckYDiff =  ( myPlayerTruck.CarObjectClicked.y - myPlayerTruck.y)
                 
                 truckCarAngle = darctan2(carTruckYDiff, carTruckXDiff);
                  CheckRadius = sqrt(carTruckXDiff*carTruckXDiff + carTruckYDiff*carTruckYDiff);
                  
                   
                  minAngle = (truckCarAngle - GrapplingCarMaxTowArmAngle) mod 360;
                  maxAngle = (truckCarAngle + GrapplingCarMaxTowArmAngle) mod 360;
                  
                
               MouseFacing2 =  MouseFacing2 mod 360 ;
               
              
                
                
                
                targetAngle = (-truckCarAngle + 180) mod 360;
                
                   //image_angle = image_angle mod 360;
                    image_angle = targetAngle; 
         
          
         } 
         
          
    } else {
    
        image_angle = MouseFacing;
        rotSpeed = 0;
    
    
    }
}      



    Facing = image_angle;


	
	rumbleRotation = 0;
	if checkInstanceExists(myPlayerTruck){
 
	    rumbleRotation = myPlayerTruck.rumbleRotation;
		//playerHeight = myPlayerTruck.height;
		
		playerHeight = myPlayerTruck.height;
	
		myHeightScale = playerHeight/300;
	
		 imageXScale = image_xscale + myHeightScale;
		 imageYScale = image_yscale + myHeightScale;
	 }
	
	// Facing is set at the end of this step event
	// Added scale on EndXYofTowArm and ShorterEndXYofTowArmForRope for rope to match jumps!
	EndXYofTowArm[0] = x +  imageXScale*TowArmLength*dcos( Facing + rumbleRotation);  
    EndXYofTowArm[1] = y -  imageYScale*TowArmLength*dsin( Facing + rumbleRotation);
	
    ShorterEndXYofTowArmForRope[0] = x + 0.95*imageXScale*TowArmLength*dcos( Facing + rumbleRotation) +   recoilX;  
    ShorterEndXYofTowArmForRope[1] = y - 0.95*imageYScale*TowArmLength*dsin( Facing + rumbleRotation) +   recoilY;
    

}

*/