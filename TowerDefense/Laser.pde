class Laser{
  float x, y;
  
  Laser() {
    y = 0;
    x = 0;
  }
  
  void update() {
   y = player.pos.y+1000*sin(-player.theta - HALF_PI);
   x = player.pos.x-1000*cos(-player.theta - HALF_PI);
  }
  
  void display() {
    line(player.pos.x, player.pos.y, x, y);
  }
  
} 