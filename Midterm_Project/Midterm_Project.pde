// Pong
//
// A simple version of Brick Breaker using object-oriented programming.
// Allows people to bounce a ball against a wall of bricks between
// two paddles that they control.

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


//background image variable
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
int scoreRightNum;
int scoreLeftNum;
int readjustedScoreRightX;
int readjustedScoreLeftX;

//booleans concerning the state of the game
boolean gameStart = true;
boolean spaceStart = false;

//font variables
PFont wallFont;
PFont instructionFont;


///// Beginning of set up //////
// Sets the size of screen, creates the paddles, ball, bricks, and score

void setup() {
  // Set the size
  size(600, 600);
  //paddle coordinates
  int rightPaddleX = width - PADDLE_INSET;
  int rightPaddleY = height/2;

  //readjusted score values
  readjustedScoreRightX = 350;
  readjustedScoreLeftX = 40;

  //background image
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
  scoreRight = new Score(130, scoreColor, width - width/4, height, 500, 500);
  scoreLeft = new Score(130, scoreColor, -25, height, 500, 500);
  scoreRightNum = scoreRight.scoreNum;
  scoreLeftNum = scoreLeft.scoreNum;
}

////// end of set up //////




////// Beginning of draw ////////
// Handles all the magic of making the paddles and ball move, checking
// if the ball has hit a paddle and the bricks, and displaying everything.

void draw() {
  // Fill the background with gradient each frame so we have animation
  background(backgroundImage);
  wallFont = loadFont("Nervous-48.vlw");
  instructionFont = loadFont("ArcadeClassic-16.vlw");

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

  //Adjusting score parameters based on the number of bricks hit for each ball
  for ( int i=0; i < bricks.length; i++) {
    if (ball2.collideBrick(bricks[i]) == true) {
      brickCount ++;
      scoreRightNum ++;
      scoreRight.scoreText = Integer.toString(scoreRightNum);
      rightPaddle.HEIGHT += 3;
    }

    if (ball.collideBrick(bricks[i]) == true) {
      brickCount++;
      scoreLeftNum++;
      scoreLeft.scoreText = Integer.toString(scoreLeftNum);
      leftPaddle.HEIGHT += 3;
    }

    if (ball2.collideBrick(bricksLeftlvl2[i]) == true) {
      brickCount++;
      scoreRightNum ++;
      scoreRight.scoreText = Integer.toString(scoreRightNum);
      rightPaddle.HEIGHT += 2;
    }

    if (ball.collideBrick(bricksRightlvl2[i]) == true) {
      brickCount++;
      scoreLeftNum++;
      scoreLeft.scoreText = Integer.toString(scoreLeftNum);
      leftPaddle.HEIGHT += 2;
    }
    if (ball2.collideBrick(bricksRightlvl2[i]) == true) {
      brickCount++;
      scoreRightNum ++;
      scoreRight.scoreText = Integer.toString(scoreRightNum);
      rightPaddle.HEIGHT += 2;
    }

    if (ball.collideBrick(bricksLeftlvl2[i]) == true) {
      brickCount++;
      scoreLeftNum++;
      scoreLeft.scoreText = Integer.toString(scoreLeftNum);
      leftPaddle.HEIGHT += 2;
    }

    if (ball2.collideBrick(bricksRightlvl3[i]) == true) {
      brickCount++;
      scoreRightNum ++;
      scoreRight.scoreText = Integer.toString(scoreRightNum);
      rightPaddle.HEIGHT += 1;
    }
    if (ball.collideBrick(bricksLeftlvl3[i]) == true) {
      brickCount++;
      scoreLeftNum++;
      scoreLeft.scoreText = Integer.toString(scoreLeftNum);
      leftPaddle.HEIGHT += 1;
    }

    if (ball2.collideBrick(bricksLeftlvl3[i]) == true) {
      brickCount++;
      scoreRightNum ++;
      scoreRight.scoreText = Integer.toString(scoreRightNum);
      rightPaddle.HEIGHT += 1;
    }

    if (ball.collideBrick(bricksRightlvl3[i]) == true) {
      brickCount++;
      scoreLeftNum++;
      scoreLeft.scoreText = Integer.toString(scoreLeftNum);
      leftPaddle.HEIGHT += 1;
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

  // Display the paddles, the ball, and the score
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

  //list of all the functions that are called in the beginning of the game
  scoreReadjust();
  gameBegin();
  spaceBegin();
  levelUp1();
  levelUp2();
  gameOver();
  //winGame();
}

//////// End of Draw Function ////////


//////////////////////////Functions///////////////////////////////////////

////////// scoreReadjust() function ///////////
// readjusts the x coordinate of the scores if they go over the screen
void scoreReadjust() {
  if (scoreRightNum >= 10) {
    scoreRight.scoreX = readjustedScoreRightX;
  }
  if (scoreLeftNum >= 10) {
    scoreLeft.scoreX = readjustedScoreLeftX;
  }
}
//////// end of scoreReadjust /////////

////////// gameBegin() function ///////////
// When the game begins, present the title of the game and the instructions concerning the gameplay
//of the game. 
void gameBegin() {
  if (ballMoving == false && gameStart == true) {
    background(0, 0, 0, 5);
    fill(255);
    textFont(wallFont);
    textAlign(CENTER);
    text("The Wall", width/2, height/2);
    textFont(instructionFont);
    textAlign(CENTER);
    text("Take down the Wall! Use the W and S keys (player 1)\n and the Up and Down keys (player 2) to bounce the balls\n off the bricks of the wall to make them disappear.\n Clear all three walls to win the game!\n\nBe careful though! If one player loses their ball,\n the other can still play!\n\nPress A to begin", width/2, height-height/2.5);
  }
}
/////// end of gameBegin //////////


/////// beginning of spaceBegin() function ////////
//after the gameBegin screen goes away, this function presents the instructions on how to get the 
//balls off the paddles
void spaceBegin() {
  if (spaceStart == false && gameStart ==false) {
    fill(255);
    textFont(instructionFont);
    textAlign(CENTER);
    text("Press SPACE to begin", width/2, height/2);
  }
}
//////// end of spaceBegin() ////////


//////// Beginning of keyPressed() function //////////

// The paddles need to know if they should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the paddles
// The game will begin with the ball glued to each paddle

void keyPressed() {
  // Just call both paddles' own keyPressed methods
  leftPaddle.keyPressed();
  rightPaddle.keyPressed();

  // if the balls are not moving, then they stay glued to their respective paddles
  if (!ballMoving) {
    ball.vy = leftPaddle.vy;
    ball2.vy = rightPaddle.vy;

    // if the player presses A, then the gameBegin function will stop running
    if (gameStart == true && key == 'a') {
      gameStart = false;
    }
    //if the player presses SPACE, then the balls will move and the game will begin
    if ( key == ' ') {
      spaceStart = true;
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

///////// levelUp1() function ////////
//after the first round of bricks is hit, a second round will appear
//and the player will "level Up"
void levelUp1() {
  if (brickCount == bricks.length) {
    for (int i=0; i<bricks.length; i++) {
      bricksRightlvl2[i].brickExists = true;
      bricksLeftlvl2[i].brickExists = true;
      bricks[i].brickExists = true;
    }
  }
}
///// end of levelUp1() ////////


///////// levelUp2() function ////////
//after the second round of bricks is hit, a third round will appear
//and the player will "level Up"
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
//////// end of levelUp2() ///////


/////////// gameOverFunction() //////////
// if both balls go out of bounds, then the game will end, displaying a black screen with "GAME OVER"
// and the result of the game
void gameOver() {
  if (ball.ballReset == true && ball2.ballReset == true) {
    background (0);
    fill(255);
    textSize(36);
    textAlign(CENTER);
    textFont(wallFont);
    text("GAME OVER", width/2, height/2);
    if (scoreRightNum > scoreLeftNum) {
      textFont(instructionFont);
      text("Player 2 beat PLayer 1!", width/2, height-height/2.25);
    }
    if (scoreRightNum < scoreLeftNum) {
      textFont(instructionFont);
      text("Player 1 beat PLayer 2!", width/2, height-height/2.25);
    }
    if (scoreRightNum == scoreLeftNum) {
      textFont(instructionFont);
      text("It's a tie between the two players!", width/2, height-height/2.25);
    }
    textFont(instructionFont);
    text("Please Restart the Game", width/2, height-height/2.5);
  }
}
//////// end of gameOver() ///////

//void winGame() {
//  for (int i=0; i<9*bricks.length; i++) {
//    if (bricks[i].brickExists == false &&  bricksLeftlvl2[i].brickExists == false && bricksRightlvl2[i].brickExists == false && bricksRightlvl3[i].brickExists == false && bricksLeftlvl3[i].brickExists == false && ballMoving == true) {
//      background (0);
//      fill(255);
//      textSize(36);
//      textAlign(CENTER);
//      textFont(wallFont);
//      text("YOU WIN!!", width/2, height/2);
//      textFont(instructionFont);
//      text("Please Restart the Game", width/2, height-height/2.5);
//      if (scoreRightNum > scoreLeftNum) {
//        textFont(instructionFont);
//        text("Player 2 beat PLayer 1!", width/2, height-height/2.25);
//      }
//      if (scoreRightNum < scoreLeftNum) {
//        textFont(instructionFont);
//        text("Player 1 beat PLayer 2!", width/2, height-height/2.25);
//      }
//      if (scoreRightNum == scoreLeftNum) {
//        textFont(instructionFont);
//        text("It's a tie between the two players!", width/2, height-height/2.25);
//      }
//    }
//  }
//}