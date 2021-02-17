class MapCircles 
{
  float x, y, radius;
  color col;
  boolean expanding = true;

//constructor 
  MapCircles(float posX, float posY, color c_) 
  {
    //assign values passed onto the contructor the the global variables
    x = posX;
    y = posY;
    col = c_;
    //initialize radius to 1
    radius = 1;
  }

/*I was goint to name it expand, but apparently there is something called 
  expand within Processing already*/
  void expandCircle() 
  {
    if (expanding == true) 
    {
      //increase the radius to make the circle expand
      radius += 1;
    }
  }

//similar to a collision function I did in last assignment

//function to check if the circle touches the edges of the canva
  boolean checkEdges() 
  {
    if(x + radius > width || x -  radius < 0 || y + radius > height || y -radius < 0)
    {
      return true;
    }
    else
    {
      return false;
    }
  }

//showcases the circles
  void display() 
  {
    //stroke(255);
    //strokeWeight(2);
    //noFill();
    fill(col);
    noStroke();
    circle(x, y, radius);
  }
}
