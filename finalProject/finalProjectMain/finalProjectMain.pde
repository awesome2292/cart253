//FINAL PROJECT
//INTERACTIVE PUZZLE GAME: SOLI
//Use the character to explore the abandoned house and discover the story of the family
//who lived in it, and eventually escape.

//This program will comprise of two main interactions: moving and interacting with objects
//CLASSES NEEDED: a ROOM class, an OBJECT class, and a DOOR class
//Any additionnal classes deemed needed will be added along the way
//Let's get started!


//////////////// VARIABLES ///////////////////
float r1X;
float r1Y;
float r1W;
float r1H;

float pX;
float pY;
float pW;
float pH;



//////////////// CLASSES ////////////////////
Room room1;


Sprite puppet;



//////////////// SETUP /////////////////////
//the game will be in full screen, with a black background
void setup(){
  fullScreen();
  //size(500,500);
  background(0);
  
  r1X = 0;
  r1Y =  height/2;
  r1W = width/3;
  r1H = height/2;
  room1 = new Room(r1X, r1Y, r1W, r1H);
  
  
  pX = width/4;
  pY = 2*height/3;
  pW = 50;
  pH = 75;
  puppet = new Sprite(pX, pY, pW, pH);
  
}



//////////////// DRAW //////////////////////
//this draw function will be where all the code runs

void draw(){
  rectMode(CORNER);
  background(0);
  room1.display();
  puppet.update();
  puppet.display();
  
  puppet.collide(room1);
}


void keyPressed(){
 puppet.keyPressed();
  
}

void keyReleased(){
 puppet.keyReleased(); 
  
}