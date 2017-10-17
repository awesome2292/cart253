class Score {
  int scoreNum = 0;
  String scoreText = Integer.toString(scoreNum);
  int scoreSize;
  int scoreX;
  int scoreY;
  int scoreWidth;
  int scoreHeight;
  color scoreColor;
  char score;


  Score(int scoreSizeTemp, int scoreColorTemp, int scoreXTemp, int scoreYTemp, int scoreWidthTemp,int scoreHeightTemp) {
    scoreSize = scoreSizeTemp;
    scoreColor = scoreColorTemp;
    scoreX = scoreXTemp;
    scoreY = scoreYTemp;
    scoreWidth = scoreWidthTemp;
    scoreHeight = scoreHeightTemp;
  }

  void update() {
    println(scoreText);
  }


  void display() {
    rectMode(CENTER);
    fill(scoreColor);
    PFont scoreFont = loadFont("LemonMilk-16.vlw");
    textFont(scoreFont);
    textSize(scoreSize);
    textAlign(LEFT);
    text(scoreText, scoreX, scoreY);
  }
}