final int CIRCLE_SPEED = 7; //value of the veloctiy of the circle
final color NO_CLICK_FILL_COLOR = color(250, 100, 100); // color of the object when the mouse is not clicked
final color CLICK_FILL_COLOR = color(100, 100, 250); //color of the object when the mouse is clicked
final color BACKGROUND_COLOR_1 = color(250, 150, 150); //CHANGE: variable name; color of the background, slightly pink
final color STROKE_COLOR = color(250, 150, 150); //color of the border
final int CIRCLE_SIZE = 50; // size of the circle's diameter
final color BACKGROUND_COLOR_2 = color(150, 250, 150); //CHANGE: new background color (green)

color backgroundColor = BACKGROUND_COLOR_1; //CHANGE: added new variable to identify the current color of the background

//undeclared coordinates and velocity of the circle
int circleX; //x coordinate of the center of the circle
int circleY; //y coordinate of the center of the circle
int circleVX;//x velocity of the center of the circle
int circleVY;//y velocoty of the center of the circle

//the values for the coordinates and the velocity of the circle, and the color of the border, fill of the circle as well as the background
void setup() {
  size(640, 480);//setting up a 640x480 canvas
  circleX = width/2; //the value of the x coordinate of the center of the circle
  circleY = height/2;// the value of the y coordinate of the center of the circle
  circleVX = CIRCLE_SPEED; //the value of the x velocity of the center of the circle
  circleVY = CIRCLE_SPEED; // the value of the y velocity of the center of the circle
  stroke(STROKE_COLOR);//color of the border around all shapes on the canvas
  fill(NO_CLICK_FILL_COLOR); //color of the inside of all shapes on the canvas
  background(BACKGROUND_COLOR_1); //background color of the canvas
}

//begin animation
void draw() {
  //if the distance between the coordinates of the circle and the coordinates of the mouse are less than the size of the circle divided by 2, then the color of the circle will be blue
  if (dist(mouseX, mouseY, circleX, circleY) < CIRCLE_SIZE/2) {
    fill(CLICK_FILL_COLOR);
  }
  //if not, then the color of the circle will be red
  else {
    fill(NO_CLICK_FILL_COLOR);
  }
  //draw the circle with the variables and add the velocity
  ellipse(circleX, circleY, CIRCLE_SIZE, CIRCLE_SIZE);
  circleX += circleVX;
  circleY += circleVY;
  //if the circle is past the right wall or the left wall, it'll change direction
  if (circleX + CIRCLE_SIZE/2 > width || circleX - CIRCLE_SIZE/2 < 0) {
    circleVX = -circleVX;
  }
  //if the circle is past the top wall or the bottom wall, it'll change direction
  if (circleY + CIRCLE_SIZE/2 > height || circleY - CIRCLE_SIZE/2 < 0) {
    circleVY = -circleVY;
  }
}

//if the mouse is clicked, then the background color will change to pink
void mousePressed() {
  //CHANGE: if the background color is pink, change to green when the mouse is clicked
  if (backgroundColor == BACKGROUND_COLOR_1) {
    backgroundColor = BACKGROUND_COLOR_2;
    background(backgroundColor);
  }
  //CHANGE: if the background color is green, change to pink when the mouse is clicked
  else {
  backgroundColor = BACKGROUND_COLOR_1;
    background(backgroundColor);
  }
}