myCapturedInsect = noone;

audio_play_sound(SFX_bubble_pop4, 10, false, .6 + random( .4 ), 0, .8 + random( .4 ) );

for ( j = 0; j < ds_list_size( bubbleSegments ); j++ )
{
    var bubbleSegment = ds_list_find_value( bubbleSegments, j );
    
    ds_list_delete( obj_metaballParent.balls, ds_list_find_index( obj_metaballParent.balls, bubbleSegment.relatedBall ) );
}
