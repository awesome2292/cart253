class Brick {
  float brickX;
  float brickY;
  float brickWidth;
  float brickHeight;

Brick(float tempX, float tempY, float tempBrickWidth, float tempBrickHeight) {
    brickX = tempX;
    brickY = tempY;
    brickWidth = tempBrickWidth;
    brickHeight = tempBrickHeight;
  }

  void update() {
    
  }

  void display() {
    fill(255);
    rectMode(CENTER);
    rect(brickX, brickY, brickWidth, brickHeight);
  }
  
}