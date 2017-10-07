
//this is a class defined in the main code that gives the bouncers their characteristics in the aninmation
class Bouncer {
//called the various parameters of the bouncer class, including location, size, and the gradient colors
 int x;
 int y;
 int vx;
 int vy;
 int size;
 color fillColor;
 color defaultColor;
 color hoverColor;
 
 //defining constructor with the variables previously mentioned: these parameters need to be defined in the program
 Bouncer(int tempX, int tempY, int tempVX, int tempVY, int tempSize, color tempDefaultColor, color tempHoverColor) {
   x = tempX;
   y = tempY;
   vx = tempVX;
   vy = tempVY;
   size = tempSize;
   defaultColor = tempDefaultColor;
   hoverColor = tempHoverColor;
   fillColor = defaultColor;
 }
 
 //this function allows the balls to move across the screen thanks to the velocity parameters
 void update() {
   x += vx;
   y += vy;
   
   handleBounce();
   handleMouse();
 }
 
 //if the ball hits a wall then it changes direction
 void handleBounce() {
   if (x - size/2 < 0 || x + size/2 > width) {
    vx = -vx; 
   }
   
   if (y - size/2 < 0 || y + size/2 > height) {
     vy = -vy;
   }
   
   x = constrain(x,size/2,width-size/2);
   y = constrain(y,size/2,height-size/2);
 }
 
 //if the mouse passes over either ball, then the color of the ball changes
 //else, the color remains the same
 void handleMouse() {
   if (dist(mouseX,mouseY,x,y) < size/2) {
    fillColor = hoverColor; 
   }
   else {
     fillColor = defaultColor;
   }
 }
 
 //this funcion puts the two balls in the canvas with their respective colors
 void draw() {
   noStroke();
   fill(fillColor);
   ellipse(x,y,size,size);
 }
}