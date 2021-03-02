PGraphics maze;

int cols, rows;
int cellSize = 50;

//holds the grid used to make the maze
ArrayList<Cell> grid = new ArrayList<Cell>();

Maze gameMaze;

boolean mazeFinished = false;

void setup() 
{
  //Something nice is that I can change the canva size and the maze will still run
  size(1000, 900);
  //fullScreen();

  //maze = createGraphics(width, height);
  maze = createGraphics(width, height);

  gameMaze = new Maze();
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


/*
  while (!mazeFinished)
  {
    for ( Cell cells : grid)
    {
      if (cells.visited)
      {
        mazeFinished = true;
      }
    }
  }
  
  if(mazeFinished)
  {
    println("finished");
  image(maze, 0, 0);
  }
  */
  
  image(maze, 0, 0);

}
