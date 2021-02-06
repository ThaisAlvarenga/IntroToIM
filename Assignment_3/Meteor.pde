class Meteor 
{
  PImage meteor;
  //create variables for the x, y and z position of the stars
  float x, y, z;

  Meteor()
  {
    meteor = loadImage("meteor.PNG");

    //initialize the position of the meteir at random locations
    //x = random(width);
    //y = random(height);
    
    //testing at the center
    x = width/2;
    y = height/2;
    z = random(width);
  }

  //function to update the position of the stars as they move
  void updatePosition()
  {
    //changing the z position 
    z = z - 20;
    
    // re-set the positions
    if (z < 1)
    {
      x = width/2; //random(-width, width);
      y = height/2; //random(-height, height);
      z = width;
    }
  }

  //show the meteor in the canvas

  void show()
  {
    //make caria ble for the size of the meteor 
    int size = round(map(z, 1, 2*width, 250, 1));
    
    meteor.resize(size, size);
    
    //show the meteor
    image(meteor, x, y);
  }
}
