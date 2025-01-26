if (myCapturedInsect == noone){ 
    if (timeToFadeOut == true) {

        if (radius > 0) {

            radius -= 0.5;
        } else {


            radius = 0;
            instance_destroy();
        }


    }
}