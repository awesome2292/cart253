//SPRITE CLASS
//While there is only one sprite in the whole game, it is easier to separate it from the
//rest of the main code
//Its parameters are location, size, and the doors it can pass through

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
  int spriteWidth;
  int spriteHeight;
  PImage sprite;

  //Animation
  boolean animated = false;

  //Classes
  Door[] allDoors;
  Textbox textbox;

  Animation animationForward;
  Animation animationForwardStop;

  //text (will use in post-beta version)
  String lockedOut = "The door locked behind you...";

  //////////// CONSTRUCTOR //////////////

  Sprite(float spriteTempX, float spriteTempY, Door[] tempAllDoors) {
    spriteX = spriteTempX;
    spriteY = spriteTempY;

    spriteVX = 0;
    spriteVY = 0;

    allDoors = tempAllDoors;

    sprite = loadImage("data/spriteAnimationForward01.png");
    textbox = new Textbox();

    //animations
    animationForward = new Animation("spriteAnimationForward0", 5, 2);
    animationForwardStop = new Animation("spriteAnimationForwardStop0", 5, 2);
    spriteWidth = animationForward.getWidth();
    spriteHeight = animationForward.getHeight();
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
          animated = false;
        } // Otherwise check if the DOWN key is pressed 
        else if (keyCode == DOWN) {
          // If so, the sprite moves downwards with a positive Y velocity

          spriteAY = acceleration;
          animated = false;
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
          animationForward.display(spriteX, spriteY);
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
      for (int i=0; i< allDoors.length; i++) {
        if (allDoors[i].locked == false && allDoors[i].doorType == "vertical") {
          println("You can go through " + allDoors[i]);
          if (spriteX > allDoors[i].leftDoorX1 - 100 && spriteX < allDoors[i].leftDoorX1 + roomIn.strokeThickness/2 && spriteY > allDoors[i].leftDoorY1 && spriteY < allDoors[i].leftDoorY2) {
            allDoors[i].nextToDoor = true;
            roomIn = allDoors[i].room1;
            println("nextToDoor" + allDoors[i].nextToDoor);
            //if the sprite is next to the right side of the door it needs to pass through
            // the constrain will be cancelled and it will be able to pass through to the next room from the right side
          } else if (spriteX < allDoors[i].rightDoorX1 + 100 && spriteX > allDoors[i].rightDoorX1 - roomIn.strokeThickness/2 && spriteY > allDoors[i].rightDoorY1 && spriteY < allDoors[i].rightDoorY2) {
            roomIn = allDoors[i].room2;
            allDoors[i].nextToDoor = true;
            //otherwise the boolean will remain false and the constrain will remain functional
          } //else {
          //  allDoors[i].nextToDoor = false;
          //}
        }
      }


      //same code for the horizontal doors
      //if the sprite is next to the bottom of the door it needs to pass through
      // the constrain will be cancelled and it will be able to pass through to the next room from the bottom
      for (int i=0; i< allDoors.length; i++) {
        for (int i=0; i< allDoors.length; i++) {
          if (allDoors[i].locked == false && allDoors[i].doorType == "horizontal") {
            println("You can go through " + allDoors[i]);
            if (spriteY > allDoors[i].bottomDoorY1 + 150 && spriteY < allDoors[i].bottomDoorY1 - roomIn.strokeThickness/2 && spriteX > allDoors[i].bottomDoorX1 && spriteX < allDoors[i].bottomDoorX2) {
              allDoors[i].nextToDoor = true;
              roomIn = allDoors[i].room1;
              //if the sprite is next to the top of the door it needs to pass through
              // the constrain will be cancelled and it will be able to pass through to the next room from the top
            } else if (spriteY < allDoors[i].topDoorY1 - 150 && spriteY > allDoors[i].topDoorY1 + roomIn.strokeThickness/2 && spriteX > allDoors[i].topDoorX1 && spriteX < allDoors[i].topDoorX2) {
              allDoors[i].nextToDoor = true;
              roomIn = allDoors[i].room2;
              //otherwise the boolean will remain false and the constrain will remain functional
            } else {
              allDoors[i].nextToDoor = false;
            }
          }
        }
      }


      //The sprite is constrained to the borders of the room it's in
      for (int j = 0; j < allDoors.length; j++) {
        //checks to see if the sprite isn't next to the door
        if (roomIn == allDoors[j].room1 && allDoors[j].nextToDoor == false || roomIn == allDoors[j].room2 && allDoors[j].nextToDoor == false) {

          println("nextToDoor status when we reach the constrain function is " + allDoors[j].nextToDoor);
          spriteY = constrain(spriteY, roomIn.roomY + spriteHeight/2, roomIn.roomY + roomIn.roomHeight - spriteHeight/2);

          spriteX = constrain(spriteX, roomIn.roomX + spriteWidth/2, roomIn.roomX + roomIn.roomWidth - spriteWidth/2);
        }
      }

      spriteVX = constrain(spriteVX, -speed, speed);
      spriteVY = constrain(spriteVY, -speed, speed);
    }
  }


  //keyReleased() function
  void keyReleased() {
    if (keyCode == UP || keyCode == DOWN) {
      spriteAY = 0;
      animated = false;
    }
    if (keyCode == LEFT || keyCode == RIGHT) {
      spriteAX = 0;
      animationForwardStop.display(spriteX, spriteY);
      animated = false;
    }
  }





  //display() function
  //the sprite will be displayed as an image when it is static, or moving up and down
  //but will be an animation moving forwards
  void display() {
    imageMode(CENTER);
    if (!animated) {
      image(sprite, spriteX, spriteY);
    }
    imageMode(CORNER);
  }
}