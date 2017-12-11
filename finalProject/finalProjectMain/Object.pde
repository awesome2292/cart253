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
  String[] objectInfo;
  Textbox textbox;
  Object objectBefore;
  
  //objects needed to interact with before
  boolean firstObject;
  boolean nextObject;
  //boolean objectBefore;
  //boolean objectBeforeVisited = false;
  int idNum;
  boolean state;
  int lastTxtIndex=0;


  ///////////////////// CONSTRUCTOR //////////////////////
  //Each object will have different locations, dimmensions, interaction types, and images
  Object(float tempObjX, float tempObjY, float tempObjW, float tempObjH, boolean tempState, String tempNoHighlight, String tempHighlight, String[] tempObjectInfo, int tempIdNum) {
    objectX = tempObjX;
    objectY = tempObjY;
    objectWidth = tempObjW;
    objectHeight = tempObjH;
    objectInfo = tempObjectInfo;
    noHighlightImage = tempNoHighlight;
    highlightImage = tempHighlight;
    objectImage = loadImage(noHighlightImage);
    state = tempState;
    idNum = tempIdNum;
    textbox = new Textbox();
   if (objectInfo.length >lastTxtIndex)
        {
          String info = objectInfo[lastTxtIndex];
          println(info);
          textbox.setText(info);
        }
  }


  ///////////////////// FUNCTIONS ////////////////////


  //This function determines when the objects should be interactable, by "highlighting"
  //it when the sprite passes by it
  void highlight(Sprite puppet) {
    //Calculate possible overlaps with the sprite and the object
    boolean insideX = (puppet.spriteX <= objectX+objectWidth/2 && puppet.spriteX >= objectX-objectWidth/2);
    boolean insideY = (puppet.spriteY <= objectY+objectHeight/2 && puppet.spriteY >= objectY-objectHeight/2);
    // Check if the sprite overlaps with the object
    if(insideX && insideY) {
      //If so, then the image of the object will be replaced with a "highlighted" version
      //Meaning that the object will be highlighted when the sprite passes by it
      highlightObject = true; 
      //This talkObject boolean determines whether the object can be interacted with or not
      talkObject = true;
      //println("This object should be highlighted");
      
      
    } 
    //else if(objectBefore.visited && insideX && insideY) {
      
    //  highlightObject = true; 
    //  //This talkObject boolean determines whether the object can be interacted with or not
    //  talkObject = true;
    //  println("This is the next object that should be highlighted");
    //}
    else {
      highlightObject = false;
      talkObject = false;
    }
  }
  
  
  void update() {
   currentId = idNum;
    println("currentid: " + currentId);
    println("currentindex: " + currentIndex);
    for(int i = 0; i < objectIds.length ; i++){
      
      if(currentId == objectIds[currentIndex]){
        println("currentid = currentindex");
        currentIndex +=1;
        for (int j = 0; j < stuff.length; j++){
          if (stuff[j].idNum == objectIds[currentIndex]){
            stuff[j].state = true;
          }
        }
    }
    
  }
  }
  

  void updateText()
  {
    println("comparing lengths " + objectInfo.length + " " + lastTxtIndex);
    if (visited && objectInfo.length >lastTxtIndex)
        {
          String info = objectInfo[lastTxtIndex];
          println("Setting Text to " + info);
          textbox.setText(info);
          lastTxtIndex =  int(random(0,objectInfo.length));
        }
  }


  void displayText() {
 
     if (textAppear){
    
      visited = true;
    }
    
    println(textbox);
    textbox.display();

  
  }

  void display() {
    imageMode(CENTER);
    //if (!highlightObject) {
    //  objectImage = loadImage(noHighlightImage);
    //  image(objectImage, objectX, objectY, objectWidth, objectHeight);
    //}
    //else if (highlightObject && firstObject) {
    //  objectImage = loadImage(highlightImage);
    //  image(objectImage, objectX, objectY, objectWidth, objectHeight);
    //  println("this is the first object");
    //}
  
 
 
 
      if (!highlightObject) {
      objectImage = loadImage(noHighlightImage);
      image(objectImage, objectX, objectY, objectWidth, objectHeight);
    } else if (highlightObject) {
      objectImage = loadImage(highlightImage);
      image(objectImage, objectX, objectY, objectWidth, objectHeight);
      //println("this is the next object");
    }

}

}