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

  //Animation
  boolean animated = false;
  
  //Classes
  Animation animationForward;
  Animation animationForwardStop;

  //////////// CONSTRUCTOR //////////////

  Sprite(float spriteTempX, float spriteTempY, float spriteTempWidth, float spriteTempHeight) {
    spriteX = spriteTempX;
    spriteY = spriteTempY;
    spriteWidth = spriteTempWidth;
    spriteHeight = spriteTempHeight;


    spriteVX = 0;
    spriteVY = 0;

    sprite = loadImage("data/spriteAnimationForward01.png");

    //animations
    animationForward = new Animation("spriteAnimationForward0", 5, 2);
    animationForwardStop = new Animation("spriteAnimationForwardStop0", 5, 2);
  }

  ///////////// FUNCTIONS //////////////

  //update() function
  //Allows the velocity to change, which changes the position of the sprite
  //The coordinates of the sprite are constrained
  void update() {
    // Update position with velocity to move the Sprite

    if (spriteMoving) {
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
          animationForward.display(spriteX,spriteY);
          animated = true;
        }
      }

      //velocity depends on the increasing and decreasing acceleration
      spriteVX += spriteAX;
      spriteVY += spriteAY;

      //friction is applied when the sprite slows down
      spriteVX *= friction;
      spriteVY *= friction;

      //the position of the sprite will change according to the varying velocity
      spriteX += spriteVX;
      spriteY += spriteVY;

      //if the sprite is next to the left side of the door it needs to pass through
      // the constrain will be cancelled and it will be able to pass through to the next room from the left side
      if (door0Right.locked == false) {
        if (spriteX > door0Right.leftDoorX1 - 100 && spriteX < door0Right.leftDoorX1 + roomIn.strokeThickness/2 && spriteY > door0Right.leftDoorY1 && spriteY < door0Right.leftDoorY2) {
          nextToDoor = true;
          roomIn = door0Right.room1;
          //if the sprite is next to the right side of the door it needs to pass through
          // the constrain will be cancelled and it will be able to pass through to the next room from the right side
        } else if (spriteX < door0Right.rightDoorX1 + 100 && spriteX > door0Right.rightDoorX1 - roomIn.strokeThickness/2 && spriteY > door0Right.rightDoorY1 && spriteY < door0Right.rightDoorY2) {
          nextToDoor = true;
          roomIn = door0Right.room2;
          //otherwise the boolean will remain false and the constrain will remain functional
        } else {
          nextToDoor = false;
        }
      }

      //The sprite is constrained to the borders of the room it's in
      if (!nextToDoor) {
        spriteY = constrain(spriteY, roomIn.roomY + roomIn.strokeThickness, roomIn.roomY + roomIn.roomHeight - spriteHeight);

        spriteX = constrain(spriteX, roomIn.roomX + roomIn.strokeThickness, roomIn.roomX + roomIn.roomWidth - spriteWidth);
      }


      spriteVX = constrain(spriteVX, -speed, speed);
      spriteVY = constrain(spriteVY, -speed, speed);
    }
  }


  //keyReleased() function
  void keyReleased() {
    if (keyCode == UP || keyCode == DOWN) {
      spriteAY = 0;
    }
    if (keyCode == LEFT || keyCode == RIGHT) {
      spriteAX = 0;
      animationForwardStop.display(spriteX, spriteY);
      animated = false;
    }
  }





  //display() function
  //the sprite will be displayed as an image, and evenually a GIF, or a mini animation?
  void display() {
    imageMode(CENTER);
    if(!animated){
    image(sprite, spriteX, spriteY);
    }
    imageMode(CORNER);
  }
}