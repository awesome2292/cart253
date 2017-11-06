
// Exercise 06
//Light up your webcam! Use the mouse to move the torch around the screen. 
//To increase the size of the light, click the mouse.
//To decrease the size of the light, press the spacebar.

// Import the video library
import processing.video.*;

// The capture object for reading from the webcam
Capture video;

//This is the parameter that controls the size of the ball of light.
float increaseBrightness = 100;

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
void captureEvent (Capture video) {
  //Read the image from the camera.
  video.read();
}


// draw()
//
// Processes the video while adding the magic wand mouse effect: The video runs normally but is too dark
//the only area where you can see the video is where the mouse is on the canvas
//the video has a glitch effect
void draw() {
  loadPixels();
  video.loadPixels();

  // Draw the video frame to the screen
  image(video, 0, 0);

  //Scans the canvas from point zero to the end point of the video
  //from the top left corner to the bottom right corner
  for (int x = 0; x < video.width; x++) {    
    for (int y = 0; y < video.height; y++) {      
      // Convert the matrices of the x-y coordinates into one value
      int location = x + y * video.width;  
      // Get the red, green, blue values from a pixel      
      float redColor = red (video.pixels[location]);      
      float greenColor = green(video.pixels[location]);      
      float blueColor = blue (video.pixels[location]);      

      // Calculate an amount to change brightness based on proximity to the mouse      
      float mouseLocation = dist(x, y, mouseX, mouseY);      
      float adjustbrightness = map(mouseLocation, 0, increaseBrightness, 4, 0);      
      redColor *= adjustbrightness;      
      greenColor *= adjustbrightness;      
      blueColor *= adjustbrightness;      

      // Constrain RGB to make sure they are within 0-255 color range      
      redColor = constrain(redColor, 0, 255);      
      greenColor = constrain(greenColor, 0, 255);      
      blueColor = constrain(blueColor, 0, 255);      

      // Make a new color and set pixel in the window      
      color brightColor = color(redColor, greenColor, blueColor);      
      pixels[location] = brightColor;
    }
  }  

  updatePixels();
}


//if the mouse is clicked, then increase the size of the ball of light
void mouseClicked(){
  increaseBrightness *=1.25; 
}

//if the spacebar is pressed, the decrease the size of the ball of light
void keyPressed(){
  if (key == ' '){
   increaseBrightness *=0.5; 
  }
}