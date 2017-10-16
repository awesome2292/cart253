//Brick
// created a class for the bricks used in the break breaker

class Brick {

  ////////// Properties ///////////
  float brickX;
  float brickY;
  float brickWidth;
  float brickHeight;
  PImage brickImage;
  boolean brickExists = true;

  ///////// Constructor ///////////
  Brick(float tempX, float tempY, float tempBrickWidth, float tempBrickHeight) {
    brickX = tempX;
    brickY = tempY;
    brickWidth = tempBrickWidth;
    brickHeight = tempBrickHeight;
    brickImage = loadImage("images/brickImage.png");
  }
  //////// End of Constructor ////////



  //////// Methods /////////
  void update() {
  }

///////// display() //////////
//display the bricks 
  void display() {
    if (brickExists == true) {
      rectMode(CENTER);
      image(brickImage, brickX, brickY, brickWidth, brickHeight);
    }
  }
}