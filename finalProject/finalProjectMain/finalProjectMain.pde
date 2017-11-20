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
float chestX;
float chestY;
float chestW;
float chestH;
String chestImage;
String chestHighlight;
boolean useObject;
boolean talkObject = false;

float boxX;
float boxY;
float boxW;
float boxH;
String boxImage;
String boxHighlight;
boolean textAppear = false;


//////////////// CLASSES ////////////////////
Room room1;
Room room2;

Sprite puppet;

Object chest;
Object box;

Textbox testText;





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
  r2X = 0;
  r2Y = 0;
  r2W = width/3;
  r2H = height/2;
  room2 = new Room(r2X, r2Y, r2W, r2H);

  //sprite
  pX = width/4;
  pY = 2*height/3;
  pW = 50;
  pH = 75;
  puppet = new Sprite(pX, pY, pW, pH);

  //chest object
  chestX = width/4.5;
  chestY = height-height/5;
  chestW = 200;
  chestH = 163;
  chestImage = "images/room1Chest.jpg";
  chestHighlight = "images/room1ChestHighlight.jpg";
  chest = new Object(chestX, chestY, chestW, chestH, true, chestImage, chestHighlight);

  //box object
  boxX = width/10;
  boxY = height-height/5;
  boxW = 200;
  boxH = 181;
  boxImage = "images/room1Box.jpg";
  boxHighlight = "images/room1BoxHighlight.jpg";
  box = new Object(boxX, boxY, boxW, boxH, true, boxImage, boxHighlight);

  testText = new Textbox();
  testText.setText("This is a test to see if I write a bunch of words whether or not it will go off the screen and continue into the endless abyss that is the processing canvas or if it will simply go to the next line as hoped -- It seems that is works!!!");
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

  testText.display();

  puppet.collide(room1);
  puppet.collide(room2);

  chest.highlight(puppet);
  box.highlight(puppet);
}


void keyPressed() {
  puppet.keyPressed();
}

void keyReleased() {
  puppet.keyReleased();
}