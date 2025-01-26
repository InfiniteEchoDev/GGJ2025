/// @description Insert description here
// You can write your code in this editor

function Vector2( xx = 0, yy = 0 ) constructor
{
    x = xx;
    y = yy;
    
    static Copy = function( otherVec2 )
    {
        x = otherVec2.x;
        y = otherVec2.y;
    }
    
    static Set = function( xx, yy )
    {
        x = xx;
        y = yy;
    }
    
    static Distance = function( otherVec2 )
    {
        return sqrt( SqrDistance( otherVec2 ) );
    }
    static SqrDistance = function( otherVec2 )
    {
        return (x - otherVec2.x)*(x - otherVec2.x) + (y - otherVec2.y)*(y - otherVec2.y);
    }
    
    static Magnitude = function()
    {
        return sqrt( x * x + y * y );
    }
    static Normalize = function()
    {
        var mag = Magnitude();
        x = x / mag;
        y = y / mag;
    }
    
    static Dot = function( otherVec2 )
    {
        return x * otherVec2.x + y * otherVec2.y;
    }
}

/*
x = room_width/2;
y = room_height/2;
*/

mySpeed = 15;

myScale = 0.2;
image_xscale = myScale;
image_yscale = myScale;

player = 0;

wandX = x;
wandY = y;

wandRadius = -1;
maxRadius = 100;

wandAngle = 0;
wandAngleInDegrees = 0;

wandWidth = 8;

createNewBubbleDistSqr = power( wandLength * .5, 2 );




playerPosPrev = new Vector2();
playerPos = new Vector2();
wandClosePosPrev = new Vector2();
wandClosePos = new Vector2();
wandFarPosPrev = new Vector2();
wandFarPos = new Vector2();

wandNormal = new Vector2();
wandCentrePos = new Vector2();

playerPosDelta = new Vector2();
wandClosePosDelta = new Vector2();
wandFarPosDelta = new Vector2();


wandSpeedVec = new Vector2();
wandSpeed = 0;
wandTransverseSpeed = 0;


afterTimeCanCreateBubble = 0;
lastBubbleCreatedPoint = new Vector2();


rh_axis = 0;//gamepad_axis_value(myPlayerTruck.playerGamepadSlot, gp_axisrh);
rv_axis = 0;//gamepad_axis_value(myPlayerTruck.playerGamepadSlot, gp_axisrv);



 
 
alarm[0] = 0.1*room_speed;