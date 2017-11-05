

// Exercise 06
//
// Using the webcam as input to play with Bouncers.

// Import the video library
import processing.video.*;

// The capture object for reading from the webcam
Capture video;

// A PVector allows us to store an x and y location in a single object
// When we create it we give it the starting x and y (which I'm setting to -1, -1
// as a default value)
PVector brightestPixel = new PVector(-1,-1);


// setup()
//
// Creates the bouncers and starts the webcam

void setup() {
  size(640, 480);

  
  // Start up the webcam
  video = new Capture(this, 640, 480, 30);
  video.start();
}

// draw()
//
// Processes the frame of video, draws the video to the screen, updates the Bouncers
// and then just draws an ellipse at the brightest pixel location. You code should
// do something much more interesting in order to actually interact with the Bouncers.

void draw() {
  // A function that processes the current frame of video
  handleVideoInput();

  // Draw the video frame to the screen
  image(video, 0, 0);
  
  
  // For now we just draw a crappy ellipse at the brightest pixel
  fill(#ff0000);
  stroke(#ffff00);
  strokeWeight(10);
  ellipse(brightestPixel.x,brightestPixel.y,20,20);
}

// handleVideoInput
//
// Checks for available video, reads the frame, and then finds the brightest pixel
// in that frame and stores its location in brightestPixel.

void handleVideoInput() {
  // Check if there's a frame to look at
  if (!video.available()) {
    // If not, then just return, nothing to do
    return;
  }
  
  // If we're here, there IS a frame to look at so read it in
  video.read();

  // Start with a very low "record" for the brightest pixel
  // so that we'll definitely find something better
  float brightnessRecord = 0;

  // Go through every pixel in the grid of pixels made by this
  // frame of video
 int reddestX = 0;
int reddestY = 0;
float record = 1000;
for ( int x = 1; x < video.width; x++ ) {
  for ( int y = 0; y < video.height; y++ ) {
    int loc = x + y * width;
    color pixelColor = video.pixels[loc];
    float amount = dist(255,0,0,red(pixelColor),green(pixelColor),blue(pixelColor));
    if (amount < record) {
      record = amount;
      reddestX = x;
      reddestY = y;
    }
  }
}
fill(255,0,0);
image(video,0,0);
ellipse(reddestX,reddestY,10,10);
}