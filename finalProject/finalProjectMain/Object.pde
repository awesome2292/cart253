//OBJECT CLASS
//This class is much more complex, as it refers to the various interactive objects spread
//throughout the house, in each room
//The required parameters will most likely be the images needed to present the objects,
//the coordinates of the corners of the images, and the position of the objects, as well
//as whether the object presents only words, or can be carried

class Object {

  /////////////////// VARIABLES ///////////////////////  

  //object parameters
  float objectX;
  float objectY;
  //object dimmensions
  float objectWidth;
  float objectHeight;
  //interaction type
  boolean useObject;
  boolean talkObject;
  //image of the object
  PImage objectImage;
  PImage highlightImage;


  ///////////////////// CONSTRUCTOR //////////////////////

  Object(float tempObjX, float tempObjY, float tempObjW, float tempObjH, boolean tempUseObj, PImage tempObjImg) {
    objectX = tempObjX;
    objectY = tempObjY;
    objectWidth = tempObjW;
    objectHeight = tempObjH;
    useObject = tempUseObj;
    objectImage = tempObjImg;
  }


  ///////////////////// FUNCTIONS ////////////////////
  
  void update(){

    
  }
  
  void highlight(Sprite puppet){
    //Calculate possible overlaps with the sprite and the object
    boolean insideX = (objectX <= puppet.spriteX && objectX >= puppet.spriteX);
    boolean insideY = (objectY >= puppet.spriteY && objectY <= puppet.spriteY);
// Check if the sprite overlaps with the object
    if (insideX && insideY) {
      //If so, then the image of the object will be replaced with a "highlighted" version
      //Meaning that the object will be highlighted when the sprite passes by it
      loadImage(highlightImage); 
      talkObject = true;
  }
  else {
   loadImage(objectImage); 
  }
  
  
}