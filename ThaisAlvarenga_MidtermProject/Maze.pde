class Maze
{
  Cell currentCell;

  ArrayList<Cell> stack = new ArrayList<Cell>();

  Maze()
  {
    cols = floor(maze.width/cellSize);
    rows = floor(maze.height/cellSize);

    //create Cell objects and add them to array list
    for (int j = 0; j < rows; j++) 
    {
      for (int i = 0; i < cols; i++) 
      {
        Cell newCell = new Cell(i, j);
        grid.add(newCell);
      }
    }
    //start the path at grid 0
    currentCell = grid.get(0);
  }

  void makeGrid()
  {

    //check that the grid displays correctly
    for (int i = 0; i < grid.size(); i++) 
    {
      //I made the mistake of writing grid.length() instead of grid.size()
      grid.get(i).show();
    }

    currentCell.visited = true;
  }

  void generateMaze()
  {
    //currentCell.highlight();
    //currentCell.checkAdjacentCells();

    // STEP 1
    Cell nextCell = currentCell.checkAdjacentCells();
    if (nextCell != null) 
    {
      nextCell.visited = true;

      // STEP 2
      stack.add(currentCell);

      //STEP 3: remove the walls
      removeWalls(currentCell, nextCell);

      // STEP 4
      currentCell = nextCell;

      //add to grid counter
      gridCount +=1;
    } 

    //this is what corrected the problem with the null value
    else if (stack.size() > 0) 
    {
      currentCell = stack.remove(stack.size()-1);
    }
  }

  void removeWalls(Cell current, Cell next) 
  {

    int x = current.i - next.i;

    if (x == 1) 
    {
      //remove left wall
      current.walls[3] = false;
      //remove right wall
      next.walls[1] = false;
    } else if (x == -1) 
    {
      //remove left wall
      current.walls[1] = false;
      //remove right wall
      next.walls[3] = false;
    }

    int y = current.j - next.j;

    if (y == 1) 
    {
      //remove bottom wall
      current.walls[0] = false;
      //remove top wall
      next.walls[2] = false;
    } else if (y == -1) 
    {
      //remove top wall
      current.walls[2] = false;
      //remove bottom wall
      next.walls[0] = false;
    }
  }

  //display the exit 
  void exit()
  { 
    if (player.posX > width-150 && player.posY > height-100) {
      strokeWeight(6);
      stroke(255);
      fill(255);
      line(width-100, height, width, height); //door

      //lightcone tracking player
      if (player.posX > width-100 && player.posY > height-75) { 
        noStroke();
        fill(255, 100);
        beginShape();
        vertex(width-100, height);
        vertex(width, height);
        vertex(player.posX, player.posY);
        endShape(CLOSE);
      }
    }
  }
}
