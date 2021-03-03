PImage winBackground1, winBackground2;

PImage cheer, snape;

PImage winText1, winText2, points, snapeApprove;

PImage looseBackground, looseText, boylived, boydied;

PImage timeturnerSprite, loadingBackground, patience, loadingmaze;

PImage menuButton, menuHover;

PImage[] timeturner;

float tint;

boolean loadingTint = true;

boolean overMenuButton = false;

int menuPosX, menuPosY;

void loadScreenData()
{
  menuButton = loadImage("Menu1.PNG");
  menuHover = loadImage("Menu2.PNG");

  winBackground1 = loadImage("gryffindor.jpg");
  winBackground2 = loadImage("WinWallpaper.jpg");

  points = loadImage("10points.png");
  snapeApprove = loadImage("snapeApproves.png");

  winText1 = loadImage("YouWon.png");
  winText2 = loadImage("YouWon2.png");

  cheer = loadImage("win.png");
  snape = loadImage("snape.jpg");

  looseBackground = loadImage("youLoose.jpg");
  looseText = loadImage("gameOver.png");

  boylived = loadImage("boywholived.png");
  boydied = loadImage("boydied.png");

  loadingBackground = loadImage("griffindor.jpg");

  timeturnerSprite = loadImage("timeTurnetSprite.png");

  timeturner = new PImage[10];

  int w = timeturnerSprite.width/5;
  int h = timeturnerSprite.height/2;

  for (int y=0; y < 2; y++) 
  {
    for (int x=0; x< 5; x++) 
    {
      timeturner[2*y+x] = timeturnerSprite.get(x*w, y*h, w, h);
    }
  }

  patience = loadImage("patience.png");
  loadingmaze = loadImage("loadingmaze.png");
}

void loadingScreen()
{
  int speed = 3;
  int step = 0;

  loadingBackground.resize(900, 900);

  if (frameCount%speed==0) 
  {
    step = (step+1) % 10;
  }

  loadingTint();

  pushMatrix();
  pushStyle();
  imageMode(CENTER);
  translate(width/2, height/2);

  pushStyle();
  tint(150, 150);
  image(loadingBackground, 0, 0);
  popStyle();


  image(timeturner[step], 0, 0);

  //patience.resize(500, 0);
  image(patience, 0, -300);

  pushStyle();
  tint(255, tint);
  image(loadingmaze, 0, 300);
  popStyle();

  popStyle();
  popMatrix();
}

void loadingTint() {
  float n = -5;
  if ( tint >= 255) {
    loadingTint = true;
  }
  if (tint <= 0) {
    loadingTint = false;
  }
  if (!loadingTint) {
    tint -= n;
  } else if (loadingTint) {
    tint += n;
  }
}


void winScreen(int option)
{
  if (!song2.isPlaying())
  {
    song2.play();
  }
  
  //load first winScreen (House Cup)
  if (option == 1)
  {
    menuPosX = 0;
    menuPosY = 100;
    
    pushMatrix();
    pushStyle();
    imageMode(CENTER);
    translate(width/2, height/2);

    pushStyle();
    image(winBackground1, 0, 0);
    popStyle();

    cheer.resize(500, 0);
    image(cheer, 0, 0);

    winText1.resize(600, 0);
    image(winText1, 0, -350);
    image(points, 0, 350);

    menuHover();

    if (overMenuButton)
    {
      image(menuHover, menuPosX, menuPosY);
    } else
    {
      image(menuButton, menuPosX, menuPosY);
    }

    popStyle();
    popMatrix();
  } 
  //load second winScreen (Snape Version)
  else if (option == 2)
  {
    menuPosX = -200;
    menuPosY =  300;
    
    pushMatrix();
    pushStyle();
    imageMode(CENTER);
    translate(width/2, height/2);

    winBackground2.resize(width, 0);
    image(winBackground2, 0, -150);

    winText2.resize(600, 0);
    image(winText2, -130, -300);
    image(snapeApprove, 250, 200);

    snape.resize(400, 0);
    image(snape, -180, 100);
    
    menuHover();

    if (overMenuButton)
    {
      image(menuHover, menuPosX, menuPosY);
    } else
    {
      image(menuButton, menuPosX, menuPosY);
    }

    popStyle();
    popMatrix();
  }
}

void showGameOver()
{
  menuPosY = 0;
  menuPosY = 200;

  if (!song3.isPlaying())
  {
    song3.play();
  }

  pushMatrix();
  pushStyle();

  looseBackground.resize(0, height);

  imageMode(CENTER);
  translate(width/2, height/2);

  pushStyle();
  tint(200, 200);
  image(looseBackground, 0, 0);
  popStyle();

  image(looseText, 0, 0);

  boylived.resize(0, 80);
  boydied.resize(0, 80);
  image(boylived, 0, -300);
  image(boydied, 0, -200);

  menuHover();

  if (overMenuButton)
  {
    image(menuHover, menuPosX, menuPosY);
  } else
  {
    image(menuButton, menuPosX, menuPosY);
  }

  popStyle();
  popMatrix();
}

void menuHover()
{
  //Check hover over the Menu button
  // dimensions of exit button 357 x 96
  if (mouseX >= (width/2 + menuPosX-178) && mouseX <= (width/2 +menuPosX+178) && mouseY >= ((height/2)+ menuPosY-48) && mouseY <= ((height/2)+ menuPosY+48)) 
  {
    overMenuButton = true;
    //println("Mouse Over");
  } else
  {
    overMenuButton = false;
  }
}
