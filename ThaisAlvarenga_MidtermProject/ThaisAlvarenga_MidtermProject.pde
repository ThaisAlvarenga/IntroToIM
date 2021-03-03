import processing.sound.*;
import processing.video.*;

SoundFile[] soundtracks = new SoundFile[4];
SoundFile song0, song1, song2, song3;

int screen = 0;

PGraphics maze, mazeBW, fieldView, playerPosition, enemyPosition;
PImage arrowKeysUI, wasdKeysUI;

Maze gameMaze;
FieldView playerView;
Player player; 

int cols, rows;
int cellSize = 50;
int numEnemies = 10;

Dementor[] dementors = new Dementor[numEnemies];

//holds the grid used to make the maze
ArrayList<Cell> grid = new ArrayList<Cell>();

//used to determine whether the maze is loaded or not
int gridCount = 0;

//score
float time = 0;
float fastestTime = 0;

//variable to reset game 
boolean playerWon = false;
boolean gameOver = false;

int winDisplay;

//determines if maze is finished
boolean mazeFinished = false;

boolean isPlaying = false;

void setup() 
{
  //Something nice is that I can change the canva size and the maze will still run
  size(900, 900);
  //fullScreen();

  /*-----------------------------------------------------------------------------------*/
  //Load Data for the menu and its buttons
  loadMenuData();

  loadButtons();

  /*-----------------------------------------------------------------------------------*/
  // Load data forscreens
  loadScreenData();

  maze = createGraphics(width, height);

  //create copy of the maze in balck and white
  mazeBW = createGraphics(width, height);

  fieldView = createGraphics(width, height);

  playerPosition = createGraphics(width, height);

  enemyPosition = createGraphics(width, height);

  player = new Player();

  gameMaze = new Maze();

  playerView = new FieldView(300);

  for (int i = 0; i< dementors.length; i++)
  {
    dementors[i] = new Dementor();
  }

  song0 = new SoundFile(this, "0.mp3");
  song1 =  new SoundFile(this, "1.mp3");
  song2 =  new SoundFile(this, "2.mp3");
  song3 =  new SoundFile(this, "3.mp3");

  /*------------------------------------------------------------------------------- */
  //Load UI for instructions
  arrowKeysUI = loadImage("arrows.png");
  wasdKeysUI = loadImage("wasd.png");
}

void draw() 
{
  background(0);
  
  switch(screen)
  {
  case 0:
    //pushMatrix();
    imageMode(CENTER);
    //popMatrix();
    menu();
    break;
    
  //load and play game
  case 1:
    playGame();
    break;

    //player Won
  case 2:
    winScreen(winDisplay);
    break;

    //game Over
  case 3:
    showGameOver();
    break;
  }
}

void playGame()
{
  background(0);

  if (!isPlaying)
  {
    song0.play();
    isPlaying = true;
  }


  /* ----------------------------------------------------------------------------- */
  //DRAW MAZE
  maze.beginDraw();
  mazeBW.beginDraw();

  maze.background(0);
  mazeBW.background(0);

  gameMaze.makeGrid();
  gameMaze.generateMaze();

  mazeBW.endDraw();
  maze.endDraw();

  mazeBW.loadPixels();

  /* ----------------------------------------------------------------------------- */

  enemyPosition.beginDraw();

  enemyPosition.background(0);


  for (int i = 0; i< dementors.length; i++)
  {
    dementors[i].enemyPosition();
  }

  enemyPosition.endDraw();

  enemyPosition.loadPixels();

  /* ----------------------------------------------------------------------------- */
  //DRAW FIELD VIEW

  fieldView.beginDraw();

  playerView.showFieldView();
  playerView.flickerOn();

  fieldView.endDraw();

  /* ----------------------------------------------------------------------------- */


  if (gridCount != grid.size()-1)
  {

    //println("Loading Maze");
    
    //show loading screen will maze is been generated
    loadingScreen();

    if (!song0.isPlaying())
    {
      song0.play();
    }
  } else
  {
    // image(maze, 0, 0);
    mazeFinished = true;
    //println("Finished");
      song0.stop();
  }

  if (mazeFinished)
  {
     if(!song1.isPlaying())
   {
     song1.play();
   }
    
    //THE FOLLOWING CAN BE ITS OWN FUNCTION
    maze.mask(fieldView);
    //imageMode(CENTER);
    image(maze,width/2, height/2);


    //move and show player
    player.move();
    player.show();

    for (int i = 0; i< dementors.length; i++)
    {
      dementors[i].show();
      dementors[i].move();
    }

    //display instructions at the beginning of the game
    instructions();

    //display score
    score();

    //show the exit Gate
    gameMaze.exit();

    gameOver = player.enemyHit();

    if (gameOver)
    {
      song1.stop();
      screen = 3;
    }

    playerWon = win();

    if (playerWon)
    {
      winDisplay = int(random(1, 3));
      song1.stop();
      screen = 2;
    }
  }
}


void score() 
{
  //checks if a highScore already exists (i.e. is bigger than 0)
  //if it doesn't, highScore is set to the value of score
  //if it does, highScore is only set to the value of score if it's lower

/*
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
 //text("Fastest Time: "+(int)fastestTime/60, 650, 30);
  text("Current Time: "+(int)time/60, 150, 30);
  popStyle();

  if (!win())
  {
    time += 1;
  }
}

void instructions() 
{
  if (player.posX < 50 && player.posY < 50)
  {
    pushMatrix();
    pushStyle();

    textAlign(CENTER, BOTTOM);
    textSize(60);
    fill(252, 194, 104);
    text("Find the Exit!", width/2, height/2+50);
    textSize(40);
    text("But watch out for the Dementors!", width/2, height/2 + 100);
    text("They could suck out your soul...", width/2, height/2+ 150);

    textSize(30);
    text("Move with Arrow-keys or W,A,S,D", width/2, height/2 -80);
    text("Exit", 865, 750 );

    imageMode(CENTER);
    arrowKeysUI.resize(200, 0);
    image(arrowKeysUI, width/2-200, height/2-200);
    wasdKeysUI.resize(200, 0);
    image(wasdKeysUI, width/2+200, height/2-200);

    strokeWeight(6);
    stroke(252, 194, 104);
    line(865, 750, 865, 875);
    line(865, 875, 840, 850);
    line(865, 875, 890, 850);

    popStyle();
    popMatrix();
  }
}

boolean win() {
  if (player.posY >= height) {
    playerWon = true;
    return true;
  }
  return false;
}


void mousePressed() 
{
  if (screen ==0)
  {
    if (overPlayButton)
    {
      println("Start Game");
      menuVideo.stop();
      screen = 1;
    }
    if (overExitbutton)
    {
      //println("Exit");
      exit();
    }
  } 
  else if ( screen == 2)
  {
    if (overMenuButton)
    {
      song2.stop();
      screen = 0;
      
    }
  } 
  else if (screen == 3)
  {
    if (overMenuButton)
    {
      song3.stop();
      screen = 0;
      
    }
  } 
}
