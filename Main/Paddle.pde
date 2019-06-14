class Paddle
{
  int x, y;
  Paddle()
  {
    x=270;
    y=780;
  }
  void show()
  {
    fill(255, 0, 0);
    rect(x, y, 60, 10);
    fill(0,255,0);
    rect(200,0,200,8);
  }
  void show2(){
    fill(0, 150, 255);
    rect(x, y, 60, 10);
    fill(0,255,0);
    rect(200,793,200,8);
  }
  void moveleft()
  {
    if (x>=10)
    {
      x-=2;
    }
  }
  void moveright()
  {
    if (x<=530)
    {
      x+=2;
    }
  }
  void moveup()
  {
    if (y>=10)
    {
      y-=2;
    }
  }
  void movedown()
  {
    if (y<=780)
    {
      y+=2;
    }
  }
}
