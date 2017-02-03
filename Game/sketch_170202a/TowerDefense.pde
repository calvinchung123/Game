void setup()
{
  size(500,800);
  float theta = 90;
  PVector forward = new PVector(0, -1);
}

void draw()
{
  background(0);
  stroke(255);
  noFill();
 
  
  line(width /2,  height - 50, mouseX, mouseY);
  ellipse(width/2, height- 50, 200, 200);
  rectMode(CENTER);
  //rect(forward.x ,  forward.y, 50,100);
 
}