class Meteor
{
  //create varaible to hold image of the meteor
  PImage meteor;
  //create variables for the x, y and z position of the stars
  float x, y, z;
  //create variable to hold the direction (speed) at which the meteor will move
  float xDir, yDir;

  //constructor
  Meteor()
  {
    //load image of the meteor to the variable
    meteor = loadImage("meteor.PNG");

    //initialize the position of the meteor at random location
    x = random(width);
    //y can be left at 0 because the image size is 0 at the beginning
    y = 0;

    //assign random speed in the y direction
    yDir = random(7, 20);

    /*assign random speed in the x position depending on whether the value of x is
     less than the width*/
    if (x < width/2) {
      xDir = random(7, 20);
    } else {
      xDir = random(-20, -7);
    }

    //testing at the center
    //x = width/2;
    //y = height/2;

    //assign random value to z
    z = random(width);
  }

  //function to reset the values of Meteor
  void reset()
  {
    x = random(width);
    y = 0;
    z = width;

    yDir = random(7, 20);
    if (x < width/2) {
      xDir = random(7, 20);
    } else {
      xDir = random(-20, -7);
    }
  }

  //function to update the position of the stars as they move
  void updatePosition()
  {
    //add speed to x and y 
    x += xDir;
    y += yDir;
    //changing the z position
    z = z - 10;

    // re-set the positions
    if (z < 0)
    {
      reset();
    }
  }

  //show the meteor in the canvas

  void show()
  {
    //make variable that increases the size of the meteor as it travels through the screen
    float size = map(z, 0, width, 0.8, 0.02);
    //limit how bit the size can get 
    size = constrain(size, 0.02, 0.8);

    //show the image
    pushMatrix();

    //translate to position of meteor so that it scales at the center of the image
    translate(x, y);
    //scale the meteor to its current size
    scale(size);
    //show the meteor

    //center the image 
    pushStyle();
    imageMode(CENTER);
    image(meteor, 0, 0);
    popStyle();

    popMatrix();
  }
}
