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

  //image of the object
  PImage objectImage;
  String noHighlightImage;
  String highlightImage;
  boolean highlightObject;
  boolean visited = false;

  //information about the object
  String objectInfo;
  Textbox textbox;
  Object objectBefore;
  
  //objects needed to interact with before
  boolean firstObject;
  boolean nextObject;
  //boolean objectBefore;
  //boolean objectBeforeVisited = false;




  ///////////////////// CONSTRUCTOR //////////////////////
  //Each object will have different locations, dimmensions, interaction types, and images
  Object(float tempObjX, float tempObjY, float tempObjW, float tempObjH, boolean tempFirstObj, boolean tempNextObj, String tempNoHighlight, String tempHighlight, String tempObjectInfo, Object tempObjBefore) {
    objectX = tempObjX;
    objectY = tempObjY;
    objectWidth = tempObjW;
    objectHeight = tempObjH;
    objectInfo = tempObjectInfo;
    noHighlightImage = tempNoHighlight;
    highlightImage = tempHighlight;
    objectImage = loadImage(noHighlightImage);
    objectBefore = tempObjBefore;
    textbox = new Textbox();
    textbox.setText(tempObjectInfo);
    firstObject = tempFirstObj;
    nextObject = tempNextObj;
  }


  ///////////////////// FUNCTIONS ////////////////////

  void update() {
  }

  //This function determines when the objects should be interactable, by "highlighting"
  //it when the sprite passes by it
  void highlight(Sprite puppet) {
    //Calculate possible overlaps with the sprite and the object
    boolean insideX = (puppet.spriteX <= objectX+objectWidth/2 && puppet.spriteX >= objectX-objectWidth/2);
    boolean insideY = (puppet.spriteY <= objectY+objectHeight/2 && puppet.spriteY >= objectY-objectHeight/2);
    // Check if the sprite overlaps with the object
    if(firstObject && insideX && insideY) {
      //If so, then the image of the object will be replaced with a "highlighted" version
      //Meaning that the object will be highlighted when the sprite passes by it
      objectBefore.highlightObject = true; 
      //This talkObject boolean determines whether the object can be interacted with or not
      talkObject = true;
      println("This object should be highlighted");
    } 
    else if(objectBefore.visited && insideX && insideY) {
      
      highlightObject = true; 
      //This talkObject boolean determines whether the object can be interacted with or not
      talkObject = true;
      println("This is the next object that should be highlighted");
    }
    else {
      highlightObject = false;
      talkObject = false;
    }
  }
  


  void displayText() {
     if (textAppear){
    visited = true;
    }
    textbox.display();
   
  }

  void display(Object beforeObject) {
    imageMode(CENTER);
    if (!highlightObject && firstObject) {
      objectImage = loadImage(noHighlightImage);
      image(objectImage, objectX, objectY, objectWidth, objectHeight);
    }
    else if (highlightObject && firstObject) {
      objectImage = loadImage(highlightImage);
      image(objectImage, objectX, objectY, objectWidth, objectHeight);
      println("this is the first object");
    }
  
 
      if (!highlightObject) {
      objectImage = loadImage(noHighlightImage);
      image(objectImage, objectX, objectY, objectWidth, objectHeight);
    } else if (highlightObject && beforeObject.visited) {
      objectImage = loadImage(highlightImage);
      image(objectImage, objectX, objectY, objectWidth, objectHeight);
      println("this is the next object");
    }

}

}