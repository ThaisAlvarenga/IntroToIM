
// make variables and intialize them with the sizes of the array for the Stars
int sizeStars = 1000;

//make variable of class spaceship
Spaceship spacecraft;

//make varaible of class meteor
Meteor meteor;

//make varaible of class Starbit
StarBit starBit;

//make array of class Star
Star[] stars = new Star[sizeStars];

//make variable of class score
Score score;

void setup()
{
  //set size and background
  size(1000, 700);
  background(0);

  //call constructor for spacecraft
  spacecraft = new Spaceship();

  //call constructor for meteor
  meteor = new Meteor();

  //call constructor for Starbit
  starBit = new StarBit();

  //call constructor for score
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

  //display the Starbit using the function
  starBit.display();

  //update the position of the spacecraft
  spacecraft.updatePosition();

  //show the spacecraft
  spacecraft.show();

  //update the position of the meteor
  meteor.updatePosition();
  //show the meteor
  meteor.show();

  //check if there has been a collision to decrease score
  score.collided();

  //check if player collected Starbits to increase score
  score.collected();

  // check if the spacecraft changed tint from collision
  spacecraft.changeTint();

  //reset tint (I'm doing this because the pushMatric and popMatrix didn't work)
  noTint();

  //check if player collected Starbit to create a new Starbit
  starBit.createStarBit();

  //display current score
  score.display();

  //change position of the stars in the canva
  translate(width/2, height/2);

  //update the position of the stars and show them in the canva
  for (int i = 0; i < sizeStars; i++)
  {
    stars[i].updatePosition();
    stars[i].show();
  }
}
