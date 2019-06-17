boolean gameover= false, right = false, left = false, up = false, down = false, d = false, a = false, w = false, s = false;
int topscore=0;
int bottomscore=0;
float changespeed=0;
Paddle bottom;
Ball pongball;
Paddle top;
void setup()
{
  frameRate(120);
  noStroke();
  pongball= new Ball();
  bottom=new Paddle();
  top=new Paddle();
  top.y=10;
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
    createField();
    bottom.show();
    top.show2();

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
    changespeed=0;
    gameOverScreen();
    if (key == ' ')
    {
      top.x = 270;
      top.y = 10;
      bottom.x = 270;
      bottom.y = 780;
      pongball.reset();
      gameover=false;
    }
  }
}

void createField(){
  noFill();
  stroke(255);
  strokeWeight(14);
  rect(0,0,600,800);
  strokeWeight(1);
  noStroke();
  fill(200,20,200);
  rect(0,275,8,250);
  rect(593,275,8,250);
  fill(255,255,51);
  rect(0,350,8,100);
  rect(593,350,8,100);
}

void gameOverScreen(){
  textSize(18);
  fill(0,150,255);
  text("Blue Score: "+topscore, 50, 420);
  fill(255,0,0);
  text("Red Score: "+bottomscore, 400, 420);
  textSize(36);
  fill(200);
  text("Press SPACE to next round", 50, 380);
}
