
//this is a class defined in the main code that gives the bouncers their characteristics in the aninmation
class Bouncer {
  //called the various parameters of the bouncer class, including location, size, and the gradient colors
  float x;//CHANGE: all the variables are float numbers instead of integers
  float y;
  float vx;
  float vy;
  float size;
  color fillColor;
  color defaultColor;
  color hoverColor;
  boolean mouseclick;
  //CHANGE: added a new variable for the mouseClicked method
  color ballColor;

  //defining constructor with the variables previously mentioned: these parameters need to be defined in the program
  //CHANGE: the parameters are now float numbers
  Bouncer(float tempX, float tempY, float tempVX, float tempVY, float tempSize, color tempDefaultColor, color tempHoverColor) {
    x = tempX;
    y = tempY;
    vx = tempVX;
    vy = tempVY;
    size = tempSize;
    ballColor= tempDefaultColor; //CHANGE: added extra variable
    defaultColor = tempDefaultColor;
    hoverColor = tempHoverColor;
    fillColor = defaultColor;
  }

  //this function allows the balls to move across the screen thanks to the velocity parameters
  void update() {
    x += vx;
    y += vy;

    handleBounce();
    handleMouse();
  }

  //if the ball hits a wall then it changes direction
  //CHANGE: the balls change direction in various angles when they collide with the walls
  void handleBounce() {
    if (x - size/2 < 0 || x + size/2 > width) {
      vx = random(-1.5, -0.5)*vx;
    }

    if (y - size/2 < 0 || y + size/2 > height) {
      vy = -vy;
    }

    x = constrain(x, size/2, width-size/2);
    y = constrain(y, size/2, height-size/2);
  }

  //if the mouse passes over either ball, then the color of the ball changes
  //else, the color remains the same
  void handleMouse() {
    if (dist(mouseX, mouseY, x, y) < size/2) {
      fillColor = hoverColor;
    } else {
      fillColor = defaultColor;
    }
  }


  //this funcion puts the two balls in the canvas with their respective colors
  void draw() {
    noStroke();
    fill(fillColor);
    ellipse(x, y, size, size);
  }

  //CHANGE: when the mouse is clicked, the bouncers will become the colors chosen by the player, and then revert to their original color
  void mouseClicked(color playerColor) {
    if (mousePressed == true) {
      defaultColor = playerColor;
    } else {
      defaultColor = ballColor;
    }
  }
}