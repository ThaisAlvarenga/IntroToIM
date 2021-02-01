/*
  This is my second homework for INTRO TO IM!
  Assigment: Art using loops
  
  This program was written by Thais Alvarenga 
  25th January 2021
*/

//make an array of the class rainDrop
rainDrop drops[];

//size of canva
int w= 1000;
int h = 700;

//size of the array
int size = 500;

//creatae variables to hold the image of the dunes
PImage dunes;

public void settings()
{
  //declare size of the canva
  size(w, h);
  
  //load the image
  dunes = loadImage("DUNES_1.PNG");
  
}

void setup()
{
  //make the background color blue
  background(70,130,180);
  //display image of dunes
  image(dunes, 0, 0);
  
  //make 500 elements in the drops array
  drops = new rainDrop[size];
  
  //create a drop for each element in the array
  for(int i=0; i < size; i++)
  {
    drops[i] = new rainDrop();
  }
}

void draw()
{
  
  //re-draw the background
  background(70,130,180); 
  //show image of the dunes
  image(dunes, 0, 0);
  
  //draw all of the raindrops with their falling positiong or with their ripples
  for(int i=0; i < size; i++)
  {
    //if their falling position is same as their endDrop 
    if(drops[i].yPosition > drops[i].endDrop)
    {
      //create riplles for the drop
      drops[i].ripples();
    }
    else
    {
      //call the show funciton of the class to show the drop falling
      drops[i].show();
    }
  }
}
