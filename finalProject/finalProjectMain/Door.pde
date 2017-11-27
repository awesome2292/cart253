//DOOR CLASS
//This class is responsible for generating the various doors that need to be unlocked
//throughout the house
//The code will require parameters such as position, conditions needed to unlock it, etc
//However, they will all look the same and will be the same size, as they are merely a line
//in wall sideways


class Door {

  /////////////////////// VARIABLES //////////////////////////

  //location
  float leftDoorX1, leftDoorY1, leftDoorX2, leftDoorY2;
  float rightDoorX1, rightDoorX2, rightDoorY1, rightDoorY2;

  //corresponsing rooms
  Room room1;
  Room room2;

  //door
  int doorThickness;
  color doorColor;
  
  boolean locked = true;



  //////////////////// CONSTRUCTOR ///////////////////////////


  //the door will be displayed on the edge of the room as a line stroke
  //it will be supposedly "locked" if the player has not completed the chain of events
  //it will then be unlocked once the player has interacted with all the objects of the corresponding room in order
  //and then the sprite will be able to pass through to the next room

  //the constructor requires the rooms on either side of the door
  Door(Room tempRoom1, Room tempRoom2) {
    room1 = tempRoom1;
    room2 = tempRoom2;
    doorThickness = 20;
  }


  ////////////////////// FUNCTIONS ///////////////////////////


  void update() {
    int numberVisited = 0;
    for (int i = 0; i< room1.things.length ; i++){
     if(room1.things[i].visited == true){
       numberVisited ++;
     }
    }
    
    if(numberVisited == room1.things.length-1){
     locked = false; 
    }
    
    println("nb visited: " + numberVisited);
  }



  //display() function
  //the door's display depends on the type of room it corresponds to
  void display() {
    fill(0, 0, 0, 0.5);
    stroke(doorThickness);
    strokeCap(SQUARE);

    //the coordinates of the door from the left room
    leftDoorX1 = room1.roomX + room1.roomWidth;
    leftDoorY1 = room1.roomY + 150;
    leftDoorX2 = leftDoorX1;
    leftDoorY2 = room1.roomY + room1.roomHeight - 15;

    //the coordinates of the door from the right room
    rightDoorX1 = room2.roomX;
    rightDoorY1 = room2.roomY + 150;
    rightDoorX2 = rightDoorX1;
    rightDoorY2 = room2.roomY + room2.roomHeight - 15;

    //the doors will overlap and create one door
    line(rightDoorX1, rightDoorY1, rightDoorX2, rightDoorY2);
    line(leftDoorX1, leftDoorY1, leftDoorX2, leftDoorY2);
  }
}