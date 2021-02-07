class Spaceship
{
  //create varaible to hold image of the Spaceship
  PImage spaceship;
  //create variables for the x, y position of the spacecraft
  int x, y;
  int speed = 5;
  boolean collided, collected;

  //constructor
  Spaceship()
  {
    //initialize the x and y position at the center
    x = width/2;
    y = height/2;

    //load image of the meteor to the variable
    spaceship = loadImage("SpaceShip.PNG");
  }

  //function to update the position of the spacecraft by tracking the mouse position
  void updatePosition()
  {
    //assign the position of the mouse to the x and y variables of the spaceship
    x = mouseX;
    y = mouseY;
  }

  //show the spaceship in the canvas
  void show()
  {
    //place the cursors at the center of the image
    imageMode(CENTER);
    //draw the spacecraft where the mouse is located
    spaceship.resize(200, 200);
    image(spaceship, x, y );
  }

  //returns true if the player had "collected" the starbit or false if they haven't
  boolean checkCollect()
  {
    //make variable to calculate distance between the spaceship and the Starbit
    float distance = dist(mouseX, mouseY, starBit.xPos, starBit.yPos);
    //radius of space that the starBit occupies
    float radius = 30;

    /*if distance between the starbit and the spaceship is smaller than the radius, 
     then the player has collected the starbit*/
    if (distance < radius)
    {
      return true;
    } 
    //else, player hasn't collected the starbit
    else
    {
      return false;
    }
  }
  //returns true if the player has "collided" with a meteor or false if they haven't
  boolean checkCollide()
  {
    //make variable to calculate distance between the spaceship and the meteor
    float distance = dist(mouseX, mouseY, meteor.x, meteor.y);
    //radius of space that the meteor occupies
    float radius = 100;

    /*if distance between the meteor and the spaceship is smaller than the radius, 
     then the player has collided with the meteor*/
    if (distance < radius)
    {
      return true;
    } 
    //else, player hasn't colleided with the meteor
    else
    {
      return false;
    }
  }

  //change tint of the spaceship to red if the collision happened
  void changeTint()
  {
    collided = checkCollide();
    //collected = checkCollect();

    if (collided == true)
    {
      pushMatrix();
      tint(255, 0, 0);
      image(spaceship, mouseX, mouseY);
      popMatrix();
    }
  }
}
