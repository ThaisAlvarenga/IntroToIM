/*
 Assigment #4
 
 This program was written by Thais Alvarenga 
 17th February 2021
 */

DepartmentBubble[] departmentBubbles;
Table femicides;
ArrayList<MapCircles> mapCircles;

PImage map;


void setup()
{
  size(1000, 770);
  
  //make an array list of class MapCirciles
  mapCircles = new ArrayList<MapCircles>();

  map = loadImage("map.PNG");
  //load pixels of the image
  map.loadPixels();
  
  //load table data
  loadData();
}

void draw()
{
  background(0);

  //LOAD MAP OF HONDURAS
  loadmap();

  //SHOW DATA
  for (int i = 0; i < departmentBubbles.length; i++)
  {
    departmentBubbles[i].show();
    //call the checkHover function to check mouse position and text display
    departmentBubbles[i].checkHover(mouseX, mouseY);
  }
}

//function to loat the table data 
/*I did a separate function for it because I kept getting confused as to where I started
 to load and where to actually use the data */
void loadData()
{
  //load table onto femicides (data has a header so we need to skip that)
  femicides = loadTable("Femicidios.csv", "header");

  //create object array the size of the data file
  departmentBubbles = new DepartmentBubble[femicides.getRowCount()];

  for (int i = 0; i < femicides.getRowCount(); i++)
  {
    //get the rows from the data set
    TableRow row = femicides.getRow(i);

    /*load the values of the table onto variables that will be used to make the department
     bubble object
     */
    String departmentName = row.getString("Departamento");
    int deaths = row.getInt("muertes");
    float x = row.getFloat("X");
    float y = row.getFloat("Y");

    /*create objects of the class type DepartmentBubbles and use the the values you got
     from the table to call the contructor*/
    departmentBubbles[i] = new DepartmentBubble(departmentName, deaths, x, y);
  }
}

//LOAD MAP
/*Similar to the load functin, I made this function because I kept getting confused*/
void loadmap()
{
  int amountCircles = 20;
  int count = 0;
  int attempts = 0;

  //keep looping while there aren't 20 circles per frame
  while (count <  amountCircles) 
  {
    //call function to make newCircle
    MapCircles newCircle = newMapCircles();

    //if newCircle is not null, add the new circle to the arraylist
    if (newCircle != null) 
    {
      mapCircles.add(newCircle);
      count++;
    }
    //this prevents the program from getting stuck in an infinite loop
    attempts++;
    if (attempts > 1000) 
    {
      noLoop();
      break;
    }
  }

  //check for overlaps and edges
  for (MapCircles circle : mapCircles) 
  {
    //if the circle is growing, check the edges
    if (circle.expanding == true) 
    {
      //if you check the edges and it collides with edges of canva set expanding to false
      if (circle.checkEdges()) {
        circle.expanding = false;
      } 
      //now check overlap with the other circles
      else 
      {
        //for every MapCircle other in the array list run the following
        for (MapCircles other : mapCircles) 
        {
          //if circle is not the same object as other
          if (circle != other) 
          {
            //check distance between the circles
            float distance = dist(circle.x, circle.y, other.x, other.y);

            /*if distance is less then the sum of the radius of both circles, then there 
             is an overlap*/
            if (distance - 2 < circle.radius + other.radius) 
            {
              circle.expanding = false;

              //get out of the loop
              break;
            }
          }
        }
      }
    }
    
    //show the circle
    circle.display();
    //expand the circle 
    circle.expandCircle();
  }
}

//function to create new circles for the map
MapCircles newMapCircles() {

  //assign random value to the x and y position of the circles
  float posCircleX= random(width);
  float posCircleY = random(height);

  boolean create = true;
  //for every MapCircle circle in the array list
  for (MapCircles  circle : mapCircles) 
  {
    //calculate distance between position of new circle and of the other circle
    float distance = dist(posCircleX, posCircleY, circle.x, circle.y);
    //if distance is less than the radius, then you can not create a new circle
    if (distance < circle.radius) 
    {
      create = false;
      //get out of the loop once the circle reaches the edge of another circle
      break;
    }
  }

  //if you are able to make a new circle do the following
  if (create == true) 
  {
    //use index formula to get the index of the pixel
    int index = int(posCircleX) + int(posCircleY) * map.width;
    //set the color to that of the pixel
    color col = map.pixels[index];
    //return the new mapCircle
    return new MapCircles(posCircleX, posCircleY, col);
  } 
  else 
  {
    return null;
  }
}
