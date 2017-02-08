class Player extends GameObject
{
  PVector velocity;
  PVector accel;
  float theta;
  
  float radius;
  float mass = 1;
  PShape shape;
  char up, down, left, right, fire;
  int health;
  int ammo;
  int score;
  
  // Make different keys control the ship!
  
  
  Player(float x, float y, float theta, float size, char left, char right, char fire)
  {
    println("In the player parameterised constructor");
    pos = new PVector(x, y);
    forward = new PVector(0, -1);
    accel = new PVector(0,0);
    velocity = new PVector(0,0);
    force = new PVector(0, 0);
    theta = 0;
    this.size = size;
    radius = size / 2;
    
    this.left = left;
    this.right = right;
    this.fire = fire;
    this.health = 10;
    this.ammo = 10;
    create();
    score = 0;
    
  }

  
  void create()
  {
    shape = createShape();
    shape.beginShape();
    shape.stroke(255);
    shape.noFill();
    shape.strokeWeight(2);
    shape.vertex(-radius, radius);
    shape.vertex(0, - radius);
    shape.vertex(radius, radius);
    shape.vertex(0, 0);
    shape.endShape(CLOSE);
  }
  
  void render() // Overrides the method in the base class
  {
    
    
    pushMatrix(); // Stores the current transform
    translate(pos.x, pos.y);
    text("Health: " + health, 30, 0);
    text("Ammo: " + ammo, 30, 20);
    text("Score:" + score, 30, 40);
    
    rotate(theta);    
    // Use lines
    /*
    stroke(255);
    strokeWeight(2);
    noFill();
    line(pos.x - radius, pos.y + radius, pos.x, pos.y - radius);
    line(pos.x, pos.y - radius, pos.x + radius, pos.y + radius);
    line(pos.x + radius, pos.y + radius, pos.x, pos.y);
    line(pos.x, pos.y, pos.x - radius, pos.y + radius);
    
    // Use beginShape
    /*
    beginShape();
    vertex(x - radius, y + radius);
    vertex(x, y - radius);
    vertex(x + radius, y + radius);
    vertex(x, y);
    vertex(x - radius, y + radius);    
    endShape();
    */
    // Use a PShape();
    shape(shape, 0, 0);
    popMatrix(); // Restore the transform
  }
  
  PVector force;
  float power = 100;
  
  float fireRate = 2;
  float toPass = 1.0 / fireRate;
  float elapsed = toPass;
  
  void update()
  {
    
    if(keyPressed & key == ' ')
    {
      
      
      Bullet bullet = new Bullet(pos.x, pos.y, theta + radians(180));
      gameObjects.add(bullet);
    }
      
    forward.x = sin(theta);
    forward.y  = -cos(theta);

    if (checkKey(left))  
    {
      theta -= 0.1f;
    }
    if (checkKey(right))
    {
      theta += 0.1f;
    }

    
    accel = PVector.div(force, mass);
    velocity.add(PVector.mult(accel, timeDelta));
    pos.add(PVector.mult(velocity, timeDelta));
    force.x = force.y = 0;
    velocity.mult(0.99f);
    elapsed += timeDelta;
  }

  
}