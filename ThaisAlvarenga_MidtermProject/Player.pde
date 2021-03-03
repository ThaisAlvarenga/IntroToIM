class Player 
{
  PGraphics playerPosition;
  PImage potterSprite;
  PImage[][] harryPotter;
  int direction = 3; // player will start facing the right
  int step = 0;
  int posX, posY;
  int speed = 4;

  //constuctor
  Player()
  {
    potterSprite = loadImage("HarryPotter.PNG");
    harryPotter = new PImage[4][9]; // 12 images across, 4 down, in the spritesheet
    playerPosition = createGraphics(width, height);

    int w = potterSprite.width/9;
    int h = potterSprite.height/4;

    for (int y=0; y < 4; y++) 
    {
      for (int x=0; x< 9; x++) 
      {
        harryPotter[y][x] = potterSprite.get(x*w, y*h, w, h);
      }
    }

    // inital character position
    posX = 25;
    posY = 23;

    // imageMode(CENTER);
  }


  void move()
  {
    //look at sprite sheet to determine which direction is which
    if (keyPressed)
    {

      if (keyCode == DOWN || key == 'S' ||  key == 's' )
      {
        direction = 2;
        if (checkWall(direction)) {
          
          posY+=speed;
        }
      }
      if (keyCode == LEFT || key == 'A' || key == 'a' )
      {
        direction = 1;
        if (checkWall(direction)) {
          
          posX-=speed;
        }
      }
      if (keyCode == RIGHT ||  key == 'D' || key == 'd')
      {
         direction = 3;
        if (checkWall(direction)) {
          posX+=speed;
        }
      }
      if (keyCode == UP || key == 'W' || key == 'w')
      {
        direction = 0;
        if (checkWall(direction)) {
          posY-=speed;
        }
      }
      //this makes it repeat, loop
      if (frameCount%0.5==0)
      {
        step = (step+1) % 9;
      }
    }

    //println("PosX = " + posX + " PosY = " + posY);
  }

  boolean checkWall(int direction)
  {
    boolean move = true;
    int newX = posX;
    int newY = posY;

    switch (direction) {
    case 0:
      newY-=speed;
      break;
    case 1:
      newX-=speed;
      break;
    case 2:
      newY+=speed;
      break;
    case 3:
      newX+=speed;
      break;
    }

    //draw ellipse in pgraphics
    playerPosition.beginDraw();

    playerPosition.background(0);

    playerPosition.pushMatrix();
    //playerPosition.scale(0.85);
    playerPosition.noStroke();
    playerPosition.fill(255);
    playerPosition.ellipse(newX, newY+5, 30, 40);
    playerPosition.popMatrix();

    playerPosition.endDraw();

    playerPosition.loadPixels();

    color white = color(255);
    
    //image(mazeBW, 0, 0);

    //image(playerPosition, 0, 0);

    for (int positionY=0; positionY< playerPosition.height; positionY++) {
      for (int positionX=0; positionX< playerPosition.width; positionX++) {
        color c = playerPosition.pixels[positionX+positionY*playerPosition.width];
        if (mazeBW.get(positionX, positionY) == white && c == white) {
          move=false;
        }
      }
    }

    return move;
  }

  void show()
  {
    pushMatrix();
    pushStyle();

    imageMode(CENTER);

    translate(posX, posY);

    scale(0.85);
    //Problem of PosX and PosY for pixel color is related to scale
    //But even when I take away the scale, the values of posX and posY are greater than canva

    //Problem is not imageMode. SOLVED! Problem was the scale. You also have to scale the ellipse
    //imageMode(CENTER);
    image(harryPotter[direction][step], 0, 0);

    popStyle();
    popMatrix();

    //Used to figure out problem with x and y position of ellipse
    //println("posX = "+ posX +" posX = "+ posY);
  }
  
  boolean enemyHit()
  {
    playerPosition.beginDraw();

    playerPosition.background(0);

    playerPosition.pushMatrix();
    //playerPosition.scale(0.85);
    playerPosition.noStroke();
    playerPosition.fill(255);
    playerPosition.ellipse(posX, posY, 30, 40);
    playerPosition.popMatrix();

    playerPosition.endDraw();

    playerPosition.loadPixels();
    
    color white = color(255);
    
    for (int positionY = 0; positionY< playerPosition.height; positionY++) 
    {
      for (int positionX = 0; positionX< playerPosition.width; positionX++) 
      {
        
        color c = playerPosition.pixels[positionX+positionY*playerPosition.width];
        //println(enemyPosition.get());
        if (enemyPosition.get(positionX, positionY) == white && c == white) 
        {
            return true;
        } 
        
      }
    }
    
    return false;
    
  }
}
