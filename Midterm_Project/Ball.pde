// Ball
//
// A class that defines a ball that can move around in the window, bouncing
// of the top and bottom, and can detect collision with a paddle and bounce off that.

class Ball {

  /////////////// Properties ///////////////

  // Default values for size
  float SIZE = 16;

  // The location of the ball
  float x;
  float y;
  float startingX;
  float startingY;
  float startingVX;
  float startingVY;

  // The velocity of the ball
  float vx;
  float vy;

  // The colour of the ball
  color ballColor = color(255);


  /////////////// Constructor ///////////////

  // Ball(int _x, int _y)
  //
  // The constructor sets the variable to their starting values
  // x and y are set to the arguments passed through (from the main program)
  // and the velocity starts at SPEED for both x and y 
  // (so the ball starts by moving down and to the right)
  // NOTE that I'm using an underscore in front of the arguments to distinguish
  // them from the class's properties

  Ball(float _x, float _y, float tempVX, float tempVY) {
    x = _x;
    y = _y;
    startingX = x;
    startingY = y;
    vx = tempVX;
    vy = tempVY;
    startingVX = vx;
    startingVY = vy;
  }


  /////////////// Methods ///////////////

  // update()
  //
  // This is called by the main program once per frame. It makes the ball move
  // and also checks whether it should bounce of the top or bottom of the screen
  // and whether the ball has gone off the screen on either side.

  void update() {
    // First update the location based on the velocity (so the ball moves)
    x += vx;
    y += vy;

    // Check if the ball is going off the top of bottom
    if (y - SIZE/2 < 0 || y + SIZE/2 > height) {
      // If it is, then make it "bounce" by reversing its velocity
      vy = -vy;
    }
  }



  //////// Beginning of reset() ////////////
  // Resets the ball to the centre of the screen.
  // Note that it KEEPS its velocity

  void reset(Paddle paddle) {
    x = startingX;
    y = paddle.y;
    vx = paddle.vx;
    vy = paddle.vy;
  }
  ///////// End of Reset //////////


  ///////// Declaration of boolean isOffScreen() /////
  // Returns true if the ball is off the left or right side of the window
  // otherwise false
  // (If we wanted to return WHICH side it had gone off, we'd have to return
  // something like an int (e.g. 0 = not off, 1 = off left, 2 = off right)
  // or a String (e.g. "ON SCREEN", "OFF LEFT", "OFF RIGHT")

  boolean isOffScreen() {
    return (x + SIZE/2 < 0 || x - SIZE/2 > width);
  }


  /////////// Beginning of collide() for the ball with the paddles ///
  // Checks whether this ball is colliding with the paddle passed as an argument
  // If it is, it makes the ball bounce away from the paddle by reversing its
  // x velocity

  void collide(Paddle paddle) {
    // Calculate possible overlaps with the paddle side by side
    boolean insideLeft = (x + SIZE/2 > paddle.x - paddle.WIDTH/2);
    boolean insideRight = (x - SIZE/2 < paddle.x + paddle.WIDTH/2);
    boolean insideTop = (y + SIZE/2 > paddle.y - paddle.HEIGHT/2);
    boolean insideBottom = (y - SIZE/2 < paddle.y + paddle.HEIGHT/2);

    // Check if the ball overlaps with the paddle
    if (insideLeft && insideRight && insideTop && insideBottom) {
      // If it was moving to the left
      if (vx < 0) {
        // Reset its position to align with the right side of the paddle
        x = paddle.x + paddle.WIDTH/2 + SIZE/2;
      } else if (vx > 0) {
        // Reset its position to align with the left side of the paddle
        x = paddle.x - paddle.WIDTH/2 - SIZE/2;
      }
      // And make it bounce
      vx = random(-1.5, -0.5)*vx;
    }
  }
  ///////// End of collide(Paddle paddle) ////////  

  
  
  /////////// Beginning of collide() for the bal with the bricks ///
  // Checks whether this ball is colliding with the brick passed as an argument
  // If it is, it makes the ball bounce away from the brick by reversing its
  // x velocity, as well as makes the brick disappear thanks to the brickExists boolean
  boolean collideBrick(Brick bricks) {
    // Calculate possible overlaps with the bricks side by side
    if (!bricks.brickExists) {
      return false;
    }

    boolean insideLeft = (x + SIZE/2 > bricks.brickX - bricks.brickWidth/2);
    boolean insideRight = (x - SIZE/2 < bricks.brickX + bricks.brickWidth/2);
    boolean insideTop = (y + SIZE/2 > bricks.brickY - bricks.brickHeight/2);
    boolean insideBottom = (y - SIZE/2 < bricks.brickY + bricks.brickHeight/2);

    // Check if the ball overlaps with the brick
    if (insideLeft && insideRight && insideTop && insideBottom) {
      // If it was moving to the left
      if (vx < 0) {
        // Reset its position to align with the right side of the brick
        x = bricks.brickX + bricks.brickWidth/2 + SIZE/2;
      } else if (vx > 0) {
        // Reset its position to align with the left side of the brick
        x = bricks.brickX - bricks.brickWidth/2 - SIZE/2;
      }
      // And make it bounce
      vx = -vx;
      brickCollision = true;
      bricks.brickExists = false;
      scoreRight.scoreText = Integer.toString(scoreRight.scoreNum++);
      
      return true;
      
    }
    return false;
  }
  /////// End of collide(Brick bricks) ///////



  ///////// Display function ////////
  // Draw the ball at its position

  void display() {
    // Set up the appearance of the ball (no stroke, a fill, and rectMode as CENTER)
    noStroke();
    fill(ballColor);
    rectMode(CENTER);

    // Draw the ball
    ellipse(x, y, SIZE, SIZE);
  }
  //////// End of display() ////////
}
///////// End of Ball class ////////