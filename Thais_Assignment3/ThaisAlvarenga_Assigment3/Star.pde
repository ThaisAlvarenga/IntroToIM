class Star
{
  //create variables for the x, y and z position of the stars
  float x, y, z;

  //constructor
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
    //decrease value of z
    z = z - 20;

    //reset the star's position
    if (z < 1)
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

    //divide the x and y position by x and map it with the width and height to move the stars
    float newXpos = map(x/z, 0, 1, 0, width);
    float newYpos = map(y/z, 0, 1, 0, height);

    //increase radius of the star as the get closer to the end of the canva
    float radius = map(z, 0, width, 10, 0);

    //use a circle to draw the stars
    circle(newXpos, newYpos, radius);
  }
}
