boolean up = false, down = false, w = false, s = false;
Leftpaddle left;
Rightpaddle right;
Ball newball;
PImage playerleft;
PImage playerright;
PImage ball;

void keyPressed()
{
  if (keyCode == DOWN)
  {
    down = true;
  }
  if (keyCode == UP)
  {
    up = true;
  }
  if (key == 'w')
  {
    w=true;
  }
  if (key == 's' )
  {
    s=true;
  }
      }
    

void keyReleased()
{
  if (keyCode == DOWN)
  {
    down = false;
  }
  if (keyCode==UP)
  {
    up = false;
  }
  if (key=='w')
  {
    w=false;
  }
  if (key=='s')
  {
    s=false;
  }
}
void pong() {
  background(255);
  newball.move();
  newball.bounce();
  newball.show();
  println(newball.xpos,newball.ypos);
  

  left.show();
  right.show();
    if (up==true)
    {
      right.moveup();
    }
    if (down==true)
    {
      right.movedown();
    }
    if (w==true)
    {
      left.moveup();
    }
    if (s==true)
    {
      left.movedown();
    }
    if (newball.xpos<100) {
    newball.xpos = width/2;
    newball.ypos = int(random(0,500));
      
    }
    if (newball.xpos>width-100){
      newball.xpos = width/2;
    newball.ypos = int(random(0,500));
    }
}

class Ball {   

  float xpos= 350;
  float ypos= 350;  
  float xspeed = 1.3;
  float yspeed = 1.2;
  int xdirection = 1;
  int ydirection = 1;
  
  void move(){
  
     xpos = xpos + ( xspeed * xdirection );
     ypos = ypos + ( yspeed * ydirection );
     
  
     if (xpos > width - 165 || xpos < 165) {
       xdirection = xdirection * -1;
      }
      
     if (ypos > height-62 || ypos < 0) {
       ydirection = ydirection * -1;
      }
  }
  
   void show(){   
    fill(255);
    image(ball, xpos, ypos, 165, 62);
   }
    

  void bounce() {  

   if (xpos > 67 && xpos < 100 && ypos > left.y && ypos < left.y + 100){
      xdirection *= -1;
      
    }
    if (xpos+165 > 1180 && xpos+165 < 1247 && ypos > right.y && ypos < right.y + 100){
      xdirection *= -1;
      
    }
  }
  
}



class Leftpaddle {   
  int x,y;
  
  Leftpaddle(){
    y=400;
    x=67;
  }
  
  void show() {
  fill(255, 0, 0);
    image(playerleft, x, y, 33, 94);

  }
  
  void moveup() {
    if (y>0){
      y-=5;
    }
  }
    
  void movedown() {
    if (y<height-94){
      y+=5;
    }
  }
}
   
class Rightpaddle {   
  int y, x;
  Rightpaddle(){
    y=400;
    x=1180;
  }
  
  void show() {
  fill(255, 0, 0);
  image(playerright, x, y, 33, 94);
  }
  
  void moveup() {
    if (y>0){
      y-=5;
    }
  }
    
  void movedown() {
    if (y<height-94){
      y+=5;
    }
  }
} 
