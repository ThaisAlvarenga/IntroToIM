class StarBit
{
  int xPos, yPos;
  float radius1, radius2;
  int numPoints;
  int r, g, b;
  boolean collected;


  StarBit()
  {
    xPos = round(random(width));
    yPos = round(random(height));
    radius1 = 20;
    radius2 = 40;
    numPoints = 5;
    
    r = round(random(255));
    g = round(random(255));
    b = round(random(255));
    
  }
  
  void newStarBit()
  {
    xPos = round(random(35, width-35));
    yPos = round(random(35, height-35));
    radius1 = 20;
    radius2 = 40;
    numPoints = 5;
    
    r = round(random(255));
    g = round(random(255));
    b = round(random(255));
  }

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

  void display()
  {
    pushMatrix();
    translate(xPos, yPos);
    rotate(frameCount/ -100.0);
    star(0, 0, radius1, radius2, numPoints);
    popMatrix();
  }

  void collected()
  {
    collected = spacecraft.checkCollect();
    if(collected == true)
    {
      newStarBit();
    }
  }
}
