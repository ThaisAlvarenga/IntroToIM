/*
  This is my second homework for INTRO TO IM!
 Assigment: Object Oriented Programming
 
 This program was written by Thais Alvarenga 
 25th January 2021
 */


// make variables and intialize them with the sizes of the arrays
int sizeStars = 1000;
//int sizeMeteors = 2;

Star[] stars = new Star[sizeStars];
//Meteor[] meteors = new Meteor[sizeMeteors];

Spaceship spacecraft;
Meteor meteor;


void setup()
{
  size(1000, 700);
  background(0);

  spacecraft = new Spaceship();
  meteor = new Meteor();

  /*
  //create a meteor object for each element in the array
   for (int j = 0; j < sizeMeteors; j++)
   {
   meteors[j] = new Meteor();
   }
   */
  //create a Star object for each element in the array
  for (int i = 0; i < sizeStars; i++)
  {
    stars[i]= new Star();
  }
}

void draw()
{
  background(0);

  meteor.updatePosition();
  meteor.show();

  /*
  for (int j = 0; j < sizeMeteors; j++)
   {
   meteors[j].updatePosition();
   meteors[j].show();
   }
   */

  spacecraft.Move();
  spacecraft.show();

  translate(width/2, height/2);

  for (int i = 0; i < sizeStars; i++)
  {
    stars[i].updatePosition();
    stars[i].show();
  }
}
