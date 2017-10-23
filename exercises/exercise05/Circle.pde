//circle class
//circles of different grayscale will appear

class Circle {
  float circleX;
  float circleY;
  float size = 20;
  float ballColor;

  /////// constructor ////////
  Circle( float tempX, float tempY, float tempColor) {
    circleX = tempX;
    circleY = tempY;
    ballColor = tempColor;
  }

  ////// Methods //////
  
  //update()
  //the circles shake around
  void update() {
    circleX += 5*random(-noise(tx), noise(tx));
    circleY += 5*random(-noise(ty), noise(ty));
  }

//display the circles
  void display() {
    fill(ballColor);
    ellipse(circleX, circleY, size, size);
  }
}