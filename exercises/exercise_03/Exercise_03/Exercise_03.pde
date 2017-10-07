color backgroundColor = color(200,150,150); //set the background color a soft red
Bouncer bouncer;
Bouncer bouncer2;
 //defined two bouncer variables from the Bouncer class
 
 //function that sets up the canvas with a size of 640x480 pixels and the red background
 //defined the two bouncer variables with defined parameters: the first bouncer will be red and will appear in the middle of the canvas, moving to the bottom right of the screen
 //the second bouncer will be blue, and will appear in the middle of the canvas and move towards the bottom left corner
void setup() {
  size(640,480);
  background(backgroundColor);
  bouncer = new Bouncer(width/2,height/2,2,2,50,color(150,0,0,50),color(255,0,0,50));
  bouncer2 = new Bouncer(width/2,height/2,-2,2,50,color(0,0,150,50),color(0,0,255,50));
}

//called the update and draw functions for the bouncers that allow them to move and bounce against the walls
void draw() {
  bouncer.update();
  bouncer2.update();
  bouncer.draw();
  bouncer2.draw();
}