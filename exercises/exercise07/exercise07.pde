//SONG CODE WITH AESTHETIC RAIN
//This program creates a little song, with a rain animation pouring from the mouse cursor as the song plays


//import the necessary libraries (sound for the song, onpengl for the rain)
import processing.sound.*;
import processing.opengl.*;

// Somewhere to store our 5 sound files
SoundFile[] tones = new SoundFile[5];

// The number of frames per beat of music
int framesPerBeat = 15;

SinOsc sin;
SinOsc sin2;
int[] frequency;
int[] frequencyHigh;
int previousTone;
int previousToneHigh;

int rainNum = 50;
ArrayList rain = new ArrayList();
ArrayList splash = new ArrayList();
float current;
float reseed = random(0,.2);

void setup() {
   size(600,600,P3D);
  colorMode(HSB,100);
  background(0);
  rain.add(new Rain());
  current = millis();
  
frequency = new int[4];
frequency[0] = 123;
frequency[1] = 146;
frequency[2] = 196;
frequency[3] = 220;

frequencyHigh = new int[4];
for(int i = 0; i < frequencyHigh.length; i++){
frequencyHigh[i] = frequency[i]*2;
}
  
  // Go through the array loading sound files into it
  for (int i = 0; i < tones.length; i++) {
    // We can use the i variable to work out which filename to use!
    tones[i] = new SoundFile(this, "sounds/tone0" + (i+1) + ".wav");
  }
  
  sin = new SinOsc(this);
  sin.play();
  sin2 = new SinOsc(this);
  sin2.play();
}

void draw() {
  /////////////////////////////// TONES CODE ///////////////////////////////////
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
  
/////////////////////////////// SIN1 CODE //////////////////////////////////////  
 if(frameCount % (framesPerBeat*8) == 0){
   int rand = floor(random(0,4));
   
   while(rand == previousTone){
     rand = floor(random(0,4));
   }
   
  sin.freq(frequency[rand]);
  previousTone = rand;
 }
 
 /////////////////////////////// SIN2 CODE ////////////////////////////////////////
 if(frameCount % (framesPerBeat*4) == 0){
   int rand2 = floor(random(0,4));
   
   while(rand2 == previousToneHigh){
     rand2 = floor(random(0,4));
   }
   
  sin.freq(frequencyHigh[rand2]);
  previousToneHigh = rand2;
 }
 
 
/////////////////////////////// ADDED RAIN CODE //////////////////////////////////////
  blur(50);
  
  if ((millis()-current)/1000>reseed&&rain.size()<150)
  {
    rain.add(new Rain());
    float reseed = random(0,.2);
    current = millis();
  }
  
  for (int i=0 ; i<rain.size() ; i++)
  {
    Rain rainT = (Rain) rain.get(i);
    rainT.calculate();
    rainT.draw();
    if (rainT.position.y>height)
    {
      
      for (int k = 0 ; k<random(5,10) ; k++)
      {
        splash.add(new Splash(rainT.position.x,height));
      }
      
      rain.remove(i);
      float rand = random(0,100);
      if (rand>10&&rain.size()<150)
      rain.add(new Rain());
    }
  }
  
  
  for (int i=0 ; i<splash.size() ; i++)
  {
    Splash spl = (Splash) splash.get(i);
    spl.calculate();
    spl.draw();
    if (spl.position.y>height)
    splash.remove(i);
  }

}

void blur(float trans)
{
  noStroke();
  fill(0,trans);
  rect(0,0,width,height);
}