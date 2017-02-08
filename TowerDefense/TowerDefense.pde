boolean[] keys = new boolean[1000];
float timeDelta = 1.0f / 60.0f;
Player player;
Monster m;
float wait;
int menu=0;
ArrayList<GameObject> gameObjects = new ArrayList();
ArrayList<Monster> monster = new ArrayList();
Boolean gameOver = false;
int highscore = 0;
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
    case 0:
      fill(255,50);
      textSize(40);
      text("Tower Defense", 110, 100);
      rect(100,150,300,100);
      text("Start",200,210);
      if(overbtn(100,150,300,100))
      {
        if(mousePressed){
          menu=1;
        }
      }
      textSize(40);
      text("Exit",210,360);
      rect(100,300,300,100);
      if(overbtn(100,300,300,100))
      {
        if(mousePressed){
          menu=2;
        }
      }
      textSize(40);
      rect(100,450,300,100);
      text("LeadrBoard",140,510);
      if(overbtn(100,450,300,100))
      {
        if(mousePressed){
          menu=3;
        }
      }
      break;
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
        fill(0,0,255);
        text("GAME OVER", 160, height/2);
        text(" Press B to go back",100,500);
        if (keyPressed){
          if(key =='b' ||key== 'B'){
            menu = 0;
          }
        }
      }
      break;
    case 2:
      exit();
      break;
    case 3:
    fill(255);
      text("High Score:"+highscore,130,300);
       text(" Press B to go back",60,500);
        if (keyPressed){
          if(key =='b' ||key== 'B'){
            menu = 0;
          }
        }
  } 
    
}

boolean overbtn(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
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