// Pong
//
// A simple version of Pong using object-oriented programming.
// Allows to people to bounce a ball back and forth between
// two paddles that they control.
//
// No scoring. (Yet!)
// No score display. (Yet!)
// Pretty ugly. (Now!)
// Only two paddles. (So far!)

// Global variables for the paddles, the ball, and the bricks
Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;
Ball ball2;
Brick[] bricks;
Brick[] bricksRightlvl2;
Brick[] bricksLeftlvl2;
Score scoreRight;
Score scoreLeft;


PImage backgroundImage;

// The distance from the edge of the window a paddle should be
int PADDLE_INSET = 8;

//variable determining whether the bricks exist or not
boolean brickCollision;
//CHANGE: Go away

//variables for the brick dimmensions
int brickX = width/2; //for some reason width/2 doesn't work???
int brickY = height;
int brickNum = 10;

int leftPaddleX = PADDLE_INSET;
int leftPaddleY = height/2;
int rightPaddleX;
int rightPaddleY;
boolean ballMoving = false;

color scoreColor = color(150, 150, 50, 90);
// setup()
//
// Sets the size, creates the paddles, ball, and bricks

void setup() {
  // Set the size
  size(600, 600);
  int rightPaddleX = width - PADDLE_INSET;
  int rightPaddleY = height/2;
  backgroundImage = loadImage("images/desertmockup.png");
  // Create the paddles on either side of the screen. 
  // Use PADDLE_INSET to to position them on x, position them both at centre on y
  // Also pass through the two keys used to control 'up' and 'down' respectively
  // NOTE: On a mac you can run into trouble if you use keys that create that popup of
  // different accented characters in text editors (so avoid those if you're changing this)
  leftPaddle = new Paddle(leftPaddleX, leftPaddleY, 87, 83);
  rightPaddle = new Paddle(rightPaddleX, rightPaddleY, 38, 40);

  // Create the ball at the centre of the screen
  ball = new Ball(leftPaddleX + leftPaddle.WIDTH/2 +8, leftPaddleY, 0, 0);
  ball2 = new Ball(rightPaddleX - rightPaddle.WIDTH/2 - 8, rightPaddleY, 0, 0);

  bricks = new Brick[10];
  bricksRightlvl2 = new Brick[10];
  bricksLeftlvl2 = new Brick[10];
  //set up the brick onto the canvas
  for (int i = 0; i < brickNum; i++) {
    bricks[i] = new Brick(width/2, i*(height/brickNum), 20, height/brickNum);
    bricksRightlvl2[i] = new Brick(width/2 + 20, i*(height/brickNum), 20, height/brickNum);
    bricksLeftlvl2[i] = new Brick(width/2 -20, i*(height/brickNum), 20, height/brickNum);
  }

  scoreRight = new Score(300, scoreColor, width-width/4, height/2, 100, height/2);
  scoreLeft = new Score(300, scoreColor, width/4, height/2, 100, height/2);
}

// draw()
//
// Handles all the magic of making the paddles and ball move, checking
// if the ball has hit a paddle, and displaying everything.

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

  for ( int i=0; i < brickNum; i++) {
    ball.collideBrick(bricks[i]);
    ball2.collideBrick(bricks[i]);
  }

  //Check if the ball has gone off the screen
  if (ball.isOffScreen()) {
    // If it has, reset the ball
    ball.reset();
  }
  if (ball2.isOffScreen()) {
    // If it has, reset the ball
    ball2.reset();
  }

  // Display the paddles and the ball
  leftPaddle.display();
  rightPaddle.display();
  ball.display();
  ball2.display();
  scoreRight.display();
  scoreLeft.display();

  // Display the bricks when round starts
  for (int i = 0; i < 10; i++) {
    bricks[i].update();
    bricks[i].display();
    if ( bricks[i].brickExists == false) {
      bricksRightlvl2[i].update();
      bricksLeftlvl2[i].update();
      bricksRightlvl2[i].display();
      bricksLeftlvl2[i].display();
      bricksRightlvl2[i].brickExists = true;
      bricksLeftlvl2[i].brickExists = true;
    }
  }
}

// keyPressed()
//
// The paddles need to know if they should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the paddles

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

void levelUp() {
}