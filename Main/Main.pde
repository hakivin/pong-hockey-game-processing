boolean gameover= false, right = false, left = false, up = false, down = false, d = false, a = false, w = false, s = false;
int topscore=0;
int bottomscore=0;
float changespeed=0;
Paddle bottom;
Ball pongball;
Paddle top;
void setup()
{
  frameRate(100);
  noStroke();
  pongball= new Ball();
  bottom=new Paddle();
  top=new Paddle();
  top.y=5;
  size(600, 800);
  
}
void keyPressed()
{
  if (keyCode == LEFT)
  {
    left = true;
  }
  if (keyCode == RIGHT)
  {
    right = true;
  }
  if (keyCode == UP)
  {
    up = true;
  }
  if (keyCode == DOWN)
  {
    down = true;
  }
  if (key == 'a')
  {
    a=true;
  }
  if (key == 'd' )
  {
    d=true;
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
  if (keyCode == LEFT)
  {
    left = false;
  }
  if (keyCode==RIGHT)
  {
    right = false;
  }
  if (keyCode == UP)
  {
    up = false;
  }
  if (keyCode == DOWN)
  {
    down = false;
  }
  if (key=='a')
  {
    a=false;
  }
  if (key=='d')
  {
    d=false;
  }
  if (key == 'w')
  {
    w=false;
  }
  if (key == 's' )
  {
    s=false;
  }
}
void draw()
{
  if (gameover==false)
  {
    background(0);
    
    noFill();
    stroke(255);
    strokeWeight(9);
    rect(0,0,600,800);
    strokeWeight(1);
    noStroke();
    bottom.show();
    top.show2();
    fill(200,20,200);
    rect(0,250,8,300);
    rect(593,250,8,300);
    fill(255,255,51);
    rect(0,350,8,100);
    rect(593,350,8,100);
    if (left==true)
    {
      bottom.moveleft();
    }
    if (right==true)
    {
      bottom.moveright();
    }
    if (up==true)
    {
      bottom.moveup();
    }
    if (down==true)
    {
      bottom.movedown();
    }
    if (a==true)
    {
      top.moveleft();
    }
    if (d==true)
    {
      top.moveright();
    }
    if (w==true)
    {
      top.moveup();
    }
    if (s==true)
    {
      top.movedown();
    }
    pongball.move();
    pongball.bounce();
    pongball.show();
    if (get(int(pongball.x), int(pongball.y)-16)==color(0,255,0))
    {
      gameover=true;
      bottomscore++;
    }
    if (get(int(pongball.x), int(pongball.y)+15)==color(0,255,0))
    {
      gameover=true;
      topscore++;
    }
  }
  else //gameover==true
  {
    background(0);
    fill(255, 0, 0);
    changespeed=0;
    textSize(18);
    text("Blue Score: "+topscore, 35, 330);
    text("Red Score: "+bottomscore, 35, 370);
    textSize(36);
    text("Game over! Click to restart.", 35, 280);
    if (mousePressed==true)
    {
      pongball.x=int(random(100, 500));
      pongball.y=300;
      int xdirection=int(random(2));
      int ydirection=int(random(2));
      top.x = 270;
      top.y = 5;
      bottom.x = 270;
      bottom.y = 785;
      if (xdirection==0)
      {
        pongball.r=true;
      }
      else //xidrection==1
      {
        pongball.r=false;
      }
      if (ydirection==0)
      {
        pongball.u=true;
      }
      else //ydirection==1
      {
        pongball.u=false;
      }
      gameover=false;
    }
  }
}
