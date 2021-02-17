class DepartmentBubble {

  float x, y;
  int deaths;
  int scale = 5;
  String department;
  boolean mouseOver = false;

  //constructor to create Bubble
  DepartmentBubble(String nameDepartment, int d_, float x_, float y_)
  {
    x = x_;
    y = y_;
    deaths = d_;
    department = nameDepartment;
  }

  //have to change how to detect distance with the new diameters
  void checkHover(float positionX, float positionY)
  {
    //calculate distance between center of the bubble and the mouse
    float distance = dist(positionX, positionY, x, y);

    //if the distance is less than the diameter, than mouse is inside the bubble
    if (distance < (deaths*scale)/2)
    {
      mouseOver = true;
    } else
    {
      mouseOver = false;
    }
  }

  void show()
  {
    //variable used to scale the size of the circle

    pushStyle();
    ellipseMode(CENTER);
    stroke(255);
    strokeWeight(1);
    fill(0, 0, 255, 63);

    //assign a value to scale the radius depending on the number of deaths
    if (deaths >=1 && deaths <= 2 )
    {
      scale = 50;
    } else if (deaths >=3 && deaths <= 9 )
    {
      scale = 20;
    } else if (deaths >=10 && deaths <= 21)
    {
      scale = 10;
    } else
    {
      scale = 5;
    }
    //draw circle for the bubble used to showcase the # of deaths in Honduras
    circle(x, y, deaths*scale);

    pushStyle();
    fill(255);
    textAlign(CENTER);
    
    textSize(50);
    //display text with the # of deaths 
    text(deaths, x, y+15);

    //when mouse is hovering over the bubble
    if (mouseOver == true)
    {
      //show the name of the department that the mouse is over
      textSize(20);
      text(department, x, y+50);
    }
    
    popStyle();
  }
}
