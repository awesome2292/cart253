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


  //////////////// CONSTRUCTOR //////////////////
  //Each room will have varying positions and sizes
  //Will add an image argument after once they have been made
  Room(float roomTempX, float roomTempY, float roomTempWidth, float roomTempHeight, String tempRoomImage, Object[] tempThings) {
    roomX = roomTempX;
    roomY = roomTempY;
    roomWidth = roomTempWidth;
    roomHeight = roomTempHeight;
    roomImage = tempRoomImage;
    things = tempThings;
  }

  //////////////// FUNCTIONS ////////////////////

  ////not sure if I'll need and update function...
  //void update(Room room) {
  //  if(roomIn == room){
  //   display(); 
  //  }
  //  else{
  //   darkDisplay(); 
  //  }
  //}


  void display() {
    imageMode(CORNER);
    roomBackground = loadImage(roomImage);
    noFill();
    stroke(strokeColor);
    strokeWeight(strokeThickness);
    image(roomBackground, roomX, roomY, roomWidth, roomHeight);
    rect(roomX, roomY, roomWidth, roomHeight);
    
    for (int i = 0; i < things.length ; i++){
  things[i].display();
  things[i].highlight(puppet);
}

  }

  void darkDisplay() {
    rectMode(CORNER);
    noFill();
    stroke(strokeColor);
    strokeWeight(strokeThickness);
    rect(roomX, roomY, roomWidth, roomHeight);
 
  }
  
  void displayText(){
    for (int i = 0 ; i < things.length; i++){
    if (things[i].highlightObject){
      things[i].displayText();
    }
    }
  }
}