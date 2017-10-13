class Brick {
  float brickX;
  float brickY;
  float brickWidth;
  float brickHeight;
  PImage brickImage;
  boolean brickExists = true;

Brick(float tempX, float tempY, float tempBrickWidth, float tempBrickHeight) {
    brickX = tempX;
    brickY = tempY;
    brickWidth = tempBrickWidth;
    brickHeight = tempBrickHeight;
    brickImage = loadImage("images/brickImage.png");
  }

  void update() {
    
  }

  void display() {
    if (brickExists == true){
    rectMode(CENTER);
    image(brickImage, brickX, brickY, brickWidth, brickHeight);
  }
  
  }
}