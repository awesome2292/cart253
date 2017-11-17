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



  //////////////// CONSTRUCTOR //////////////////
  //Each room will have varying positions and sizes
  //Will add an image argument after once they have been made
  Room(float roomTempX, float roomTempY, float roomTempWidth, float roomTempHeight) {
    roomX = roomTempX;
    roomY = roomTempY;
    roomWidth = roomTempWidth;
    roomHeight = roomTempHeight;
  }

  //////////////// FUNCTIONS ////////////////////

  //not sure if I'll need and update function...
  void update() {
  }

  // This function is responsible for the sprite colliding with the walls of each room and
  //unable to move further
  void collide() {
  }

  void display() {
    noFill();
    stroke(strokeColor);
    strokeWeight(strokeThickness);
    rect(roomX, roomY, roomWidth, roomHeight);
  }
}