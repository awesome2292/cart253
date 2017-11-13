import processing.sound.*;

// Somewhere to store our 5 sound files
SoundFile[] tones = new SoundFile[5];
// The number of frames per beat of music
int framesPerBeat = 15;

void setup() {
  // Go through the array loading sound files into it
  for (int i = 0; i < tones.length; i++) {
    // We can use the i variable to work out which filename to use!
    tones[i] = new SoundFile(this, "sounds/tone0" + (i+1) + ".wav");
  }
}

void draw() {
  // Use modulo to check if this frame is a multiple of the beat count
  if (frameCount % framesPerBeat == 0) {
    // Pick a random index in the array
    int randomIndex = floor(random(0, tones.length));
    // Bonus! Set the pan of the sound based on the mouse!
    // -1 means full left, 1 means full right
    tones[randomIndex].pan(map(mouseX,0,width,-1,1));
    // Bonus! Set the amplitude of the sound based on the mouse!
    tones[randomIndex].amp(map(mouseY,0,height,1,0));
    // Play the sound
    tones[randomIndex].play();
  }
}