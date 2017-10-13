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
int leftStartingX = leftPaddleX;
int leftStartingY;
int rightPaddleX;
int rightPaddleY;
int rightStartingX;
int rightStartingY;
boolean ballMoving = false;
// setup()
//
// Sets the size, creates the paddles, ball, and bricks

void setup() {
  // Set the size
  size(600, 600);
  int rightPaddleX = width - PADDLE_INSET;
  int rightPaddleY = height/2;
  int rightStartingX = rightPaddleX;
  int rightStartingY = rightPaddleY;
  int leftStartingY = leftPaddleY;
  backgroundImage = loadImage("images/desertmockup.png");
  // Create the paddles on either side of the screen. 
  // Use PADDLE_INSET to to position them on x, position them both at centre on y
  // Also pass through the two keys used to control 'up' and 'down' respectively
  // NOTE: On a mac you can run into trouble if you use keys that create that popup of
  // different accented characters in text editors (so avoid those if you're changing this)
  leftPaddle = new Paddle(leftPaddleX, leftPaddleY, 87, 83);
  rightPaddle = new Paddle(rightPaddleX, rightPaddleY, 38, 40);

  // Create the ball at the centre of the screen
  ball = new Ball(leftPaddleX + leftPaddle.WIDTH/2 +8 , leftPaddleY, 0, 0);
  ball2 = new Ball(rightPaddleX - rightPaddle.WIDTH/2 - 8, rightPaddleY, 0, 0);

  bricks = new Brick[10];
  //set up the brick onto the canvas
  for (int i = 0; i < brickNum; i++) {
    bricks[i] = new Brick(width/2, i*(height/brickNum), 20, height/brickNum);
  }
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

  // Check if the ball has collided with either paddle
  ball.collide(leftPaddle);
  ball.collide(rightPaddle);
  ball2.collide(rightPaddle);
  ball2.collide(leftPaddle);

  for ( int i=0; i < brickNum; i++) {
    ball.collideBrick(bricks[i]);
    ball2.collideBrick(bricks[i]);
      //if(brickCollision == true){
      //  brickExists = false;
      //}
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

  // Display the bricks when round starts
    for (int i = 0; i < 10; i++) {
      bricks[i].update();
      bricks[i].display();
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
  
  if (!ballMoving){
   ball.vy = leftPaddle.vy;
   ball2.vy = rightPaddle.vy;
  
  if( key == ' '){
    ballMoving = true;
   ball.vy = 5;
   ball2.vy = -5;
   ball.vx = 5;
   ball2.vx = -5;
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
  
    if (!ballMoving){
   ball.vy = leftPaddle.vy;
   ball2.vy = rightPaddle.vy;
  }
}