class Player {
  PVector position;
  PVector rotation;
  float theta;
  int sizeX, sizeY;
  
  Player() {
    position = new PVector(width / 2, height - 50);
    rotation = new PVector(0, -1);
    theta = 0;
    sizeX = 50;
    sizeY = 100;
  }
  
  void update() {
    
    rotation.x = sin(theta);
    rotation.y  = -cos(theta);
    
 if (keyPressed)
  {
     if (key==CODED)
     {
       if( keyCode == LEFT)
       {  
         theta -= 0.1f;
       }
       if( keyCode == RIGHT)
       {
         theta += 0.1f;
       }// end if RIGHT key
     }
    rotate(theta);  
  }
  /*
  void display() 
  {
    
    
  }
  
*/  
 