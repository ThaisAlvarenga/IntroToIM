
// make variables and intialize them with the sizes of the arrays
int sizeStars = 1000;

Spaceship spacecraft;

Star[] stars = new Star[sizeStars];
StarBit starBit;

Score score;

void setup()
{
  size(1000, 700);
  background(0);

  spacecraft = new Spaceship();

  starBit = new StarBit();

  score = new Score();

  //create a Star object for each element in the array
  for (int i = 0; i < sizeStars; i++)
  {
    stars[i]= new Star();
  }
}

void draw()
{
  background(0);

  starBit.display();

  spacecraft.show();

  starBit.collected();

  score.display();

  translate(width/2, height/2);
  
  println(starBit.collected);

  //println("x =" + mouseX + " y ="+ mouseY);

  for (int i = 0; i < sizeStars; i++)
  {
    stars[i].updatePosition();
    stars[i].show();
  }
}
