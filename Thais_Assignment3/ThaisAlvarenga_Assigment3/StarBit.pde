class StarBit
{
  //make variables for x and y position of the Starbit
  int xPos, yPos;
  /*radius1 is for how big the starBit will be, radius2 is for the dents between the 
   points of the StarBit*/
  float radius1 = 20;
  float radius2 = 40;
  //make variable for the number of points in the starBit
  int numPoints = 5;
  //make variables to hold the red, green and blue colors of the rgb
  int r, g, b;

  //make bolean to check if StarBit was collected
  boolean collected;

  //constructor
  StarBit()
  {
    /*assign random x and y positions to the starbits (the 35 is so that they don't)
     appear outside the canva*/
    xPos = round(random(35, width-35));
    yPos = round(random(35, height-35));

    //assign random values for the rgb 
    r = round(random(255));
    g = round(random(255));
    b = round(random(255));
  }

  //create a new starbit
  void newStarBit()
  {
    xPos = round(random(35, width-35));
    yPos = round(random(35, height-35));

    r = round(random(255));
    g = round(random(255));
    b = round(random(255));
  }

  //make shape of starbit (taken from Processing refence)
  void star(float x, float y, float radius1, float radius2, int npoints)
  {
    float angle = TWO_PI / npoints;
    float halfAngle = angle/2.0;

    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius2;
      float sy = y + sin(a) * radius2;

      fill(r, g, b);
      vertex(sx, sy);
      sx = x + cos(a+halfAngle) * radius1;
      sy = y + sin(a+halfAngle) * radius1;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }

  //display the starBit
  void display()
  {
    pushMatrix();
    //make the star rotate
    translate(xPos, yPos);
    rotate(frameCount/ -100.0);
    //draw the starbit
    star(0, 0, radius1, radius2, numPoints);
    popMatrix();
  }

  //create starBit if the current starBit had been collected
  void createStarBit()
  {
    //asign value returned by spacecraft.checkCollect()to variable
    collected = spacecraft.checkCollect();
    if (collected == true)
    {
      newStarBit();
    }
  }
}
