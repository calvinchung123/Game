boolean[] keys = new boolean[1000];
float timeDelta = 1.0f / 60.0f;
Player player;
Monster m;
float wait;
int menu=0;
ArrayList<GameObject> gameObjects = new ArrayList();
ArrayList<Monster> monster = new ArrayList();
Boolean gameOver = false;

void setup()
{
  size(500, 800);
  player = new Player(width / 2, (height/10) * 9, 0, 50, 'a', 'd', ' ');  
  
    monster.add(new Monster());
  wait = 50;
  
}

void draw()
{
  background(0);
  stroke(255);
  noFill();
  switch(menu){
    case 1:
      if(gameOver == false)
      {
      for(int i = 0; i < gameObjects.size(); i++)
      {
        GameObject obj = gameObjects.get(i);
        
        obj.render();
        obj.update();
        
      }
      
          player.update();
        player.render();
        if(keyPressed) {
          if(key == ' ') {
            
          //laser.update();
         // laser.display();
          }
        }
        
        for(int i = 0; i < monster.size(); i++) {
          Monster m = monster.get(i);
           m.update();
           m.render();
          
        }
        
        spawnMonster();
      }
      else
      {
        text("GAME OVER", width/2-50, height/2);
      }
  } 
    
}

boolean checkKey(int k)
{
  if (keys.length >= k) 
  {
    return keys[k] || keys[Character.toUpperCase(k)];  
  }
  return false;
}
void keyPressed()
{ 
  keys[keyCode] = true;
}
 
void keyReleased()
{
  keys[keyCode] = false; 
}

void spawnMonster() {
  if(wait <= 0 )  
  {
    wait = 100;
     monster.add(new Monster());
  }
  else {
    wait --;
  }
  
}