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

// Global variables for the paddles and the ball
Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;
Brick[] bricks;

// The distance from the edge of the window a paddle should be
int PADDLE_INSET = 8;

//variable determining whether the bricks exist or not
boolean brickExists = false;
//CHANGE: Go away


// setup()
//
// Sets the size, creates the paddles, ball, and bricks

void setup() {
  // Set the size
  gradient();
  size(640, 480);

  // Create the paddles on either side of the screen. 
  // Use PADDLE_INSET to to position them on x, position them both at centre on y
  // Also pass through the two keys used to control 'up' and 'down' respectively
  // NOTE: On a mac you can run into trouble if you use keys that create that popup of
  // different accented characters in text editors (so avoid those if you're changing this)
  leftPaddle = new Paddle(PADDLE_INSET, height/2, 'w', 's');
  rightPaddle = new Paddle(width - PADDLE_INSET, height/2, 'o', 'k');

  // Create the ball at the centre of the screen
  ball = new Ball(width/2, height/2);
  
  bricks = new Brick[10];
  //set up the brick onto the canvas
  for (int i = 0; i < 10; i++) {
    bricks[i] = new Brick(random(0, 640), random(0, 480), 20, 100);
  }
}

// draw()
//
// Handles all the magic of making the paddles and ball move, checking
// if the ball has hit a paddle, and displaying everything.

void draw() {
  // Fill the background each frame so we have animation
gradient();
  // Update the paddles and ball by calling their update methods
  leftPaddle.update();
  rightPaddle.update();
  ball.update();

  // Check if the ball has collided with either paddle
  ball.collide(leftPaddle);
  ball.collide(rightPaddle);

  // Check if the ball has gone off the screen
  if (ball.isOffScreen()) {
    // If it has, reset the ball
    ball.reset();
  }

  // Display the paddles and the ball
  leftPaddle.display();
  rightPaddle.display();
  ball.display();
  
  // Display the bricks when event occurs
  if(brickExists == true){
    for (int i = 0; i < 10; i++) {
    bricks[i].update();
    bricks[i].display();
  }
  }
}

//loop that creates the gradient in the background
void gradient() {
  int redGradient = 200;
  int greenGradient = 151;
  int blueGradient = 199;
  int gradientWidth = 640;
  int gradientHeight = 480;

  while (gradientHeight>0) {
    fill(redGradient, greenGradient, blueGradient);
    rect(width/2, height/2, gradientWidth, gradientHeight);
    gradientHeight -= 0.5;
    redGradient -= 0.5;
    greenGradient -= 0.5;
    blueGradient -= 0.5;
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
}

// keyReleased()
//
// As for keyPressed, except for released!

void keyReleased() {
  // Call both paddles' keyReleased methods
  leftPaddle.keyReleased();
  rightPaddle.keyReleased();
}