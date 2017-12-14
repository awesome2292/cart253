//DOOR CLASS
//This class is responsible for generating the various doors that need to be unlocked
//throughout the house
//The code will require parameters such as position, conditions needed to unlock it, etc
//However, they will all look the same and will be the same size, as they are merely a line
//in the vertically or horizontally


class Door {

  /////////////////////// VARIABLES //////////////////////////

  //location
  float leftDoorX1, leftDoorY1, leftDoorX2, leftDoorY2;
  float rightDoorX1, rightDoorX2, rightDoorY1, rightDoorY2;
  float topDoorX1, topDoorY1, topDoorX2, topDoorY2;
  float bottomDoorX1, bottomDoorY1, bottomDoorX2, bottomDoorY2;

  //corresponsing rooms
  Room room1;
  Room room2;

  //door
  int doorThickness;
  color doorColor;

  //door type
  //if written "horizontal" then the door is horizontal, if written "vertical" then the door is vertical
  String doorType;
  boolean nextToDoor = false;

  //door condition
  boolean locked;

  //instructions
  Instruction[] keyPhrase;


  //////////////////// CONSTRUCTOR ///////////////////////////


  //the door will be displayed on the edge of the room as a line stroke
  //it will be supposedly "locked" if the player has not completed the chain of events
  //it will then be unlocked once the player has interacted with all the objects of the corresponding room in order
  //and then the sprite will be able to pass through to the next room

  //the constructor requires the rooms on either side of the door, the status of it's lock, and eventually a keyPhrase that will help unlock it (will be used post-beta)
  Door(Room tempRoom1, Room tempRoom2, String tempDoorType, boolean tempLocked, Instruction[] tempKeyPhrase) {
    room1 = tempRoom1;
    room2 = tempRoom2;
    doorType = tempDoorType;
    doorThickness = 20;
    keyPhrase = tempKeyPhrase;
    locked = tempLocked;
  }


  ////////////////////// FUNCTIONS ///////////////////////////

  //update() function
  //checks to see if all the objects in the room have been "visited" yet
  //if an object is visited, the loop will be incremented
  //once the number of objects visited matches the length of the array,
  //the door will be "unlocked" and the sprite will be able to pass through it
  void update() {
    int numberVisited = 0;
    for (int i = 0; i< room1.things.length; i++) {
      if (room1.things[i].visited == true) {
        numberVisited ++;
      }
    }

    if (numberVisited == room1.things.length) {
      locked = false;
    }
  }


  //display() function
  //the door's display depends on the type of room it corresponds to
  //if the sprite is moving to an adjacent room horizontally, the coordinates
  //needed will be left and right
  //top and bottom coordinates are used for the doors on the ceiling or floor
  void display() {
    //the coordinates of the door from the left room
    leftDoorX1 = room1.roomX + room1.roomWidth;
    leftDoorY1 = room1.roomY + 150;
    leftDoorX2 = leftDoorX1;
    leftDoorY2 = room1.roomY + room1.roomHeight - 15;

    //the coordinates of the door from the top room
    topDoorX1 = room1.roomX + room1.roomWidth/2;
    topDoorY1 = room1.roomY;
    topDoorX2 = room1.roomX + room1.roomWidth;
    topDoorY2 = topDoorY1;

    //the coordinates of the door from the bottom room
    bottomDoorX1 = room2.roomX;
    bottomDoorY1 = room2.roomY + room2.roomHeight;
    bottomDoorX2 = room2.roomX + room2.roomWidth/2;
    bottomDoorY2 = bottomDoorY1;

    //the coordinates of the door from the right room
    rightDoorX1 = room2.roomX;
    rightDoorY1 = room2.roomY + 150;
    rightDoorX2 = rightDoorX1;
    rightDoorY2 = room2.roomY + room2.roomHeight - 15;

    stroke(doorThickness);
    strokeCap(SQUARE);
    if (doorType == "vertical") {
      fill(0, 0, 0, 0.5);
      line(rightDoorX1, rightDoorY1, rightDoorX2, rightDoorY2);
      line(leftDoorX1, leftDoorY1, leftDoorX2, leftDoorY2);
    } else if (doorType == "horizontal") {
      fill(0, 0, 0, 0.5);
      //the doors will overlap and create one door
      line(bottomDoorX1, bottomDoorY1, bottomDoorX2, bottomDoorY2);
      line(topDoorX1, topDoorY1, topDoorX2, topDoorY2);
    }
  }
}