

// Exercise 06
//
// Using the webcam as input to play with Bouncers.

// Import the video library
import processing.video.*;

// The capture object for reading from the webcam
Capture video;


// setup()
//
// Creates the bouncers and starts the webcam

void setup() {
  size(640, 480);

  
  // Start up the webcam
  video = new Capture(this, 640, 480, 30);
  video.start();
}

//An event for when a new frame is available
void captureEvent (Capture video){
 //Read the image from the camera.
  video.read();
}
  

// draw()
//
// processes the video while adding the magic wand mouse effect: The video runs normally but is too dark
//the only area where you can see the video is where the mouse is on the canvas
//the video has a glitch effect
void draw() {
  loadPixels();
  video.loadPixels();

  // Draw the video frame to the screen
  image(video, 0, 0);
  
//scans the canvas from point zero to the end point of the video
//from the top left corner to the bottom right corner
for (int x = 0; x < video.width; x++) {    
    for (int y = 0; y < video.height; y++) {      
      // Calculate the 1D location from a 2D grid
      int loc = x + y * video.width;  
      // Get the red, green, blue values from a pixel      
      float redColor = red (video.pixels[loc]);      
      float greenColor = green(video.pixels[loc]);      
      float blueColor = blue (video.pixels[loc]);      
      
      // Calculate an amount to change brightness based on proximity to the mouse      
      float d = dist(x, y, mouseX, mouseY);      
      float adjustbrightness = map(d, 0, 100, 4, 0);      
      redColor *= adjustbrightness;      
      greenColor *= adjustbrightness;      
      blueColor *= adjustbrightness;      
      
      // Constrain RGB to make sure they are within 0-255 color range      
      redColor = constrain(redColor, 0, 255);      
      greenColor = constrain(greenColor, 0, 255);      
      blueColor = constrain(blueColor, 0, 255);      
    
      // Make a new color and set pixel in the window      
      color c = color(redColor, greenColor, blueColor);      
      pixels[loc] = c;    
    }  
  }  
  
  updatePixels();
}