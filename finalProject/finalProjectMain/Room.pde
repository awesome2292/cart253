//ROOM CLASS
//This is the most complex class, as each room must be defined as separate objects
//The parameters for this class are size, location, and the objects and doors that correspond
//to the room
//Images will be used as a "background" for each room, only the walls will be generated in processing


class Room {

  ///////////////// VARIABLES ///////////////////

  //parameters of the location of the room on the screen (with RECTMODE center)
  float roomX;
  float roomY;
  //the size of the room
  float roomWidth;
  float roomHeight;
  //the color of the "walls" of the room as well as their thickness
  float strokeColor = 50;
  float strokeThickness = 30;
  //the image of the room
  PImage roomBackground;
  String roomImage;
  String roomImageDark;
   

  //Outer variables
  Object[] things;
  Door[] doors;
  int[] objectIds;

  int currentIndex = 0;
  int currentId = -1;

  //////////////// CONSTRUCTOR //////////////////
  //Each room will have varying positions and sizes
  //Will add an image argument after once they have been made
  Room(float roomTempX, float roomTempY, float roomTempWidth, float roomTempHeight, String tempRoomImage, Object[] tempThings, int[] tempObjectIds) {
    roomX = roomTempX;
    roomY = roomTempY;
    roomWidth = roomTempWidth;
    roomHeight = roomTempHeight;
    roomImage = tempRoomImage;
    objectIds = tempObjectIds;
    things = tempThings;
  }

  //////////////// FUNCTIONS ////////////////////

  //display() function will display the room with it's
  //corresponding image, as well as a stroke surrounding the image
  //to create a wall
  void display() {
    imageMode(CORNER);
    roomBackground = loadImage(roomImage);
    noFill();
    stroke(strokeColor);
    strokeWeight(strokeThickness);
    image(roomBackground, roomX, roomY,  roomWidth, roomHeight);
    rect(roomX, roomY, roomWidth, roomHeight);

    //the objects will also be displayed within their corresponding room
    for (int i = 0; i < things.length; i++) {
      things[i].display();
      boolean highlighted = things[i].highlight(puppet);
      if (highlighted) {
        setId(i);
      }
    }
  }


  //darkDisplay() function will remove the display of the room when
  //the sprite is no longer inside it
  void darkDisplay() {
    rectMode(CORNER);
    noFill();
    stroke(strokeColor);
    strokeWeight(strokeThickness);
    rect(roomX, roomY, roomWidth, roomHeight);

    //for (int i = 0; i < things.length; i++) {
    //  println("The objects should be gone");
    //  things[i].darkDisplay();
    //}
  }

  //the text box will be displayed on top of everything else
  void displayText() {
    for (int i = 0; i < things.length; i++) {
      if (things[i].highlightObject && textAppear && things[i].state) {
        things[i].displayText();
      }
    }
  }

  void update() {

    println("currentid: " + currentId);
    println("currentindex: " + currentIndex);

    if (currentIndex < objectIds.length && currentId == objectIds[currentIndex] ) {
      println("currentid = currentindex");
      currentIndex ++;
      for (int j = 0; j < things.length  && currentIndex < objectIds.length; j++) {

        if (things[j].idNum == objectIds[currentIndex]) {
          things[j].state = true;
        }
      }
    }

  }

  void setId(int idNum)
  {
    println("Setting Current ID " + idNum);
    currentId = idNum;
  }
  
  void highlightObject()
  {
    for (int i = 0; i< things.length; i++) {
      println("highlighting " + i + " H " + things[i].highlightObject + " S " + things[i].state);
      if (things[i].highlightObject == true && things[i].state == true) {
        println("highlighted "  );
        textAppear = !textAppear;
        textBoxOn = !textBoxOn;
        things[i].visited = true;
        things[i].updateText();
        setId(things[i].idNum);
        update();
      }
    }
 
  }
}