//RAIN CLASS
//This Rain class forms a rain animation

public class Rain
{
  
  PVector position,pposition,speed;
  float col;
  
  public Rain()
  {//Changed the code so that the rain comes from the mouse cursor instead of the top of the screen
    position = new PVector(random(mouseX-20,mouseX+20),random(mouseY-20,mouseY+20));
    pposition = position;
    speed = new PVector(0,0);
    col = random(30,100);
  }
  
  void draw()
  {
    stroke(100,col);
    strokeWeight(2);
    line(position.x,position.y,pposition.x,pposition.y);
    //ellipse(position.x,position.y,5,5);
  }
  
  void calculate()
  {
    pposition = new PVector(position.x,position.y);
    gravity();

  }
  
  void gravity()
  {
    speed.y += .075;
    speed.x += .01;
    position.add(speed);
  }
}



//SPLASH CLASS
//Allows the fallen rain to form splashes at the bottom of the screen
public class Splash
{
  PVector position,speed;
  
  public Splash(float x,float y)
  {
    float angle = random(PI,TWO_PI);
    float distance = random(1,5);
    float xx = cos(angle)*distance;
    float yy = sin(angle)*distance;
    position = new PVector(x,y);
    speed = new PVector(xx,yy);
    
  }
  
  public void draw()
  {
    strokeWeight(1);
    stroke(100,50);
    fill(100,100);
    ellipse(position.x,position.y,2,2);
  }
  
  void calculate()
  {
    gravity();
     
    speed.x*=0.98;
    speed.y*=0.98;
           
    position.add(speed);
  }
  
  void gravity()
  {
    speed.y+=.2;
  }
  
}