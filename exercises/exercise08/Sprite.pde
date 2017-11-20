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
  float speed = 5;
  float friction = 0.9;
  //Accelaration
  float spriteAX;
  float spriteAY;
  float acceleration = 7;
  //Sprite Size
  float spriteWidth;
  float spriteHeight;
  PImage sprite;

  Room roomIn;

  //////////// CONSTRUCTOR //////////////

  Sprite(float spriteTempX, float spriteTempY, float spriteTempWidth, float spriteTempHeight) {
    spriteX = spriteTempX;
    spriteY = spriteTempY;
    spriteWidth = spriteTempWidth;
    spriteHeight = spriteTempHeight;

    roomIn = room1;

    spriteVX = 0;
    spriteVY = 0;

    sprite = loadImage("images/testSprite.png");
  }

  ///////////// FUNCTIONS //////////////

  //update() function
  //Allows the velocity to change, which changes the position of the sprite
  //The coordinates of the sprite are constrained
  void update() {
    // Update position with velocity to move the Sprite


    //keyPressed() allows the sprite to move around the house
    // Check if the UP key is pressed
    if (keyPressed) {
      if (keyCode == UP) {
        // If so, the sprite moves upwards with a negative Y velocity
        spriteAY = -acceleration;
      } // Otherwise check if the DOWN key is pressed 
      else if (keyCode == DOWN) {
        // If so, the sprite moves downwards with a positive Y velocity

        spriteAY = acceleration;
      }

      //Check if the LEFT key is pressed
      if (keyCode == LEFT) {
        // If so, the sprite moves to the left with a negative X velocity

        spriteAX = -acceleration;
      }
      //Otherwise check if the RIGHT key is pressed
      else if (keyCode == RIGHT) {
        // If so, the sprite moves to the right with a positive X velocity
        spriteAX = acceleration;
      }
    }


      spriteVX += spriteAX;
      spriteVY += spriteAY;

      spriteVX *= friction;
      spriteVY *= friction;

      spriteX += spriteVX;
      spriteY += spriteVY;

      //The sprite is constrained to the borders of the room it's in
      spriteY = constrain(spriteY, roomIn.roomY + roomIn.strokeThickness, roomIn.roomY + roomIn.roomHeight - spriteHeight);
      
      spriteX = constrain(spriteX, roomIn.roomX + roomIn.strokeThickness, roomIn.roomX + roomIn.roomWidth - spriteWidth);

      spriteVX = constrain(spriteVX, -speed, speed);
      spriteVY = constrain(spriteVY, -speed, speed);
    

  }


  //keyReleased() function
  void keyReleased() {
    if (keyCode == UP || keyCode == DOWN) {
      spriteAY = 0;
    }
    if (keyCode == LEFT || keyCode == RIGHT) {
      spriteAX = 0;
    }
  }





  //display() function
  //the sprite will be displayed as an image, and evenually a GIF, or a mini animation?
  void display() {
    rectMode(CENTER);
    image(sprite, spriteX, spriteY, spriteWidth, spriteHeight);
  }
}