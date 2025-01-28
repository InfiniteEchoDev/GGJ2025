bubbleSegments = ds_list_create();
numBubbles = 0;
maxRadius = 0;


function AddNewBall( xx, yy, radius ) {
    var ball = new obj_metaballs.Ball( xx - x, yy - y, radius );

    ds_list_add( bubbleSegments, ball );
    
    //show_debug_message( "Adding ball: newNum - " + string( ds_list_size( bubbleSegments ) ) );
}



alarm[0] = bubbleLifetime * room_speed;