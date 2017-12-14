//OBJECT CLASS
//This class is much more complex, as it refers to the various interactive objects spread
//throughout the house, in each room
//The required parameters are the images needed to present the objects,
//the coordinates of the centers of the images, and the position of the objects, as well
//as the words the objects present

//Each object has an ID, and each room has an array of IDs in a specific order
//The objects can only be interacted with in order by ID
//So if one object has an ID placed after another object's ID in the array, then it cannot
//be interacted with until that other object has been talked to

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
  Textbox textbox;
  Instruction[] objectInstructions;
  Room associatedRoom;

  //objects needed to interact with before
  int idNum;
  int lastTxtIndex=0; 

  boolean state;


  ///////////////////// CONSTRUCTOR //////////////////////
  //Each object will have different locations, dimmensions, images, information, and the room it's associated with
  Object(float tempObjX, float tempObjY, float tempObjW, float tempObjH, boolean tempState, String tempNoHighlight, String tempHighlight, Instruction[] tempObjInst, int tempIdNum, Room tempAsRoom) {
    objectX = tempObjX;
    objectY = tempObjY;

    objectWidth = tempObjW;
    objectHeight = tempObjH;

    objectInstructions = tempObjInst;

    noHighlightImage = tempNoHighlight;
    highlightImage = tempHighlight;
    objectImage = loadImage(noHighlightImage);

    //the state of the object refers to whether or not it can be interacted with without needing to be toggled by objects before it
    //if it's true, then the object can be interacted with at any time
    state = tempState;

    idNum = tempIdNum;
    textbox = new Textbox();
    associatedRoom = tempAsRoom;


    if (objectInstructions.length >lastTxtIndex)
    {
      Instruction info = objectInstructions[lastTxtIndex];
      textbox.setText(info.instructionText);
    }
  }


  ///////////////////// FUNCTIONS ////////////////////


  //This function determines when the objects should be interactable, by "highlighting"
  //it when the sprite passes by it
  boolean highlight(Sprite puppet) {

    //Calculate possible overlaps with the sprite and the object
    boolean insideX = (puppet.spriteX <= objectX+objectWidth/2 && puppet.spriteX >= objectX-objectWidth/2);
    boolean insideY = (puppet.spriteY <= objectY+objectHeight/2 && puppet.spriteY >= objectY-objectHeight/2);
    // Check if the sprite overlaps with the object
    if (insideX && insideY) {
      //If so, then the image of the object will be replaced with a "highlighted" version
      //Meaning that the object will be highlighted when the sprite passes by it
      highlightObject = true; 
      //This talkObject boolean determines whether the object can be interacted with or not
      talkObject = true;
    } else {
      highlightObject = false;
      talkObject = false;
    }
    return highlightObject;
  }


  //updateText() allows the previous line of text from the Instruction array to be
  //replaced with the next one, so that the text won't display the same line over and
  //over again
  void updateText()
  {

    if (visited && objectInstructions.length >lastTxtIndex)
    {
      Instruction info = objectInstructions[lastTxtIndex];
      textbox.setText(info.instructionText);
      lastTxtIndex++;
    }
  }


  //The text is displayed when the textAppear boolean becomes true,
  //which is toggled with the object being highlighted in combination with
  //pressing the i key
  void displayText() {
    //if the text appears, then the object will be considered "visited",
    //possibly toggling other interactions with objects
    if (textAppear) {
      visited = true;
    }

    textbox.display();
  }


  //display() function
  //the object is displayed with the image it's associated with, which is plugged into the
  //constructor as a string argument
  void display() {
    imageMode(CENTER);
    //if the highlighted boolean is false, then display the regular object image
    if (!highlightObject) {
      objectImage = loadImage(noHighlightImage);
      image(objectImage, objectX, objectY, objectWidth, objectHeight);
    } 
    //else, replace the regular image with a highlighted image
    else if (highlightObject) {
      objectImage = loadImage(highlightImage);
      image(objectImage, objectX, objectY, objectWidth, objectHeight);
    }
  }
}