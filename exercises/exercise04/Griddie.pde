// Griddie
//
// A class defining the behaviour of a single Griddie
// which can move randomly in the window (within the grid),
// loses energy per move, and gains energy from overlapping
// with another Griddie.

class Griddie {
  // Limits for energy level and gains/losses
  int maxEnergy = 255;
  int moveEnergy = -1;
  int collideEnergy = 10;
  
  // Position, size, energy, and fill color
  int x;
  int y;
  int size;
  int energy;
  color fill = color(255,0,0);

  // Griddie(tempX, tempY, tempSize)
  //
  // Set up the Griddie with the specified location and size
  // Initialise energy to the maximum
  Griddie(int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    size = tempSize;
    energy = maxEnergy;
  }

  // update()
  //
  // Move the Griddie and update its energy levels
  void update() {
    
    // QUESTION: What is this if-statement for?
    //ANSWER: if the value of energy is 0, then return nothing.
    if (energy == 0) {
      return;
    }
    
    // QUESTION: How does the Griddie movement updating work?
    // ANSWER: Each x and y value would be the size of the griddie either doubled
    // or turned positive to negative or negative to positive
    int xMoveType = floor(random(-1,2));
    int yMoveType = floor(random(-1,2));
    x += size * xMoveType;
    y += size * yMoveType;
    
    // QUESTION: What are these if statements doing?
    // ANSWER: These if statements are verifying the position of the griddies to make sure they
    // don't go off the screen. 
    if (x < 0) {
      x += width;
    }
    else if (x >= width) {
      x -= width;
    }
    if (y < 0) {
      y += height;
    }
    else if (y >= height) {
      y -= height;
    }

    // Update the Griddie's energy
    // Note that moveEnergy is negative, so this _loses_ energy
    energy += moveEnergy;
    
    // Constrain the Griddies energy level to be within the defined bounds
    energy = constrain(energy,0,maxEnergy);
  }

  // collide(other)
  //
  // Checks for collision with the other Griddie
  // and updates energy level
  
  void collide(Griddie other) {
    // QUESTION: What is this if-statement for?
    // ANSWER: This if-statement verifies if the value of energy or new value (other) energy is 0 
    // to stop the if-statement and return null
    if (energy == 0 || other.energy == 0) {
      return;
    }
    
    // QUESTION: What does this if-statement check?
    // ANSWER: This statement verifies that the x and y coordinates of the griddie 
    // are equivalent to the x and y coordinates of the "other" value so that the 
    // energy of the griddie would increase with each encounter with another
    if (x == other.x && y == other.y) {
      // Increase this Griddie's energy
      energy += collideEnergy;
      // Constrain the energy level to be within bounds
      energy = constrain(energy,0,maxEnergy);
    }
  }
  
    // collide(chomper)
  //
  // Checks for collision with the Griddie
  // and updates energy level
  
  void collide(Chomper chomper) {
    // QUESTION: What is this if-statement for?
    // ANSWER: This if-statement verifies if the value of energy or new value (other) energy is 0 
    // to stop the function and return null
    if (energy == 0 || chomper.energy == 0) {
      return;
    }
    
    // QUESTION: What does this if-statement check?
    // ANSWER: This statement verifies that the x and y coordinates of the griddie 
    // are equivalent to the x and y coordinates of the "other" value so that the 
    // energy of the griddie would increase with each encounter with another
    if (x == chomper.x && y == chomper.y) {
      // Decrease this Griddie's energy
      energy -= chomper.collideEnergy;
      // Constrain the energy level to be within bounds
      energy = constrain(energy,0,maxEnergy);
    }
  }

  // display()
  //
  // Draw the Griddie on the screen as a rectangle
  void display() {
    // QUESTION: What does this fill line do?
    fill(fill, energy); 
    noStroke();
    rect(x, y, size, size);
  }
}