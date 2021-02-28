class Player {
  PImage potterSprite;
  PImage[][] harryPotter;
  int direction = 3; // player will start facing the right
  int step = 0;
  int posX;
  int posY;
  int speed = 3;

  //constuctor
  Player()
  {
    potterSprite = loadImage("HarryPotter.PNG");
    harryPotter = new PImage[4][9]; // 12 images across, 4 down, in the spritesheet

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
    posY = 25;

    imageMode(CENTER);
  }


  void move()
  {
    //look at sprite sheet to determine which direction is which
    if (keyPressed) 
    {
      if (keyCode == DOWN || key == 'S' || key == 's' ) 
      {
        direction = 2;
        posY+=speed;
      }
      if (keyCode == LEFT || key == 'A' || key == 'a' ) 
      {
        direction = 1;
        posX-=speed;
      }
      if (keyCode == RIGHT || key == 'D' || key == 'd') 
      {
        direction = 3;
        posX+=speed;
      }
      if (keyCode == UP || key == 'W' || key == 'w') 
      {
        direction = 0;
        posY-=speed;
      }
      //this makes it repeat, loop
      if (frameCount%speed==0) 
      {
        step = (step+1) % 9;
      }
    }
    
    println("PosX = " + posX + " PosY = " + posY);
  }
  
  void checkWall()
  {
   // ellipse(posX, posY, 30, 45 );
    color c = maze.get(25, 25);
    //println(c);
    //value of color of maze -5534383
    
    
   color wallHead = maze.get(posX, posY-23);
   color wallFeet = maze.get(posX, posY+23);
   color wallLeft = maze.get(posX-15, posY);
   color wallright = maze.get(posX+15, posY);
   
  println("Head = "+ wallHead);
  println("Feet = "+ wallFeet);
  println("Left = "+ wallLeft);
  println("Right = "+ wallright);

  
  }

  void show()
  {
    pushMatrix();
    //pushStyle();
    
    scale(0.85);
    //Problem of PosX and PosY for pixel color is related to scale
    //But even when I take away the scale, the values of posX and posY are greater than canva
    
    //Problem is not imageMode. SOLVED! Problem was the scale. You also have to scale the ellipse
    //imageMode(CENTER);
    image(harryPotter[direction][step], posX, posY);
    
    ellipse(posX, posY, 30, 45);
    
    //popStyle();
    popMatrix();
    
    //Used to figure out problem with x and y position of ellipse
    //println("posX = "+ posX +" posX = "+ posY);
  }
}
