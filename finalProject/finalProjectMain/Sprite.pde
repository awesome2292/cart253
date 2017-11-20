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
    spriteX += spriteVX;
    spriteY += spriteVY;
   
   //The sprite is constrained to the borders of the room it's in
   spriteY = constrain(spriteY, roomIn.roomY + roomIn.strokeThickness, roomIn.roomY + roomIn.roomHeight - spriteHeight);;
   spriteX = constrain(spriteX, roomIn.roomX + roomIn.strokeThickness, roomIn.roomX + roomIn.roomWidth - spriteWidth);
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

    }
    //Otherwise check if the RIGHT key is pressed
    else if (keyCode == RIGHT) {
      // If so, the sprite moves to the right with a positive X velocity
      spriteVX = speed;
    }
    
    
    //On the other hand, check if the I key is pressed (I for Interaction)
   /* else if (key == 'i' && talkObject) {
      textAppear = true;
      //If the textbox is already displayed, press the I key to remove it
    } else if (key == 'i' && talkObject && textAppear) {
      talkObject = false;
      textAppear = false;
    }*/
  }


//keyReleased() function
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




  //display() function
  //the sprite will be displayed as an image, and evenually a GIF, or a mini animation?
  void display() {
    rectMode(CENTER);
    image(sprite, spriteX, spriteY, spriteWidth, spriteHeight);
  }
}