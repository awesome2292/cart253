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
  float strokeColor = 50;

  Object talk;

  //////////////////////// CONSTRUCTOR //////////////////////

  // Takes the content of the text from the corresponding object
  Textbox() {
    talk = box;
  }



  ///////////////////// FUNCTIONS //////////////////////////

  // This function will set the text for this Typewriter to display
  void setText(String talk) {
    // Reset the currentText to be empty
    currentText = "";
    // Store the text to display
    textContent = talk;
  }


  // This display function should be called every frame. It displays the text at the
  // position given and at the size given, and updates the text
  // over time to display each character one at a time.
  void display() {
    // Make sure there's a text to display, and that the text box is visible
    //so that the typewriter doesn't run behind the scenes
    if (textContent != "" && textAppear) {
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
      //Check to see if the text should appear, in other words, whether the sprite has interacted with an object or not
      if (textAppear) {
       // textBoxOn = true;
        //If so then, display the textBox
        //Added a rectangle to hold the text.
        //It will most likely be replaced with an image later.
        rectMode(CENTER);
        fill(20);
        //stroke of the textBox holding the text
        strokeWeight(textStroke);
        stroke(strokeColor);
        rect(textBoxX, textBoxY, textBoxW, textBoxH, 7);
        // Set the size
        textSize(textSize);
        textFont(textFont);
        fill(255);
        // Display the current text at the position
        rectMode(CORNER);
        text(currentText, textX, textY, textBoxW-textStroke*3, textBoxH-textStroke*3);
      }
    } else if (!textAppear) {
      //textBoxOn = false;
      currentChar = 0;
      currentText = "";
    }
  }
}