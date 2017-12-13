import processing.sound.*;
SoundFile tone;
void setup() {
  tone = new SoundFile(this, "sounds/tone01.wav");
}
void draw() {
}
void mouseClicked() {
  // All the same except that instead of play() we use loop()
  // Which makes sense.
  tone.loop();
}