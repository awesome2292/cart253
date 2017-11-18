//TEXTBOX CLASS
//This class is responsible for the textboxes that appear when the character interacts
//with objects and doors in the game
//There are two kinds of textboxes: pure text and yes and no questions
//The parameters will be the type of textbox and the words that go inside it
//position, size and color will be fixed, so they do not need to be included in the 
//arguments

class Textbox {

  ///////////////// VARABIABLES //////////////////
  // The whole text to display
  String textContent = "";
  // The current text being displayed
  String currentText = "";
  // The character to display next in the text
  int currentChar = 0;
  // How many frames between characters displayed
  float framesPerChar = 0.25;
  

  // Position and size
  float textBoxX = width/2;
  float textBoxY = height - height/4.5;
  float textBoxW = width-150;
  float textBoxH = height/3;
  int textStroke = 30;
  float textX = textBoxX - textBoxW/2 + textStroke*2;
  float textY = textBoxY - textBoxH/2 + textStroke*3;
  int textSize = 40;
  PFont textFont = loadFont("AmaticSC-Bold-60.vlw");
  
  //Boolean determining if the textbox should appear or not
  boolean textAppear;

  //////////////////////// CONSTRUCTOR //////////////////////

  // Takes the position of the text, the size of the text, and the
  // number of frames between characters displaying




  ///////////////////// FUNCTIONS //////////////////////////

  // This function will set the text for this Typewriter to display
  void setText(String tempText) {
    // Reset the currentText to be empty
    currentText = "";
    // Store the text to display
    textContent = tempText;
  }


  // This display function should be called every frame. It displays the text at the
  // position given and at the size given, and updates the text
  // over time to display each character one at a time.
  void display() {
    // Make sure there's a text to display
    if (textContent != "") {
      // Check if this frame is a multiple of our frame rate
      if (frameCount % framesPerChar == 0) {
        // Check whether there are more characters to display
        if (currentChar < textContent.length()) {
          // Add the next character to our display String
          currentText += textContent.charAt(currentChar);
          // Increase the character index
          currentChar++;
        }
      }
      //Added a rectangle to hold the text.
      //It will most likely be replaced with an image later.
      if (textAppear){
      rectMode(CENTER);
      fill(20);
      strokeWeight(textStroke);
      rect(textBoxX, textBoxY, textBoxW, textBoxH, 7);
      // Set the size
      textSize(textSize);
      textFont(textFont);
      fill(255);
      // Display the current text at the position
      rectMode(CORNER);
      text(currentText, textX, textY, textBoxW-textStroke*3, textBoxH-textStroke*3);
      }
    }
  }
}