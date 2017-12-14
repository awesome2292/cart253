


//FINAL PROJECT
//INTERACTIVE PUZZLE GAME: SOLI
//Use the character to explore the abandoned house and discover the story of the family
//who lived in it, and eventually escape.

//This program will comprise of two main interactions: moving and interacting with objects
//CLASSES NEEDED: a ROOM class, an OBJECT class, and a DOOR class
//Any additionnal classes deemed needed will be added along the way
//Let's get started!




//////////////// VARIABLES /////////////////////////////////////////////
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

//painting
float paintingX, paintingY, paintingW, paintingH;
String paintingImage, paintingHighlight, paintingInfo;
int paintingId;

//stair
float stairX, stairY, stairW, stairH;
String stairImage, stairHighlight, stairInfo;
int stairId;

//bear
float bearX, bearY, bearW, bearH;
String bearImage, bearHighlight, bearInfo;
int bearId;

//painting2
float painting2X, painting2Y, painting2W, painting2H;
String painting2Image, painting2Highlight, painting2Info;
int painting2Id;

//Door0 Variables
String door0Info;

//////////////// CLASSES ////////////////////

//ROOMS
Room room1, room2, room3, room4, room5, room6;

Room[] rooms;


Sprite puppet;

Animation animationForward;


Object chest, box, jar, clock, painting, stair, bear, painting2;

Door door0to1, door1to2, door1to3;



////////////// GLOBAL VARIABLES /////////////
Room roomIn;


///////////// OBJECT INFORMATION ////////////////////////

//cardboard box
Instruction[] instBoxInfo = {new Instruction (false, "This is a carboard box."), 
  new Instruction (false, "Maybe if you try looking at other objects, you'll find a way out of this room."), 
  new Instruction (false, "It's just a carboard box. Nothing special.")}; 

//chest
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

//jar
Instruction[] instJarInfo = {new Instruction (false, "This is a jar."), 
  new Instruction (false, "It's empty.")};

//clock
Instruction[] instClockInfo = {new Instruction (false, "The clock hands remain stuck in place."), 
  new Instruction (false, "It's as if time is frozen.")};

//painting
Instruction[] instPaintingInfo = {new Instruction (false, "It's a painting of a girl."), 
  new Instruction (false, "She looks familiar.")};

//teddy bear
Instruction[] instBearInfo = {new Instruction (false, "There rests a teddy bear on the nightstand."), 
  new Instruction (false, "It's just as lifeless as the rest of the house..."), 
  new Instruction (true, "What happened to the owner...?")};

//painting2
Instruction[] instPainting2Info = {new Instruction (false, "It's a painting of a unicorn."), 
  new Instruction (false, "It frolicks across a rainbow.")};

//Instruction[] instStairInfo = {new Instruction (false, "A stair wobbles."), 
//  new Instruction (false, "You remove the stair and find a bloostained handkerchief.")};


//////////////// SETUP /////////////////////
//the game will be in full screen, with a black background
void setup() {

  fullScreen();
  //size(1368, 912, P3D);


  background(0);




  ////////////// MENU //////////////
  titleFont = loadFont("AmaticSC-Regular-150.vlw");
  instructionFont = loadFont("AmaticSC-Regular-48.vlw");



  //list of rooms available
  rooms = new Room[6];


  ////////////// ROOM 1 /////////////


  /////// ROOM 1 OBJECTS ///////
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



  //room1 code
  r1X = 0;
  r1Y =  height/2;
  r1W = width/4;
  r1H = height/2;
  r1Image = "images/room1bg.jpg";
  r1ImageDark = "images/testRoomDark.png";
  rooms[0] = new Room(r1X, r1Y, r1W, r1H, r1Image, new Object[] {box, chest, jar}, new int[] {1, 2, 3});
  roomIn = rooms[0];




  ///////////////// ROOM 2 ///////////////////


  /////// ROOM 2 OBJECTS //////////

  //clock object
  clockX = width/2 + width/11;
  clockY = height/2 + height/3.1;
  clockW = (width/height)*70;
  clockH = (width/height)*100;
  clockImage = "images/room2Clock.png";
  clockHighlight = "images/room2ClockHighlight.png";
  clockId = 4;
  clock = new Object(clockX, clockY, clockW, clockH, true, clockImage, clockHighlight, instClockInfo, clockId, rooms[1]);

  //painting object
  paintingX = width/2 - width/9;
  paintingY = height/2 + height/8;
  paintingW = (width/height)*400;
  paintingH = (width/height)*400;
  paintingImage = "images/room2Painting.png";
  paintingHighlight = "images/room2PaintingHighlight.png";
  paintingId = 5;
  painting = new Object(paintingX, paintingY, paintingW, paintingH, false, paintingImage, paintingHighlight, instPaintingInfo, paintingId, rooms[1]);


  ////stair object
  //stairX = width/2 + width/11;
  //stairY = height/2 + height/3.1;
  //stairW = (width/height)*70;
  //stairH = (width/height)*100;
  //stairImage = "images/room2stair.png";
  //stairHighlight = "images/room2stairHighlight.png";
  //stairId = 4;
  //stair = new Object(stairX, stairY, stairW, stairH, false, stairImage, stairHighlight, instStairInfo, stairId, rooms[1]);

  //room2 code
  r2X = r1W;
  r2Y = height/2;
  r2W = width/2.25;
  r2H = height/2;
  r2Image = "images/room2bg.jpg";
  rooms[1] = new Room(r2X, r2Y, r2W, r2H, r2Image, new Object[] {clock, painting}, new int[] {4, 5});

  ////////////////// ROOM 3 ///////////////////

  //room3 code
  r3X = 0;
  r3Y = 0;
  r3W = width/4 + width/10;
  r3H = height/2;
  r3Image = "images/room1bg.jpg";
  rooms[4] = new Room(r3X, r3Y, r3W, r3H, r3Image, new Object[] {}, new int[] {10, 11, 12});


  //////////////////// ROOM 4 //////////////////
  //room4 code
  r4X = width/4 + width/10;
  r4Y = 0;
  r4W = width/2.5;
  r4H = height/2;
  r4Image = "images/room1bg.jpg";
  rooms[3] = new Room(r4X, r4Y, r4W, r4H, r4Image, new Object[] {}, new int[] {7, 8, 9});


  /////////////////// ROOM 5 ////////////////////

  /////// ROOM 5 OBJECTS //////////////

  //bear object
  bearX = width - width/13;
  bearY = height/2 + height/3.5;
  bearW = (width/height)*70;
  bearH = (width/height)*100;
  bearImage = "images/room5Bear.png";
  bearHighlight = "images/room5BearHighlight.png";

  bearId = 8;
  bear = new Object(bearX, bearY, bearW, bearH, false, bearImage, bearHighlight, instBearInfo, bearId, rooms[2]);

  //painting object
  painting2X = width - width/7;
  painting2Y = height/2 + height/10;
  painting2W = (width/height)*300;
  painting2H = (width/height)*300;
  painting2Image = "images/room5Painting.png";
  painting2Highlight = "images/room5PaintingHighlight.png";

  painting2Id = 7;
  painting2 = new Object(painting2X, painting2Y, painting2W, painting2H, true, painting2Image, painting2Highlight, instPainting2Info, painting2Id, rooms[2]);


  //room5 code
  r5X = r2X + r2W;
  r5Y =  height/2;
  r5W = width/3.25;
  r5H = height/2;
  r5Image = "images/room5bg.jpg";
  rooms[2] = new Room(r5X, r5Y, r5W, r5H, r5Image, new Object[] {bear, painting2}, new int[] {7, 8});
  println("r5W = " +r5W + "r5H = " + r5H);

  /////////////////// ROOM 6 //////////////////

  //room6
  r6X = r4X + r4W;
  r6Y = 0;
  r6W = width/4;
  r6H = height/2;
  r6Image = "images/room1bg.jpg";
  rooms[5] = new Room(r6X, r6Y, r6W, r6H, r6Image, new Object[] {}, new int[] {});


  ////////////////// DOORS ////////////////////

  door0to1 = new Door(rooms[0], rooms[1], "vertical", true, instChestInfo);
  door1to2 = new Door(rooms[1], rooms[2], "vertical", true, instPaintingInfo);
  door1to3 = new Door(rooms[1], rooms[3], "horizontal", true, instPaintingInfo);


  //////////// SPRITE /////////////
  //sprite
  pX = 20;
  pY = height - 50;
  pW = (width/height)*45;
  pH = (width/height)*65;
  puppet = new Sprite(pX, pY, new Door[] {door0to1, door1to2});
}



//////////////// DRAW //////////////////////
//this draw function will be where all the code runs

void draw() {
  rectMode(CORNER);
  background(0); // black background


  //loop running all the display functions for every room
  for (int i = 0; i < rooms.length; i++) {
    if (roomIn == rooms[i]) {
      rooms[i].display();
    } else {
      rooms[i].darkDisplay();
    }
  }

  //displays for the doors
  door0to1.display();
  door0to1.update();

  door1to2.display();
  door1to2.update();

  door1to3.display();
  door1to3.update();


  //loop running the display for the text boxes
  for (int i = 0; i < rooms.length; i++) {
    if (roomIn == rooms[i]) {
      rooms[i].displayText();
    }
  }


  //if the textbox is not displayed, then the sprite is able to move around on the screen
  if (!textBoxOn) {
    puppet.update();
    puppet.display();
  }

  //gameBegin and gameInstructions display the title and instruction screens before the game begins
  gameBegin();
  gameInstructions();
}



//this keyPressed function is for toggling the text boxes when the sprite is on top of an
//interactable object
//it also removes the menus when they are displayed
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
}




//keyReleassed function for the sprite movement
void keyReleased() {
  puppet.keyReleased();
}


//When the mouse is clicked, the sprite will move from the room it's in to the other room on the screen;
//only for debugging purposes
//void mouseClicked() {
//  if (roomIn == rooms[0]) {
//    roomIn = rooms[1];
//  } else if (roomIn == rooms[1]) {
//    roomIn = rooms[2];
//  } else if (roomIn == rooms[2]) {
//    roomIn = rooms[3];
//  } else if (roomIn == rooms[3]) {
//    roomIn = rooms[0];
//  }
//}



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

//The screen after the title screen that explains the game play and any updates concerning the game
void gameInstructions() {
  if (spriteMoving == false && gameStart == false) {
    background(0, 0, 0, 5);
    fill(255);
    textFont(instructionFont);
    textAlign(CENTER);
    text("This is a beta version: only the first floor is available for gameplay. The player can move around within three rooms.\n The other rooms will be unlocked eventually.", width/2, height/4);
    text("You are in an abandoned house, left behind by your owner. You try to find a way out.\n Use the arrow keys to navigate the space, and press I on possible objects to interact with.\n\n Don't be afraid to interact with objects multiple times. You may discover new things along the way...\n \n \n \n Press any key to continue", width/2, height/2);
  }
}