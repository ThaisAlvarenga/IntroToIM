class Spaceship
{
  PImage spaceship;
  int x, y;
  int speed = 5;

  Spaceship()
  {
    x = width/2;
    y = height/2;
    spaceship = loadImage("SpaceShip.PNG");
  }

  void show()
  {
    //place the cursors at the center of the image
    imageMode(CENTER);
    //draw the spacecraft where the mouse is located
    spaceship.resize(200, 200);
    image(spaceship, mouseX, mouseY);
  }

  boolean checkCollect()
  {

    float distance = dist(mouseX, mouseY, starBit.xPos, starBit.yPos);
    float radius = 30;

    if (distance < radius)
    {
      return true;
    } 
    else
    {
      return false;
    }
  }
}
