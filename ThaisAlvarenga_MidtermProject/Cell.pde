class Cell {
  int i, j;

  //order of the walls is top, right, bottom, left
  //this will allow us to remove walls in the grid
  boolean[] walls = {true, true, true, true};
  boolean visited = false;

  Cell(int indexI, int indexJ) {
    i = indexI;
    j = indexJ;
  }

  int index(int i, int j) 
  {
    //return 0 for edge cases
    if (i < 0 || j < 0 || i > cols-1 || j > rows-1)
    {
      return 0;
    }

    //formula to calculate index (same as the one to calculate pixels)
    int index = i + j * cols;
    return index;
  }

  Cell checkAdjacentCells() {
    ArrayList<Cell> adjacentCells = new ArrayList<Cell>();

    //get the cells adjacent to the cell the program is currently at
    Cell top    = grid.get(index(i, j-1));
    Cell right  = grid.get(index(i+1, j));
    Cell bottom = grid.get(index(i, j+1));
    Cell left   = grid.get(index(i-1, j));

    if (top != null && !top.visited) 
    {
      adjacentCells.add(top);
    }
    if (right != null && !right.visited) 
    {
      adjacentCells.add(right);
    }
    if (bottom != null && !bottom.visited) 
    {
      adjacentCells.add(bottom);
    }
    if (left != null && !left.visited) 
    {
      adjacentCells.add(left);
    }

    if (adjacentCells.size() > 0) 
    {
      int r = floor(random(0, adjacentCells.size()));
      return adjacentCells.get(r);
    } else
    {
      return null;
    }
  }

  //used to check the position of the current cell
  void highlight() {
    int x = i*cellSize;
    int y = j*cellSize;

    pushStyle();
    maze.noStroke();
    maze.fill(0, 255, 0);
    maze.rect(x, y, cellSize, cellSize);

    mazeBW.noStroke();
    mazeBW.fill(0, 255, 0);
    mazeBW.rect(x, y, cellSize, cellSize);
    popStyle();
  }


  void show() {
    int x = i*cellSize;
    int y = j*cellSize;

    pushStyle();
    //strokeWeight(10);
    maze.strokeWeight(3);
    maze.stroke(255);
    mazeBW.strokeWeight(3);
    mazeBW.stroke(255);
    //if the walls are defined
    if (walls[0]) 
    {
      maze.line(x, y, x + cellSize, y);
      //mazeBW.stroke(255);
      mazeBW.line(x, y, x + cellSize, y);
    }
    if (walls[1]) 
    {
      maze.line(x + cellSize, y, x + cellSize, y + cellSize);
      //mazeBW.stroke(255);
      mazeBW.line(x + cellSize, y, x + cellSize, y + cellSize);
    }
    if (walls[2]) 
    {
      maze.line(x + cellSize, y + cellSize, x, y + cellSize);
      //mazeBW.stroke(255);
      mazeBW.line(x + cellSize, y + cellSize, x, y + cellSize);
    }
    if (walls[3]) 
    {
      maze.line(x, y + cellSize, x, y);
      /// mazeBW.stroke(255);
      mazeBW.line(x, y + cellSize, x, y);
    }

    popStyle();


    //line(x           , y           , x + cellSize, y);
    //line(x + cellSize, y           , x + cellSize, y + cellSize);
    //line(x + cellSize, y + cellSize, x           , y + cellSize);
    //line(x           , y           , x+ cellSize , y);

    //noFill();
    //rect(x, y, cellSize, cellSize);

    //change color of a cell if it has been visited
    if (visited) 
    {
      pushStyle();
      maze.noStroke();
      maze.fill(255, 204, 102, 150);
      //maze.fill(0);
      maze.rect(x, y, cellSize, cellSize);

      mazeBW.noStroke();
      mazeBW.fill(0, 0, 0, 150);
      mazeBW.rect(x, y, cellSize, cellSize);
      popStyle();
    }

    pushStyle();
    //maze.strokeWeight(6);
    maze.stroke(255);
    maze.noFill();
    maze.rect(0, 0, maze.width-1, maze.height-1);

    mazeBW.stroke(255);
    mazeBW.noFill();
    mazeBW.rect(0, 0, maze.width-1, maze.height-1);
    
    //exit of maze
    mazeBW.strokeWeight(10);
    mazeBW.stroke(0);

    mazeBW.line(width-100,height,width,height);
    popStyle();
  }
}
