//SPRITE CLASS
//While there is only one sprite in the whole game, it is easier to separate it from the
//rest of the main code
//Its parameters are location, size
class Sprite{
  
///////////// VARIABLES ///////////////

//Sprite location
float spriteX;
float spriteY;
//Sprite Size
float spriteWidth;
float spriteHeight;
PImage sprite;

//////////// CONSTRUCTOR //////////////

Sprite(float spriteTempX, float spriteTempY, float spriteTempWidth, float spriteTempHeight){
  spriteX = spriteTempX;
  spriteY = spriteTempY;
  spriteWidth = spriteTempWidth;
  spriteHeight = spriteTempHeight;
  
  sprite = loadImage("images/testSprite.png");
}


void display(){
  rectMode(CENTER);
  image(sprite, spriteX, spriteY, spriteWidth, spriteHeight);
}

}