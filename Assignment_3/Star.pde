class Star
{
  //create variables for the x, y and z position of the stars
  float x, y, z;
  
  Star()
  {
    //initialize the position of the stars at random locations
    x = random(-width, width);
    y = random(-height, height);
    z = random(width);
  
  }
  
  //function to update the position of the stars as they move
  void updatePosition()
  {
    z = z - 20;
    if(z < 1)
    {
      x = random(-width, width);
      y = random(-height, height);
      z = width;
    }
  
  }
  
  //show the star in the canvas
  
  void show()
  {
    fill(255);
    noStroke();
    
  //change the positon of the star 
    float newXpos = map(x/z, 0, 1, 0, width);
    float newYpos = map(y/z, 0, 1, 0, height);
    
    //change the siize of the star as it gets away from the center 
    float radius = map(z, 0, width, 10, 0);
    
    //draw the star
    circle(newXpos, newYpos, radius);
    
  }


}
