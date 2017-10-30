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

//call array of circles
Circle[] circles = new Circle[80];

//setup()
//put the circles in place with their different coordinates
void setup() {
  size(500, 500);
  for ( int i = 0; i< circles.length; i++ ) {
    circles[i] = new Circle(x, y, ballColorGray);
    x=random(0,500);
    y=random(0,500);
    ballColorGray += floor(random(-10, 10));
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