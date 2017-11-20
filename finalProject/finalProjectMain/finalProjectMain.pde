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
float r1X;
float r1Y;
float r1W;
float r1H;

float r2X;
float r2Y;
float r2W;
float r2H;

//Sprite Variables
float pX;
float pY;
float pW;
float pH;

//Object Variables

//Room 1 Objects
//chest
float chestX;
float chestY;
float chestW;
float chestH;
String chestImage;
String chestHighlight;
boolean useObject;
String chestInfo;
boolean talkObject = false;

//carboard box
float boxX;
float boxY;
float boxW;
float boxH;
String boxImage;
String boxHighlight;
String boxInfo;
boolean textAppear = false;


//////////////// CLASSES ////////////////////
Room room1;
Room room2;

Sprite puppet;

Object chest;
Object box;

//Textbox boxText;
//Textbox chestText;





//////////////// SETUP /////////////////////
//the game will be in full screen, with a black background
void setup() {
  fullScreen();
  //size(500,500);
  background(0);

  //room1
  r1X = 0;
  r1Y =  height/2;
  r1W = width/3;
  r1H = height/2;
  room1 = new Room(r1X, r1Y, r1W, r1H);

  //room2
  r2X = r1W;
  r2Y = height/2;
  r2W = width/3;
  r2H = height/2;
  room2 = new Room(r2X, r2Y, r2W, r2H);

  //sprite
  //pX = width/4;
  //pY = 2*height/3;
  pX = 50;
  pY = height-50;
  pW = (width/height)*25;
  pH = (width/height)*35;
  puppet = new Sprite(pX, pY, pW, pH);

  //chest object
  chestX = width/4.5;
  chestY = height-height/5;
  chestW = (width/height)*100;
  chestH = (width/height)*70;
  chestImage = "images/room1Chest.jpg";
  chestHighlight = "images/room1ChestHighlight.jpg";
  chestInfo = "This chest is locked.";
  chest = new Object(chestX, chestY, chestW, chestH, true, chestImage, chestHighlight, chestInfo);

  //box object
  boxX = width/10;
  boxY = height-height/5;
  boxW = (width/height)*100;
  boxH = (width/height)*80;
  boxImage = "images/room1Box.jpg";
  boxHighlight = "images/room1BoxHighlight.jpg";
  boxInfo = "This is a carboard box.";
  box = new Object(boxX, boxY, boxW, boxH, true, boxImage, boxHighlight, boxInfo);

 /* boxText = new Textbox();
  boxText.setText(box);

  chestText = new Textbox();
  chestText.setText(chest);*/
}



//////////////// DRAW //////////////////////
//this draw function will be where all the code runs

void draw() {
  rectMode(CORNER);
  background(0);
  room1.display();
  room2.display();

  chest.display();
  box.display();

  puppet.update();
  puppet.display();

 // boxText.display();
  //chestText.display();

  //puppet.collide(room1);
  //puppet.collide(room2);

  chest.highlight(puppet);
  box.highlight(puppet);
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
  if (puppet.roomIn == room1) {
    puppet.roomIn = room2;
  } else if (puppet.roomIn == room2) {
    puppet.roomIn = room1;
  }
}