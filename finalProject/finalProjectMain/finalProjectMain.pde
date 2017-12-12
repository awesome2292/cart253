//FINAL PROJECT
//INTERACTIVE PUZZLE GAME: SOLI
//Use the character to explore the abandoned house and discover the story of the family
//who lived in it, and eventually escape.

//This program will comprise of two main interactions: moving and interacting with objects
//CLASSES NEEDED: a ROOM class, an OBJECT class, and a DOOR class
//Any additionnal classes deemed needed will be added along the way
//Let's get started!


//////////////// VARIABLES ///////////////////
//beginning of game
boolean gameStart = true;
PFont titleFont;
PFont instructionFont;

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
boolean spriteMoving = false;


//Object Variables
boolean talkObject = false;
boolean textBoxOn = false;


//Room 1 Objects
boolean textAppear = false;
boolean textDoorAppear = false;

//chest
float chestX, chestY, chestW, chestH;
String chestImage, chestHighlight, chestInfo;
int chestId;
boolean useObject;

//carboard box
float boxX, boxY, boxW, boxH;
String boxImage, boxHighlight, boxInfo;
int boxId;

//jar
float jarX, jarY, jarW, jarH;
String jarImage, jarHighlight, jarInfo;
int jarId;

//clock
float clockX, clockY, clockW, clockH;
String clockImage, clockHighlight, clockInfo;
int clockId;


//Door0 Variables
String door0Info;

//////////////// CLASSES ////////////////////
Room room1, room2, room3, room4, room5, room6;

Room[] rooms;


Sprite puppet;




Object chest, box, jar, clock;

Door door0Right, door1Left, door1Right;



////////////// GLOBAL VARIABLES /////////////
Room roomIn;

boolean nextToDoor = false;



Instruction[] instBoxInfo = {new Instruction (false, "This is a carboard box."), 
  new Instruction (false, "Maybe if you try looking at other objects, you'll find a way out of this room."), 
  new Instruction (false, "It's just a carboard box. Nothing special.")}; 

Instruction[] instChestInfo = {new Instruction (false, "The chest is unlocked."), 
  new Instruction (false, "You find a crumpled piece of paper inside the chest. It's blank."), 
  new Instruction (false, "There isn't anything else inside..."), 
  new Instruction (false, "You should probably move on."), 
  new Instruction (false, "Seriously, move on. There's nothing else here."), 
  new Instruction (false, "Leave already."), 
  new Instruction (false, "..."), 
  new Instruction (false, "Oh wait."), 
  new Instruction (false, "There is a small compartment in the bottom of the chest."), 
  new Instruction (true, "It contains a small key.")};

Instruction[] instJarInfo = {new Instruction (false, "This is a jar."), 
  new Instruction (false, "It's empty.")};

Instruction[] instClockInfo = {new Instruction (false, "The clock hands remain stuck in place."), 
  new Instruction (false, "It's as if time is frozen.")};



//////////////// SETUP /////////////////////
//the game will be in full screen, with a black background
void setup() {
  //fullScreen(P3D);
  fullScreen();
  //size(1280,1024, P3D);
  background(0);

  ////////////// MENU //////////////
  titleFont = loadFont("AmaticSC-Regular-150.vlw");
  instructionFont = loadFont("AmaticSC-Regular-48.vlw");




  rooms = new Room[2];


  ////////////// ROOM 1 /////////////

  // if (roomIn == rooms[0]) {


  ////////// ROOM 1 OBJECTS ////////////
  //box object
  boxX = width/10;
  boxY = height - height/9;
  boxW = (width/height)*100;
  boxH = (width/height)*80;
  boxImage = "images/room1Box.png";
  boxHighlight = "images/room1BoxHighlight.png";

  boxId = 1;
  box = new Object(boxX, boxY, boxW, boxH, true, boxImage, boxHighlight, instBoxInfo, boxId, rooms[0]);
 

  //chest object
  chestX = width/5;
  chestY = height - height/9;
  chestW = (width/height)*200;
  chestH = (width/height)*150;
  chestImage = "images/room1Chest.png";
  chestHighlight = "images/room1ChestHighlight.png";

  chestId = 2;
  chest = new Object(chestX, chestY, chestW, chestH, false, chestImage, chestHighlight, instChestInfo, chestId, rooms[0]);


  //jar object
  jarX = width/11;
  jarY = height/2 + height/15;
  jarW = (width/height)*70;
  jarH = (width/height)*100;
  jarImage = "images/room1Jar.png";
  jarHighlight = "images/room1JarHighlight.png";

  jarId = 3;
  jar = new Object(jarX, jarY, jarW, jarH, false, jarImage, jarHighlight, instJarInfo, jarId, rooms[0]);
 


  //room1
  r1X = 0;
  r1Y =  height/2;
  r1W = width/4;
  r1H = height/2;
  r1Image = "images/room1bg.jpg";
  r1ImageDark = "images/testRoomDark.png";
  rooms[0] = new Room(r1X, r1Y, r1W, r1H, r1Image, new Object[] {box, chest, jar}, new int[] {1,2,3});

  roomIn = rooms[0];


  ///////////////// ROOM 2 ///////////////////


  //////////////// ROOM 2 OBJECTS //////////////



  //clock object
  clockX = width/2 + width/11;
  clockY = height/2 + height/3.1;
  clockW = (width/height)*70;
  clockH = (width/height)*100;
  clockImage = "images/room2Clock.png";
  clockHighlight = "images/room2ClockHighlight.png";

  clockId = 4;
  clock = new Object(clockX, clockY, clockW, clockH, true, clockImage, clockHighlight, instClockInfo, clockId, rooms[1]);
 

  //room2
  r2X = r1W;
  r2Y = height/2;
  r2W = width/2.25;
  r2H = height/2;
  r2Image = "images/room2bg.jpg";
  rooms[1] = new Room(r2X, r2Y, r2W, r2H, r2Image, new Object[] {clock}, new int[] {4});


  door0Info = "This door is locked.";
  door0Right = new Door(rooms[0], rooms[1], door0Info);

  ////room4
  //r4X = 0;
  //r4Y = 0;
  //r4W = width/4 + width/10;
  //r4H = height/2;
  //r4Image = "images/room1bg.jpg";
  //rooms[2] = new Room(r4X, r4Y, r4W, r4H, r4Image, stuff);

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
  //rooms[2] = new Room(r5X, r5Y, r5W, r5H, r5Image, stuff);

  //door1Right = new Door(rooms[1], rooms[2], door0Info);

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
  pW = (width/height)*45;
  pH = (width/height)*65;
  puppet = new Sprite(pX, pY, pW, pH);
}



//////////////// DRAW //////////////////////
//this draw function will be where all the code runs

void draw() {
  rectMode(CORNER);
  background(0);

  for (int i = 0; i < rooms.length; i++) {
    //println("In Room " + i + " RoomIn " + roomIn);
    if (roomIn == rooms[i]) {
      rooms[i].display();
    } else {
      rooms[i].darkDisplay();
    }
  }

  door0Right.display();
  door0Right.update();
  //door1Right.display();
  //door1Right.update();
  door0Right.highlight(puppet);
  for (int i = 0; i < rooms.length; i++) {
    if (roomIn == rooms[i]) {
      rooms[i].displayText();
    }
  }


  if (!textBoxOn) {
    puppet.update();
    puppet.display();
  }
  //background(30, 30, 30, 0.2);
  gameBegin();
  gameInstructions();
}


void keyPressed() {
  if (gameStart && key == 'i') {
    gameStart = false;
  } else if (!gameStart && !spriteMoving) {
    //for(int i = 0; i<255 ; i++){
    //  background(255-i);
    //if(i==255){
    spriteMoving = true;
  } else if (key == 'i') {
      roomIn.highlightObject();
    }
  //} else if (key == 'i' && roomIn == rooms[1]) {
  //  for (int i = 0; i < stuff.length; i++) {
  //    if (stuff[i].highlightObject == true && stuff[i].state == true) {
  //      textAppear = !textAppear;
  //      textBoxOn = !textBoxOn;
  //      box.visited = true;
  //      stuff[i].updateText();
  //      stuff[i].update();
  //    }
  //  }
  
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

////////// gameBegin() function ///////////
// When the game begins, present the title of the game and the instructions concerning the gameplay
//of the game. 
void gameBegin() {
  if (spriteMoving == false && gameStart == true) {
    background(0, 0, 0, 5);
    fill(255);
    textFont(titleFont);
    textAlign(CENTER);
    text("SOLI", width/2, height/2);
    textFont(instructionFont);
    textAlign(CENTER);
    text("PRESS I TO BEGIN", width/2, height/2 + height/3);
  }
}


void gameInstructions() {
  if (spriteMoving == false && gameStart == false) {
    background(0, 0, 0, 5);
    fill(255);
    textFont(instructionFont);
    textAlign(CENTER);
    text("You are in an abandoned house, left behind by your owner. You try to find a way out.\n Use the arrow keys to navigate the space, and press I on possible objects to interact with.\n \n \n \n Press I to continue", width/2, height/2);
  }
}