PGraphics maze, fieldView, enemyPosition;

FieldView playerView;

//Testing dementor 
Dementor myDementor;

int cols, rows;
int cellSize = 50;
int numEnemies = 10;

Dementor[] dementors = new Dementor[numEnemies];


//holds the grid used to make the maze
ArrayList<Cell> grid = new ArrayList<Cell>();


Maze gameMaze;

void setup() 
{
  //Something nice is that I can change the canva size and the maze will still run
  size(1000, 900);
  //fullScreen();

  //maze = createGraphics(width, height);
  maze = createGraphics(width, height);

  fieldView = createGraphics(width, height);
  
  enemyPosition = createGraphics(width, height);

  gameMaze = new Maze();
  playerView = new FieldView(300);
  
  
  for (int i = 0; i< dementors.length; i++)
  {
    dementors[i] = new Dementor();
  }
 
  myDementor = new Dementor();
}

void draw() 
{
  background(51);

  /* ----------------------------------------------------------------------------- */
  //DRAW MAZE
  maze.beginDraw();

  maze.background(0);
  gameMaze.makeGrid();
  gameMaze.generateMaze();

  maze.endDraw();
  
  /* ----------------------------------------------------------------------------- */
  //DRAW FIELD VIEW

  fieldView.beginDraw();

  playerView.showFieldView();
  playerView.flickerOn();
  
  fieldView.endDraw();

  /* ----------------------------------------------------------------------------- */

  maze.mask(fieldView);
  image(maze, 0, 0);
  
  //image(copyFieldView, 0, 0);
  
  /* ---------------------------------------------------------------------------- */
  enemyPosition.beginDraw();
  
  enemyPosition.background(0);
  myDementor.enemyPosition();
  
  enemyPosition.endDraw();
  
  enemyPosition.loadPixels();
  
  //image(enemyPosition, 0, 0);
  /* ---------------------------------------------------------------------------- */
  
  
  myDementor.show();
  myDementor.move();
  
  /*
  for (int i = 0; i< dementors.length; i++)
  {
    dementors[i].show();
    dementors[i].move();
  }
  */
  
}
