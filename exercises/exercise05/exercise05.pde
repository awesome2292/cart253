//Anxiety inducing static code???
//But somehow mesmerizing at the same time?
//Basically mini animation code

//time variables
float tx = random(0, 100);
float ty = random(0, 100);

//circle coordinates
float x = width * noise(tx);
float y = height * noise(ty);
float ballColorGray = random(0, 255);