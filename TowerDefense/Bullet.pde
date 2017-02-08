class Bullet extends GameObject
{
  float theta;
  float speed;
  
  Bullet(float x, float y, float theta)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, 1);
    this.theta = theta;
    
    speed = 2000;
  }
  
  void render()
  {
    
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    fill(255, 0 ,0);
    rect(0, 0, 10, 10);
    popMatrix();
    noFill();
  }
  
  void update()
  {
    
      forward.x = -sin(theta);
      forward.y = + cos(theta);
      
      pos.add(PVector.mult(PVector.mult(forward, speed), timeDelta));
    
  
  }
}