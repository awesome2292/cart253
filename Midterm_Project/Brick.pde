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
  // the player needs to enter the position and size of the bricks
  Brick(float tempX, float tempY, float tempBrickWidth, float tempBrickHeight) {
    brickX = tempX;
    brickY = tempY;
    brickWidth = tempBrickWidth;
    brickHeight = tempBrickHeight;
    brickImage = loadImage("images/brickImage.png");
  }
  //////// End of Constructor ////////



  //////// Methods /////////

///////// display() //////////
//display the bricks 
  void display() {
    if (brickExists == true) {
      rectMode(CENTER);
      image(brickImage, brickX, brickY, brickWidth, brickHeight);
    }
  }
}