//if (myCapturedInsect == noone) { 
    if (timeToFadeOut == true) {

        if (radius > 0) {

            radius -= fadeOutRadiusPerSecond * delta_time / 1000000;
            
            for ( j = 0; j < ds_list_size( bubbleSegments ); j++ )
            {
                var bubbleSegment = ds_list_find_value( bubbleSegments, j );
                bubbleSegment.r = radius;
            }

        }
        
        if( radius <= 0 ) {
            radius = 0;
            instance_destroy();
        }

    }
//}