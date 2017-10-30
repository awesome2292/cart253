//Anxiety inducing static code???
//But somehow mesmerizing at the same time?
//Basically mini animation code
//Replay the code several times to end up with different combinations!

//time variables
float tx = random(0, 100);
float ty = random(0, 100);

//circle coordinates
float x = width * noise(tx);
float y = height * noise(ty);
float ballColorGray = random(0, 255);
float varyingBallSize = random(5,20);

//call array of circles
Circle[] circles = new Circle[100];

//setup()
//put the circles in place with their different coordinates
void setup() {
  size(500, 500);
  for ( int i = 0; i< circles.length; i++ ) {
    circles[i] = new Circle(x, y, varyingBallSize, ballColorGray);
    x=random(0,500);
    y=random(0,500);
    ballColorGray += floor(random(-10, 10));
    varyingBallSize = floor(random(-1,1));
    if (varyingBallSize <= 0){
      varyingBallSize += 20;
    }
  }
}

//animate the circles with tension dun dun dun
void draw() {
  background(0);
  tx += 0.01;
  ty += 0.01;
  for ( int i = 0; i<circles.length; i++ ) {
    circles[i].update();
    circles[i].display();
  }
}