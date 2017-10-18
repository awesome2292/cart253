//Score
//This class allows the scores to display on the screen based on size, location, etc...
//The score increases the more bricks the player hits

class Score {
  
  ///////// Properties ///////////
  int scoreNum = 0;
  String scoreText = Integer.toString(scoreNum);
  int scoreSize;
  int scoreX;
  int scoreY;
  int scoreWidth;
  int scoreHeight;
  color scoreColor;
  char score;
  PFont scoreFont = loadFont("LemonMilk-16.vlw");

  /////////////// Constructor ///////////////
  Score(int scoreSizeTemp, int scoreColorTemp, int scoreXTemp, int scoreYTemp, int scoreWidthTemp, int scoreHeightTemp) {
    scoreSize = scoreSizeTemp;
    scoreColor = scoreColorTemp;
    scoreX = scoreXTemp;
    scoreY = scoreYTemp;
    scoreWidth = scoreWidthTemp;
    scoreHeight = scoreHeightTemp;
  }


  /////////////// Methods ///////////////
  void update() {
    println(scoreText);
  }

//display the score on the screen
  void display() {
    rectMode(CENTER);
    fill(scoreColor);
    textFont(scoreFont);
    textSize(scoreSize);
    textAlign(CENTER);
    text(scoreText, scoreX, scoreY);
  }
}