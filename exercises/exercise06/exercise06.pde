

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
  
 

// handleVideoInput
//
// Checks for available video, reads the frame, and then finds the brightest pixel
// in that frame and stores its location in brightestPixel.

  // If we're here, there IS a frame to look at so read it in
  video.read();


}

void handleVideoInput() {
  // Check if there's a frame to look at
  if (!video.available()) {
    // If not, then just return, nothing to do
    return;
  }
}