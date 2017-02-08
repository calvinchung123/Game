class Monster extends GameObject {
  PVector velocity;
  int size;
  int r;
  
  Monster() {
    r = (int)random(0, width);
    pos = new PVector(r, 0);
    velocity = new PVector(0, 2);
    size = 25;
  }
  
  void update() {
    pos.add(velocity);
    
    for(int i = 0; i < gameObjects.size(); i++)
    {
      GameObject b = gameObjects.get(i);
      
      if(b instanceof Bullet)
      {
        Bullet bul = (Bullet) b;
        if(dist(bul.pos.x, bul.pos.y,pos.x,pos.y) < 30)
        {
          monster.remove(this);
          player.score ++;
        }
      }
    }
    
    if(pos.y > height)
    {
      gameOver = true;
    }
    
  }
  
  void render() {
    pushMatrix();
    translate(pos.x, pos.y);
      rect(0, 0, size, size);
    popMatrix();
  }
}