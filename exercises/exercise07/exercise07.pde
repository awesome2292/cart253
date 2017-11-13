//SONG CODE WITH AESTHETIC RAIN
//This program creates a little song, with a rain animation pouring from the mouse cursor as the song plays

///////////////////// LIBRARIES ///////////////////////////
//import the necessary libraries (sound for the song, onpengl for the rain)
import processing.sound.*;
import processing.opengl.*;


////////////////////// MELODY VARIABLES //////////////////////
// Somewhere to store our 5 sound files
SoundFile[] tones = new SoundFile[5];

// The number of frames per beat of music
int framesPerBeat = 15;


///////////////////// OSCILLATOR VARIABLES ////////////////////
// The oscillators and their frequencies
SinOsc sin;
SinOsc sin2;

int[] frequency; //frequency for the baseline oscillator
int[] frequencyHigh;//frequency for the middle oscillator

//These integers verify that the previous tone won't be played again, to avoid extra long notes
int previousTone;
int previousToneHigh;


/////////////////// RAIN ANIMATION VARIABLES ///////////////////
int rainNum = 50;
ArrayList rain = new ArrayList();
ArrayList splash = new ArrayList();
float current;
float reseed = random(0, .2);






////////////////// SETUP //////////////////////////
void setup() {

  size(600, 600, P3D);// the P3D is to ensure that the vectors for the rain drops are displayed properly on screen
  colorMode(HSB, 100);// this allows the Blur() function to work
  background(0);
  rain.add(new Rain());// this brings rain into the canvas by creating a new object
  current = millis();

  // Define the frequency array by giving each value it's own frequency to match the melody
  frequency = new int[4];
  frequency[0] = 123;
  frequency[1] = 146;
  frequency[2] = 196;
  frequency[3] = 220;

  // Define the second frequency array by multiplying the value of the first array by 2
  // Physics allows us to know that a doubled frequency is a harmony of the original :)
  frequencyHigh = new int[4];
  //use a for loop to properly multiply each value in the array by 2
  for (int i = 0; i < frequencyHigh.length; i++) {
    frequencyHigh[i] = frequency[i]*2;
  }

  // Go through the array loading sound files into it
  for (int i = 0; i < tones.length; i++) {
    // We can use the i variable to work out which filename to use!
    tones[i] = new SoundFile(this, "sounds/tone0" + (i+1) + ".wav");
  }

  // Define the oscillators and allow them to play properly
  sin = new SinOsc(this);
  sin.play();
  sin2 = new SinOsc(this);
  sin2.play();
}





////////////////////// DRAW FUNCTION ////////////////////////
void draw() {
  /////////////////////////////// TONES CODE ///////////////////////////////////
  // Use modulo to check if this frame is a multiple of the beat count
  if (frameCount % framesPerBeat == 0) {
    // Pick a random index in the array
    int randomIndex = floor(random(0, tones.length));
    // Bonus! Set the pan of the sound based on the mouse!
    // -1 means full left, 1 means full right
    tones[randomIndex].pan(map(mouseX, 0, width, -1, 1));
    // Bonus! Set the amplitude of the sound based on the mouse!
    tones[randomIndex].amp(map(mouseY, 0, height, 1, 0));
    // Play the sound
    tones[randomIndex].play();
  }

  /////////////////////////////// SIN1 CODE ////////////////////////////////////// 
  //This if statement determines how the oscillator will change notes and at which time
  //The beat for these notes is longer, but since it is a multiple of 15, it will still remain within tempo
  if (frameCount % (framesPerBeat*8) == 0) {
    //introduce a random function so the oscillator will play any note randomly between values 0 and 3
    int rand = floor(random(0, 4));
    //This while function makes sure that the same note will not play twice in a row
    while (rand == previousTone) {
      rand = floor(random(0, 4));
    }
    //Now change the frequency of the value randomly chosen earlier
    sin.freq(frequency[rand]);
    previousTone = rand;
  }

  /////////////////////////////// SIN2 CODE ////////////////////////////////////////
  //Same code as the previous oscillator but with different notes and beats
  //Play each note as a quarter note
  if (frameCount % (framesPerBeat*4) == 0) {
    int rand2 = floor(random(0, 4));

    while (rand2 == previousToneHigh) {
      rand2 = floor(random(0, 4));
    }

    sin2.freq(frequencyHigh[rand2]);
    previousToneHigh = rand2;
  }


  /////////////////////////////// ADDED RAIN CODE //////////////////////////////////////
  //The Rain animation falls from the mouse cursor and follows it throughout the screen
  //This code was pulled from the url, and has many elements that I don't understand, so
  //Adding detailed comments to this code is quite challenging
  //If you wish to see the original code, here is the link: https://www.openprocessing.org/sketch/9299#
  
  
  //This sets the blurring of the rain as it falls to a specific value
  blur(50);


  if ((millis()-current)/1000>reseed&&rain.size()<150)
  {
    //Create new rain objects
    rain.add(new Rain());
    float reseed = random(0, .2);
    current = millis();
  }

  for (int i=0; i<rain.size(); i++)
  {
  
    Rain rainT = (Rain) rain.get(i);
    rainT.calculate();
    rainT.draw();
    if (rainT.position.y>height)
    {

      for (int k = 0; k<random(5, 10); k++)
      {
        splash.add(new Splash(rainT.position.x, height));
      }

      rain.remove(i);
      float rand = random(0, 100);
      if (rand>10&&rain.size()<150)
        rain.add(new Rain());
    }
  }

//This allows the splashes to land at the bottom of the screen
  for (int i=0; i<splash.size(); i++)
  {
    Splash spl = (Splash) splash.get(i);
    spl.calculate();
    spl.draw();
    if (spl.position.y>height)
      splash.remove(i);
  }
}

//Blur function
void blur(float trans)
{
  noStroke();
  fill(0, trans);
  rect(0, 0, width, height);
}