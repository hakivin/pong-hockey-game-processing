class Ball
{
  int x, y;
  boolean u, r, shot;
  Ball()
  {
    reset();
    shot=false;
  }
  void reset(){
    x=int(random(100, 500));
    y=400;
    int xdirection=int(random(2));
    int ydirection=int(random(2));
    if (xdirection==0)
      {
        r=true;
      }
      else //xidrection==1
      {
        r=false;
      }
      if (ydirection==0)
      {
        u=true;
      }
      else //ydirection==1
      {
        u=false;
      }
      shot=false;
  }
  void move()
  {
    if (u==true)
    {
      y=int(y-2-changespeed/2);
    }
    else  //up==false
    {
      y=int(y+2+changespeed/2);
    }
    if(shot==false){
      if (r==true)
      {
        x=int(x+1+changespeed);
      }
      else  //right==false
      {
        x=int(x-1-changespeed);
      }
    }
  }
  void bounce()
  {
    if (get(int(x)-15, int(y))!=color(0))
    {
      r=true;
      if (get(int(x)-15, int(y))==color(200,20,200)){
        if(u==true)
          u=false;
        else
          u=true;
        changespeed=0;
      }
      else if(get(int(x)-15, int(y))==color(255,255,51)){
        changespeed+=2;
      }
        
      //changespeed+=1.0/16;
    }
    if (get(int(x)+15, int(y))!=color(0))
    {
      r=false;
      if (get(int(x)+15, int(y))==color(200,20,200)){
        if(u==true)
          u=false;
        else
          u=true;
        changespeed=0;
      }
      else if(get(int(x)+15, int(y))==color(255,255,51)){
        changespeed+=2;
      }
      //changespeed+=1.0/16;
    }
    if (get(int(x), int(y)-15)!=color(0))
    {
      u=false;
      if ((get(int(x), int(y)-15)==color(0,150,255)) && a){
        r=false;
        shot=false;
        }
      if ((get(int(x), int(y)-15)==color(0,150,255)) && d){
        r=true;
        shot=false;
        }
      if ((get(int(x), int(y)-15)==color(0,150,255)) && s){
        changespeed+=1.0/2;
        if(a==false && d==false)
          shot=true;
        }
    }
    if (get(int(x), int(y)+15)!=color(0))
    {
      u=true;
      if ((get(int(x), int(y)+15)==color(255,0,0)) && left){
        r=false;
        shot=false;
        }
      if ((get(int(x), int(y)+15)==color(255,0,0)) && right){
        r=true;
        shot=false;
        }
      if ((get(int(x), int(y)+15)==color(255,0,0)) && up){
        changespeed+=1.0;
        if(left==false && right==false)
          shot=true;
        }
    }
  }
  void show()
  {
    fill(255);
    ellipse(x, y, 30, 30);
  }
}
