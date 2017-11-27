//FINAL PROJECT
//INTERACTIVE PUZZLE GAME: SOLI
//Use the character to explore the abandoned house and discover the story of the family
//who lived in it, and eventually escape.

//This program will comprise of two main interactions: moving and interacting with objects
//CLASSES NEEDED: a ROOM class, an OBJECT class, and a DOOR class
//Any additionnal classes deemed needed will be added along the way
//Let's get started!


//////////////// VARIABLES ///////////////////
//Room Variables
float r1X, r1Y, r1W, r1H;
float r2X, r2Y, r2W, r2H;
float r3X, r3Y, r3W, r3H;
float r4X, r4Y, r4W, r4H;
float r5X, r5Y, r5W, r5H;
float r6X, r6Y, r6W, r6H;
String r1Image, r2Image, r3Image, r4Image, r5Image, r6Image;
String r1ImageDark, r2ImageDark, r3ImageDark, r4ImageDark, r5ImageDark, r6ImageDark;
int roomNum;


//Sprite Variables
float pX, pY, pW, pH;


//Object Variables
boolean talkObject = false;
boolean textBoxOn = false;


//Room 1 Objects
//chest
float chestX, chestY, chestW, chestH;
String chestImage, chestHighlight, chestInfo;
boolean useObject;

//carboard box
float boxX, boxY, boxW, boxH;
String boxImage, boxHighlight, boxInfo;
boolean textAppear = false;


//////////////// CLASSES ////////////////////
Room room1, room2, room3, room4, room5, room6;

Room[] rooms;

Sprite puppet;


Object[] stuff;
Object chest, box;

Door door0Right, door1Left, door1Right;
boolean nextToDoor = false;


////////////// GLOBAL VARIABLES /////////////
Room roomIn;






//////////////// SETUP /////////////////////
//the game will be in full screen, with a black background
void setup() {
 //fullScreen();
  size(1000,1000);
  background(0);

  ////////////// ROOMS /////////////

  rooms = new Room[2];

  stuff = new Object[2];

  //chest object
  chestX = width/4.5;
  chestY = height-height/5;
  chestW = (width/height)*100;
  chestH = (width/height)*70;
  chestImage = "images/room1Chest.jpg";
  chestHighlight = "images/room1ChestHighlight.jpg";
  chestInfo = "This chest is locked.";
  chest = new Object(chestX, chestY, chestW, chestH, true, chestImage, chestHighlight, chestInfo);
  stuff[0] = chest;

  //box object
  boxX = width/10;
  boxY = height-height/5;
  boxW = (width/height)*100;
  boxH = (width/height)*80;
  boxImage = "images/room1Box.jpg";
  boxHighlight = "images/room1BoxHighlight.jpg";
  boxInfo = "This is a carboard box.";
  box = new Object(boxX, boxY, boxW, boxH, true, boxImage, boxHighlight, boxInfo);
  stuff[1] = box;

  //room1
  r1X = 0;
  r1Y =  height/2;
  r1W = width/4;
  r1H = height/2;
  r1Image = "images/room1bg.jpg";
  r1ImageDark = "images/testRoomDark.png";
  rooms[0] = new Room(r1X, r1Y, r1W, r1H, r1Image, stuff);

  roomIn = rooms[0];


  stuff = new Object[0];

  //room2
  r2X = r1W;
  r2Y = height/2;
  r2W = width/2.25;
  r2H = height/2;
  r2Image = "images/room1bg.jpg";
  rooms[1] = new Room(r2X, r2Y, r2W, r2H, r2Image, stuff);
  
  door0Right = new Door(rooms[0], rooms[1]);
  
  ////room4
  //r4X = 0;
  //r4Y = 0;
  //r4W = width/4 + width/10;
  //r4H = height/2;
  //r4Image = "images/room1bg.jpg";
  //room4 = new Room(r4X, r4Y, r4W, r4H, r4Image);

  ////room3
  //r3X = r4W;
  //r3Y = 0;
  //r3W = width/2.5;
  //r3H = height/2;
  //r3Image = "images/room1bg.jpg";
  //room3 = new Room(r3X, r3Y, r3W, r3H, r3Image);

  ////room5
  //r5X = r2X + r2W;
  //r5Y =  height/2;
  //r5W = width/3.25;
  //r5H = height/2;
  //r5Image = "images/room1bg.jpg";
  //room5 = new Room(r5X, r5Y, r5W, r5H, r5Image);

  ////room6
  //r6X = r3X + r3W;
  //r6Y = 0;
  //r6W = width/4;
  //r6H = height/2;
  //r6Image = "images/room1bg.jpg";
  //room6 = new Room(r6X, r6Y, r6W, r6H, r6Image);

  //rooms[6] = new Room(r1X, r1Y, r1W, r1H, r1Image, r1Image);

  //////////// SPRITE /////////////
  //sprite
  pX = 20;
  pY = height - 50;
  pW = (width/height)*25;
  pH = (width/height)*35;
  puppet = new Sprite(pX, pY, pW, pH);


  ////////// OBJECTS ////////////
}



//////////////// DRAW //////////////////////
//this draw function will be where all the code runs

void draw() {
  rectMode(CORNER);
  background(0);

  for (int i = 0; i < rooms.length; i++) {
    if (roomIn == rooms[i]) {
      rooms[i].display();
    } else {
      rooms[i].darkDisplay();
    }
  }

door0Right.display();

  for (int i = 0; i < rooms.length; i++) {
    if (roomIn == rooms[i]) {
      rooms[i].displayText();
    }
  }
  
  

  if (!textBoxOn) {
    puppet.update();
    puppet.display();
  }
}


void keyPressed() {

  if (key == 'i') {
    textAppear = !textAppear;
  }
}

void keyReleased() {
  puppet.keyReleased();
}


//When the mouse is clicked, the sprite will move from the room it's in to the other room on the screen;
void mouseClicked() {
  if (roomIn == rooms[0]) {
    roomIn = rooms[1];
  } else if (roomIn == rooms[1]) {
    roomIn = rooms[0];
  }
}