class Score{
int scoreNum = 0;
String scoreText = Integer.toString(scoreNum);
int scoreSize;
int scoreX;
int scoreY;
int scoreWidth;
int scoreHeight;
color scoreColor;
char score;
  
  
Score(int scoreSizeTemp, int scoreColorTemp, int scoreXTemp, int scoreYTemp, int scoreWidthTemp, int scoreHeightTemp){
 scoreSize = scoreSizeTemp;
 scoreColor = scoreColorTemp;
 scoreX = scoreXTemp;
 scoreY = scoreYTemp;
 scoreWidth = scoreWidthTemp;
 scoreHeight = scoreHeightTemp;
  
}
  
  void update(){
      if(brickCollision == true){
        scoreNum += 10;
        println(scoreNum);
      }
  }
  
  
  void display(){
    rectMode(CENTER);
    fill(scoreColor);
    textSize(scoreSize);
    text(scoreText, scoreX, scoreY, scoreWidth, scoreHeight);
    
  }
}