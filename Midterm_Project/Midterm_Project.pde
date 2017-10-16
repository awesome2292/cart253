// Pong
//
// A simple version of Brick Breaker using object-oriented programming.
// Allows people to bounce a ball against a wall of bricks between
// two paddles that they control.
//
// No scoring. (Yet!)
// No score display. (Yet!)
// Pretty ugly. (Now!)
// Only two paddles. (So far!)

// Global variables for the paddles, the ball, the bricks, and the scores
Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;
Ball ball2;
Brick[] bricks;
Brick[] bricksRightlvl2;
Brick[] bricksLeftlvl2;
Brick[] bricksRightlvl3;
Brick[] bricksLeftlvl3;
Score scoreRight;
Score scoreLeft;


//backgroun image variable
PImage backgroundImage;

// The distance from the edge of the window a paddle should be
int PADDLE_INSET = 8;

//variable determining whether the bricks exist or not
boolean brickCollision;

//variables for the brick dimmensions
int brickX = width/2; //for some reason width/2 doesn't work???
int brickY = height;
int brickCount = 0;


//variables for the paddle parameters which influence the parameters of the balls in the beginning of each round
int leftPaddleX = PADDLE_INSET;
int leftPaddleY = height/2;
int rightPaddleX;
int rightPaddleY;
boolean ballMoving = false;

//variable for the score
color scoreColor = color(150, 150, 50, 90);



///// Beginning of set up //////
// Sets the size of screen, creates the paddles, ball, bricks, and score

void setup() {
  // Set the size
  size(600, 600);
  int rightPaddleX = width - PADDLE_INSET;
  int rightPaddleY = height/2;
  backgroundImage = loadImage("images/desertmockup.png");

  //////////////////////// Paddles ///////////////////////////
  // Create the paddles on either side of the screen
  leftPaddle = new Paddle(leftPaddleX, leftPaddleY, 87, 83);
  rightPaddle = new Paddle(rightPaddleX, rightPaddleY, 38, 40);


  //////////////////////// Balls ////////////////////////////
  // Create the ball on its respective paddle
  ball = new Ball(leftPaddleX + leftPaddle.WIDTH/2 +8, leftPaddleY, 0, 0);
  ball2 = new Ball(rightPaddleX - rightPaddle.WIDTH/2 - 8, rightPaddleY, 0, 0);


  //////////////////////// Bricks ///////////////////////////
  //Create an array of bricks
  bricks = new Brick[10];
  bricksRightlvl2 = new Brick[10];
  bricksLeftlvl2 = new Brick[10];
  bricksRightlvl3 = new Brick[10];
  bricksLeftlvl3 = new Brick[10];

  //Set up the bricks in the center of the screen 
  for (int i = 0; i < bricks.length; i++) {
    bricks[i] = new Brick(width/2, i*(height/bricks.length), 20, height/bricks.length);
    bricksRightlvl2[i] = new Brick(width/2 + 20, i*(height/bricks.length), 20, height/bricks.length);
    bricksLeftlvl2[i] = new Brick(width/2 -20, i*(height/bricks.length), 20, height/bricks.length);
    bricksRightlvl3[i] = new Brick(width/2 + 40, i*(height/bricks.length), 20, height/bricks.length);
    bricksLeftlvl3[i] = new Brick(width/2 - 40, i*(height/bricks.length), 20, height/bricks.length);
    bricksLeftlvl2[i].brickExists = false;
    bricksRightlvl2[i].brickExists = false;
    bricksLeftlvl3[i].brickExists = false;
    bricksRightlvl3[i].brickExists = false;
  }


  //////////////////////// Score ///////////////////////////
  scoreRight = new Score(300, scoreColor, width - width/4, height, 500, 500);
  scoreLeft = new Score(300, scoreColor, -25, height, 500, 500);
}

////// end of set up //////




////// Beginning of draw ////////
// Handles all the magic of making the paddles and ball move, checking
// if the ball has hit a paddle and the bricks, and displaying everything.

void draw() {
  // Fill the background with gradient each frame so we have animation
  background(backgroundImage);

  // Update the paddles and ball by calling their update methods
  leftPaddle.update();
  rightPaddle.update();
  ball.update();
  ball2.update();
  scoreRight.update();
  scoreLeft.update();

  // Check if the ball has collided with either paddle
  ball.collide(leftPaddle);
  ball.collide(rightPaddle);
  ball2.collide(rightPaddle);
  ball2.collide(leftPaddle);


  for ( int i=0; i < bricks.length; i++) {
    int scoreRightNum = scoreRight.scoreNum;
    int scoreLeftNum = scoreLeft.scoreNum;
    if (ball.collideBrick(bricks[i]) == true) {
      brickCount ++;
      scoreRightNum ++;
      scoreRight.scoreText = Integer.toString(scoreRightNum++);
    }

    if (ball2.collideBrick(bricks[i]) == true) {
      brickCount++;
      scoreLeftNum++;
      scoreLeft.scoreText = Integer.toString(scoreLeftNum++);
    }

    if (ball.collideBrick(bricksLeftlvl2[i]) == true) {
      brickCount++;
      scoreRightNum ++;
      scoreRight.scoreText = Integer.toString(scoreRightNum++);
    }

    if (ball2.collideBrick(bricksRightlvl2[i]) == true) {
      brickCount++;
      scoreLeftNum++;
      scoreLeft.scoreText = Integer.toString(scoreLeftNum++);
    }
    if (ball.collideBrick(bricksRightlvl2[i]) == true) {
      brickCount++;
      scoreRightNum ++;
      scoreRight.scoreText = Integer.toString(scoreRightNum++);
    }

    if (ball2.collideBrick(bricksLeftlvl2[i]) == true) {
      brickCount++;
      scoreLeftNum++;
      scoreLeft.scoreText = Integer.toString(scoreLeftNum++);
    }

    if (ball.collideBrick(bricksRightlvl3[i]) == true) {
      brickCount++;
      scoreRightNum ++;
      scoreRight.scoreText = Integer.toString(scoreRightNum++);
    }
    if (ball2.collideBrick(bricksLeftlvl3[i]) == true) {
      brickCount++;
      scoreLeftNum++;
      scoreLeft.scoreText = Integer.toString(scoreLeftNum++);
    }

    if (ball.collideBrick(bricksLeftlvl3[i]) == true) {
      brickCount++;
      scoreRightNum ++;
      scoreRight.scoreText = Integer.toString(scoreRightNum++);
    }

    if (ball2.collideBrick(bricksRightlvl3[i]) == true) {
      brickCount++;
      scoreLeftNum++;
      scoreLeft.scoreText = Integer.toString(scoreLeftNum++);
    }
  }

  //Check if the ball has gone off the screen
  if (ball.isOffScreen()) {
    // If it has, reset the ball
    ball.reset(leftPaddle);
  }
  if (ball2.isOffScreen()) {
    // If it has, reset the ball
    ball2.reset(rightPaddle);
  }

  // Display the paddles and the ball
  leftPaddle.display();
  rightPaddle.display();
  ball.display();
  ball2.display();
  scoreRight.display();
  scoreLeft.display();

  // Display the bricks when round starts
  for (int i = 0; i < bricks.length; i++) {
    bricks[i].update();
    bricks[i].display();
    bricksRightlvl2[i].update();
    bricksLeftlvl2[i].update();
    bricksRightlvl2[i].display();
    bricksLeftlvl2[i].display();
    bricksRightlvl2[i].display();
    bricksLeftlvl3[i].update();
    bricksRightlvl3[i].update();
    bricksRightlvl3[i].display();
    bricksLeftlvl3[i].display();
  }

  levelUp1();
  levelUp2();
}

//////// End of Draw Function ////////



//////// Beginning of keyPressed() function //////////

// The paddles need to know if they should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the paddles
// The game will begin with the ball glued to each paddle

void keyPressed() {
  // Just call both paddles' own keyPressed methods
  leftPaddle.keyPressed();
  rightPaddle.keyPressed();

  if (!ballMoving) {
    ball.vy = leftPaddle.vy;
    ball2.vy = rightPaddle.vy;

    if ( key == ' ') {
      ballMoving = true;
      ball.vy = 5;
      ball2.vy = -5;
      ball.vx = 3;
      ball2.vx = -3;
    }
  }
}
//////// End of keyPressed() //////////


//////// Beginning of keyReleased() function ////////
// keyReleased()
//
// As for keyPressed, except for released!

void keyReleased() {
  // Call both paddles' keyReleased methods
  leftPaddle.keyReleased();
  rightPaddle.keyReleased();

  if (!ballMoving) {
    ball.vy = leftPaddle.vy;
    ball2.vy = rightPaddle.vy;
  }
}

///////// End of keyReleased() function /////////

void levelUp1() {
  if (brickCount == bricks.length) {
    //ballMoving = false;
    //ball.vx = leftPaddleX;
    //ball2.vx = rightPaddleX;
    //ball.y = leftPaddle.y;
    //ball2.y = rightPaddle.y;
    //ball.x = leftPaddle.x + ball.SIZE;
    //ball2.x = rightPaddle.x - ball.SIZE;
    //keyPressed();
    //keyReleased();
    for (int i=0; i<bricks.length; i++) {
      bricksRightlvl2[i].brickExists = true;
      bricksLeftlvl2[i].brickExists = true;
      bricks[i].brickExists = true;
    }
  }
}

void levelUp2() {
  if (brickCount == bricks.length + bricksRightlvl2.length + bricksLeftlvl2.length) {
    for (int i=0; i<bricks.length + bricksRightlvl2.length + bricksLeftlvl2.length; i++) {
      bricksRightlvl2[i].brickExists = true;
      bricksLeftlvl2[i].brickExists = true;
      bricks[i].brickExists = true;
      bricksRightlvl3[i].brickExists = true;
      bricksLeftlvl3[i].brickExists = true;
    }
  }
}