//SPRITE CLASS
//While there is only one sprite in the whole game, it is easier to separate it from the
//rest of the main code
//Its parameters are location, size
class Sprite {

  ///////////// VARIABLES ///////////////

  //Sprite location
  float spriteX;
  float spriteY;
  //Sprite velocity
  float spriteVX;
  float spriteVY;
  float speed = 10;
  //Sprite Size
  float spriteWidth;
  float spriteHeight;
  PImage sprite;
  //Collision checker
  boolean wallCollisionUpDown;
  boolean wallCollisionLeftRight;

  //////////// CONSTRUCTOR //////////////

  Sprite(float spriteTempX, float spriteTempY, float spriteTempWidth, float spriteTempHeight) {
    spriteX = spriteTempX;
    spriteY = spriteTempY;
    spriteWidth = spriteTempWidth;
    spriteHeight = spriteTempHeight;

    spriteVX = 0;
    spriteVY = 0;

    sprite = loadImage("images/testSprite.png");
  }

  ///////////// FUNCTIONS //////////////

  //update() function
  //Allows the velocity to change, which changes the position of the sprite
  void update() {
    // Update position with velocity to move the Sprite
    spriteX += spriteVX;
    spriteY += spriteVY;

    // Constrain the Sprite's x and y position to remain in the window
    spriteY = constrain(spriteY, 0, height - spriteHeight);
    spriteX = constrain(spriteX, 0, width - spriteWidth);
  }



  //keyPressed() allows the sprite to move around the house
  void keyPressed() {
    // Check if the UP key is pressed
    if (keyCode == UP) {
      // If so, the sprite moves upwards with a negative Y velocity
      spriteVY = -speed;
    } // Otherwise check if the DOWN key is pressed 
    else if (keyCode == DOWN) {
      // If so, the sprite moves downwards with a positive Y velocity
      spriteVY = speed;
    }
    //Check if the LEFT key is pressed
    else if (keyCode == LEFT) {
      // If so, the sprite moves to the left with a negative X velocity
      spriteVX = -speed;
      scale(-1, 1);
    }
    //Otherwise check if the RIGHT key is pressed
    else if (keyCode == RIGHT) {
      // If so, the sprite moves to the right with a positive X velocity
      spriteVX = speed;
    }
    else if(wallCollisionUpDown){
     spriteVY = 0;
    }
    
    else if(wallCollisionLeftRight){
     spriteVX = 0; 
    }
  }



  void keyReleased() {
    // Check if the UP key is pressed while the sprite is moving up
    if (keyCode == UP && spriteVY < 0) {
      // If so it should stop
      spriteVY = 0;
    } // Otherwise check if the DOWN key is pressed while the sprite is moving down 
    else if (keyCode == DOWN && spriteVY > 0) {
      // If so it should stop
      spriteVY = 0;
    }
    // Check if the LEFT key is pressed while the sprite is moving left
    if (keyCode == LEFT && spriteVX < 0) {
      // If so it should stop
      spriteVX = 0;
    } // Otherwise check if the RIGHT key is pressed while sprite is moving right
    else if (keyCode == RIGHT && spriteVX > 0) {
      // If so it should stop
      spriteVX = 0;
    }
  }



  //////////////////////// COLLIDE FUNCTION //////////////////////////
  // Checks whether the sprite is colliding with any of the walls in the room
  // If it is, the velocity becomes null so that the sprite can't move any further

  void collide(Room wall) {
    // Calculate possible overlaps with the wall side by side
    boolean insideLeft = (spriteX < wall.strokeThickness && spriteX > wall.roomX);
    boolean insideRight = (spriteX > wall.roomWidth - wall.strokeThickness && spriteX < wall.roomX + wall.roomWidth);
    boolean insideBottom = (spriteY < height-wall.strokeThickness && spriteY > wall.roomY + wall.roomHeight);
    boolean insideTop = (spriteY > height-wall.roomHeight && spriteY < wall.roomY);

    // Check if the sprite overlaps with the wall
    if (insideLeft && spriteVX <= 0) {
      // If it was moving to the left
        //then stop
        spriteVX = 0;
      //if it was moving up
      } else if (insideRight && spriteVX >= 0) {
        //then stop
        spriteVX = 0;
      }
       else if (insideBottom && spriteVY >= 0) {
        //then stop
        spriteVY = 0;
      }
       else if (insideTop && spriteVY <= 0) {
        //then stop
        spriteVY = 0;
      }
      
      
  }
  ///////// End of collide(Paddle paddle) ////////  



  //display() function
  //the sprite will be displayed as an image, and evenually a GIF, or a mini animation?
  void display() {
    rectMode(CENTER);
    image(sprite, spriteX, spriteY, spriteWidth, spriteHeight);
  }
}