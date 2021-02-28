PImage maze;

Player player; 

//float nmBonus = 0;

//score
float time = 0;
float fastestTime = 0;

void setup() {
  size(900, 900);

  maze = loadImage("maze.png");
  player = new Player();
}

void draw() {
  background(maze); 

  player.move();
  player.show();
  player.checkWall();

  instructions();
  score();
}

void score() 
{
  //checks if a highScore already exists (i.e. is bigger than 0)
  //if it doesn't, highScore is set to the value of score
  //if it does, highScore is only set to the value of score if it's lower

  /* UNCOMMENT THIS LATER
   
   if (fastestTime < time && fastestTime == 0 && win()) 
   {
   fastestTime = time;
   } else if (fastestTime > time && time > 0 && win()) 
   
   {
   fastestTime = time;
   }
   
   */

  pushStyle();
  textAlign(CENTER, BOTTOM);
  textSize(25);
  fill(252, 194, 104);
  text("Fastest Time: "+(int)fastestTime/60, 650, 30);
  text("Current Time: "+(int)time/60, 150, 30);
  time += 1;
  popStyle();
}


void instructions() 
{
  if (player.posX < 150 && player.posY < 50)
  {
    pushStyle();
    
    textAlign(CENTER, BOTTOM);
    textSize(60);
    fill(252, 194, 104);
    text("Find the Exit!", width/2, height/2);
    textSize(30);
    text("Move with Arrow-keys or W,A,S,D", width/2, height/2+50);

    strokeWeight(6);
    stroke(252, 194, 104);
    line(865, 750, 865, 875);
    line(865, 875, 840, 850);
    line(865, 875, 890, 850);
    
    popStyle();
  }
}
