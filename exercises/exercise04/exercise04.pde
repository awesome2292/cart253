// Griddies
// by Pippin Barr
// MODIFIED BY: 
//
// A simple artificial life system on a grid. The "griddies" and "chompers" are squares that move
// around randomly, using energy to do so. They gain energy by overlapping with
// other griddies. If a griddie or chomper loses all its energy it dies. Who will survive?

// The size of a single grid element
int gridSize = 20;
// An array storing all the griddies
Griddie[] griddies = new Griddie[100];
Chomper[] chompers = new Chomper[100];

// setup()
//
// Set up the window and the griddies

void setup() {
  // Set up the window size and framerate (lower so we can watch easier)
  size(640, 480);
  frameRate(10);

  // QUESTION: What does this for loop do?
  // ANSWER: This for-loop creates i number of griddies and c number of chompers on the canvas starting anywhere on the canvas randomly
  for (int i = 0, c = 0; i < griddies.length && c <chompers.length; i++, c++) {
    int x = floor(random(0, width/gridSize));
    int y = floor(random(0, height/gridSize));
    griddies[i] = new Griddie(x * gridSize, y * gridSize, gridSize);
    chompers[c] = new Chomper(x * gridSize, y * gridSize, gridSize);
  }
}

// draw()
//
// Update all the griddies and chompers, check for collisions between them, display them.

void draw() {
  background(50);

  // We need to loop through all the griddies and chompers one by one
  for (int i = 0, c = 0; i < griddies.length && c < chompers.length; i++, c++) {

    // Update the griddies and chompers
    griddies[i].update();
    chompers[c].update();

    // Now go through all the griddies and chompers a second time...
    for (int j = 0; j < griddies.length; j++) {
      // QUESTION: What is this if-statement for?
      // ANSWER: This is verifying that in all cases where j does not have an equivalent value to i
      if (j != i) {
        // QUESTION: What does this line check?
        //ANSWER: If the previous statement was true, then this line triggers the collide function for i number of griddies against j number of griddies. 
        griddies[i].collide(griddies[j]);
      }
      if (c != i) {
        // QUESTION: What does this line check?
        //ANSWER: If the previous statement was true, then this line triggers the collide function for c number of chompers against j number of griddies. 
        chompers[c].collide(griddies[j]);
      }
    }

    // Display the griddies and chopmers
    griddies[i].display();
    chompers[i].display();
  }
}