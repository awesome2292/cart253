// Chomper
//
// A class defining the behaviour of a single Chomper
// which can move randomly in the window (within the grid),
// loses energy per move, and gains energy from overlapping
// with a Griddie.

class Chomper {
  // Limits for energy level and gains/losses
  int maxEnergy = 255;
  int moveEnergy = -1;
  int collideEnergy = 100;
  
  // Position, size, energy, and fill color
  int x;
  int y;
  int size;
  int energy;
  color fill = color(0,255,0);

  // Chomper(tempX, tempY, tempSize)
  //
  // Set up the Chomper with the specified location and size
  // Initialise energy to the maximum
  Chomper(int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    size = tempSize;
    energy = maxEnergy;
  }

  // update()
  //
  // Move the Chomper and update its energy levels
  void update() {
    
    // QUESTION: What is this if-statement for?
    //ANSWER: if the value of energy is 0, then return null and stop the function.
    if (energy == 0) {
      return;
    }
    
    // QUESTION: How does the Griddie movement updating work?
    // ANSWER: Each x and y value would be the size of the chopmer either doubled
    // negatively or positively
    int xMoveType = floor(random(-2,2));
    int yMoveType = floor(random(-2,2));
    x += size * xMoveType;
    y += size * yMoveType;
    
    // QUESTION: What are these if statements doing?
    // ANSWER: These if statements are verifying the position of the chompers to make sure they
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

    // Update the Chomper's energy
    // Note that moveEnergy is negative, so this _loses_ energy
    energy += moveEnergy;
    
    // Constrain the Chomper's energy level to be within the defined bounds
    energy = constrain(energy,0,maxEnergy);
  }

  // collide(griddie)
  //
  // Checks for collision with the Griddie
  // and updates energy level
  
  void collide(Griddie griddie) {
    // QUESTION: What is this if-statement for?
    // ANSWER: This if-statement verifies if the value of energy or new value (other) energy is 0 
    // to stop the if-statement and return null
    if (energy == 0 || griddie.energy == 0) {
      return;
    }
    
    // QUESTION: What does this if-statement check?
    // ANSWER: This statement verifies that the x and y coordinates of the chomper 
    // are equivalent to the x and y coordinates of the griddie value so that the 
    // energy of the chomper would increase with each encounter with a griddie
    if (x == griddie.x && y == griddie.y) {
      // Increase this Chomper's energy
      energy += collideEnergy;
      // Constrain the energy level to be within bounds
      energy = constrain(energy,0,maxEnergy);
    }
  }

  // display()
  //
  // Draw the Chomper on the screen as a rectangle
  void display() {
    // QUESTION: What does this fill line do?
    fill(fill, energy); 
    noStroke();
    rect(x, y, 0.5*size, 0.5*size);
  }
}