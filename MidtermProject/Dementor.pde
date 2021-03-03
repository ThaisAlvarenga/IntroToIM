class Dementor
{
  PImage dementorSprite;
  PImage[][] dementor;
  
  float posX, posY;
  float speedX, speedY;
  int direction;
  
  int count = 6;
  int step = 0;


  Dementor()
  {
    dementorSprite = loadImage("dementor.PNG");
    dementor = new PImage[2][3];

    int w = dementorSprite.width/3;
    int h = dementorSprite.width/2;

    for (int y = 0; y < dementor.length; y++)
    {
      for (int x = 0; x < 3; x++)
      {
        dementor[y][x] = dementorSprite.get(x*w, y*h-10, w, h);
      }
    }

    posX = random(200, 800);
    posY = random(200, 800);
    speedX = random(-1.5, 1.5);
    speedY = random(-1.5, 1.5);
  }

  void show()
  {

    pushMatrix();
    pushStyle();

    imageMode(CENTER);
    translate(posX, posY);
    scale(1.5);
    image(dementor[direction][step], 0, 0);


    //image(dementor[1][2], 25, 25 );

    popStyle();
    popMatrix();
  }

  void move()
  {
    //count += 1;
    posX -= speedX;
    posY -= speedY;

    if (posX >= maze.width-20)
    {
      speedX = speedX *-1;
    }

    //working
    if (posX <= 50)
    {
      speedX = speedX *-1;
    }
    if (posY >= maze.height-20)
    {
      speedY = speedY *-1;
    }

    //working
    if (posY <= 100)
    {
      speedY = speedY*-1;
    }

   // println("speedX = "+speedX + " speedY = " + speedY);
   // println("posX = "+posX + " posY = " + posY);

    if (speedY < 0)
    {
      direction = 0;
    }

    if (speedY > 0)
    {
      direction = 1;
    }

    //println(frameCount%count);
    

    if (frameCount%count ==0)
    {
      step = (step+1)%3;
      
    }
  }
  
  void enemyPosition()
  {
    
    enemyPosition.pushMatrix();
    //playerPosition.scale(0.85);
    enemyPosition.noStroke();
    enemyPosition.fill(255);
    enemyPosition.ellipse(posX, posY, 30, 50);
    enemyPosition.popMatrix();
  
  }
}
