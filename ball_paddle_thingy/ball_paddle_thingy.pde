int ballX = 60;
int ballY = 40;
int ballVX = 5;
int ballVY = 5;
int ballSize = 20;
int ballRadius = 10;
int rectY = 400;
int rectX = mouseX;
int rectWidth = 70;
int rectHeight = 20;
void setup() {
  size(500, 500);
}


void draw() {
  background(100);
  rect(mouseX - rectWidth/2, rectY, rectWidth, rectHeight);
  ellipse(ballX, ballY, ballSize, ballSize);
  ballX += ballVX;
  ballY += ballVY;

  if (ballX <= 0 + ballRadius) {
    ballVX = ballVX * -1;
  }//if the ball hits the left wall it will bounce off

  if (ballX >= width - ballRadius) {
    ballVX = ballVX * -1;
  }//if the ball hits the right wall it will bounce off

  if (ballY <= 0 + ballRadius) {
    ballVY = ballVY * -1;
  }//if the ball hits the top wall it will bounce off

  if (ballY >= width - ballRadius) {
    ballVY = ballVY * -1;
  }//if the ball hits the bottom wall it will bounce off
  
  if(ballX >= mouseX && ballX <= mouseX + rectWidth && ballY >= rectY && ballY <= rectY + rectHeight){
    ballVX = ballVX * -1;
}
}