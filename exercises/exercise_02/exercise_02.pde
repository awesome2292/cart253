//CHANGE: removed background color variable
//variables addressing parameters of the static in the background
int numStatic = 1000;
int staticSizeMin = 1;
int staticSizeMax = 3;
color staticColor = color(200);

//variables of the parameters of the paddle (location, speed of movement, color, and dimmensions) CHANGE: all integers are now float numbers
float paddleX;
float paddleY;
float paddleVX;
float paddleSpeed = 10;
float paddleWidth = 128;
float paddleHeight = 16;
color paddleColor = color(255);

//variables of the parameters of the ball (location, speed of movement, color, and dimmensions) CHANGE: all integers are now float numbers
float ballX;
float ballY;
float ballVX;
float ballVY;
float ballSpeed = 5;
float ballSize = 16;
int colorShift = 255;
color ballColor = color(255);

//setting up the canvas and the ball and paddle
void setup() {
  size(640, 480);
  setupPaddle();
  setupBall();
}

//this function sets up the paddle location when called
void setupPaddle() {
  paddleX = width/2;
  paddleY = height - paddleHeight;
  paddleVX = 0;
}

//this function sets up the ball location when called
void setupBall() {
  ballX = width/2;
  ballY = height/2;
  ballVX = ballSpeed;
  ballVY = ballSpeed;
}

//the program runs with all these functions each defined later on in the code
//each function refers to how the ball and paddle evolve and move throughout the use of the program
void draw() {
  //CHANGE: removed background color
  //CHANGE: added background color function
  gradient();

  drawStatic();

  updatePaddle();
  updateBall();

  drawPaddle();
  drawBall();
}

//CHANGE: added loop that creates a gradient on the game
void gradient() {
  int redGradient = 48;
  int greenGradient = 151;
  int blueGradient = 199;
  int gradientWidth = 640;
  int gradientHeight = 480;

  while (gradientHeight>0) {
    fill(redGradient, greenGradient, blueGradient);
    rect(width/2,height/2,gradientWidth, gradientHeight);
    gradientHeight -= 0.5;
    redGradient -= 0.5;
    greenGradient -= 0.5;
    blueGradient -= 0.5;
  }
}

//function that draws the static-like background when called
void drawStatic() {
  for (int i = 0; i < numStatic; i++) {
    float x = random(0, width);
    float y = random(0, height);
    float staticSize = random(staticSizeMin, staticSizeMax);
    fill(staticColor);
    rect(x, y, staticSize, staticSize);
  }
}

//function that allows the paddle to move at a certain speed
void updatePaddle() {
  paddleX += paddleVX;  
  paddleX = constrain(paddleX, 0+paddleWidth/2, width-paddleWidth/2);
}

//function that allows the ball to move at a certain speed
//three more functions are called here, referring to how to ball behaves around the paddle
void updateBall() {
  ballX += ballVX;
  ballY += ballVY;

  handleBallHitPaddle();
  handleBallHitWall();
<<<<<<< HEAD
  handleBallOffBottom();
  handleBallHitCenter();
=======
  gameOver(); //CHANGE: added gameOver function
>>>>>>> c43bb74905b64546c2c70900842222cb2152d178
}

//the paddle is drawn
void drawPaddle() {
  rectMode(CENTER);
  noStroke();
  fill(paddleColor);
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
}

//the ball is drawn
void drawBall() {
  rectMode(CENTER);
  noStroke();
  fill(ballColor);
  rect(ballX, ballY, ballSize, ballSize);
}

//this function refers to how the ball changes directions when it encounters the paddle
void handleBallHitPaddle() {
  if (ballOverlapsPaddle()) {
    ballY = paddleY - paddleHeight/2 - ballSize/2;
    ballVY = random(-1.5, -0.5)*ballVY; //CHANGED: ball will change direction drastically at random speeds
  }
}

//if the ball ever overlaps with the paddle, this boolean variable becomes true, if not, then it will be false
boolean ballOverlapsPaddle() {
  if (ballX - ballSize/2 > paddleX - paddleWidth/2 && ballX + ballSize/2 < paddleX + paddleWidth/2) {
    if (ballY > paddleY - paddleHeight/2) {
      return true;
    }
  }
  return false;
}

<<<<<<< HEAD

//if the ball hits the bottom of the screen, then it respawns at the center of the canvas
void handleBallOffBottom() {
=======
//CHANGE: added a game over function where the game ends if the ball goes off the screen; the screen will become white and the words "GAME OVER" will be displayed
void gameOver() {
>>>>>>> c43bb74905b64546c2c70900842222cb2152d178
  if (ballOffBottom()) {
    ballVX = 0;
    ballVY = 0;
    background(255);
    fill(0);
    text("GAME OVER <3", width/2 - 45, height/2);
  }
}

//if the ball hits the floor, the function will be true, which will allow the handleBallOffBottom function to run and reset the game
boolean ballOffBottom() {
  return (ballY - ballSize/2 > height);
}


//if the ball hits any wall except the bottom one, then it will change direction
void handleBallHitWall() {
  if (ballX - ballSize/2 < 0) {
    ballX = 0 + ballSize/2;
    ballVX = -ballVX;
  } else if (ballX + ballSize/2 > width) {
    ballX = width - ballSize/2;
    ballVX = -ballVX;
  }

  if (ballY - ballSize/2 < 0) {
    ballY = 0 + ballSize/2;
    ballVY = -ballVY;
  }
}


//if either the left or right arrow keys are hit, then the paddle will change directions accordingly across the x axis, but remain fixed on the y axis
void keyPressed() {
  if (keyCode == LEFT) {
    paddleVX = -paddleSpeed;
  } else if (keyCode == RIGHT) {
    paddleVX = paddleSpeed;
  }
}

//the paddle will stop moving when the arrow keys are released
void keyReleased() {
  if (keyCode == LEFT && paddleVX < 0) {
    paddleVX = 0;
  } else if (keyCode == RIGHT && paddleVX > 0) {
    paddleVX = 0;
  }
}