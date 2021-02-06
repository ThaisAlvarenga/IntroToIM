class Spaceship
{
  PImage spaceship;
  int x, y;
  int speed = 3;

  Spaceship()
  {
    //initialize variables
    
    //place the starting location of the spaceship
    x = width/2;
    y = height/2 + 100;
    
    //load the image of the spacehip
    spaceship = loadImage("SpaceShip.PNG");
  }

  void Move()
  {
    //change location of the spaceship according to the keys pressed
    if (keyPressed) 
    {
      if (keyCode == DOWN) {
        y+=speed;
      }
      if (keyCode == LEFT) {
        x-=speed;
      }
      if (keyCode == RIGHT) {

        x+=speed;
      }
      if (keyCode == UP) {
        y-=speed;
      }
    }
  }

  void show()
  {
    //place point of reference at the center of the image
    imageMode(CENTER);

    //draw the spacecraft where the mouse is located
    image(spaceship, x, y );
  }
}
