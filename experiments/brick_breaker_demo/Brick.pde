class Brick {
  float x;
  float y;
  float brickWidth;
  float brickHeight;

Brick(float tempX, float tempY, float tempBrickWidth, float tempBrickHeight) {
    x = tempX;
    y = tempY;
    brickWidth = tempBrickWidth;
    brickHeight = tempBrickHeight;
  }

  void update() {
    
  }

  void display() {
    fill(255);
    rectMode(CENTER);
    rect(x, y, brickWidth, brickHeight);
  }
  
}