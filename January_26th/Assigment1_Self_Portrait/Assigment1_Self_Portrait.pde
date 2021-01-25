/*
  This is my first homework for INTRO TO IM!
  Assigment: Self-portrait
  
  This program was written by Thais Alvarenga 
  25th January 2021
*/

void setup(){
  
//set the size of the canva
size(800, 800);

//variable that will contain the background image
PImage img; 
//assign the image to the variable
img = loadImage("Background.JPG"); 

//display the image
image(img, 0, 0);

}

void draw()
{
  // create variable to hold the rgb values
  float red, green, blue;
  
  //assign a random value to the variables
  red = random(255);
  green = random(255);
  blue = random(255);
  
  //use the variables to determine the color of the circles
  stroke(red, green, blue);
  fill(red, green, blue);
  
  //create variables that hold the x and y position of the circles
  float x = random(width);
  float y = random(height);
  
  //create a variable to hold the size of the circles
  float size;
  //assign a random value to the size (between 0 and 100)
  size = random(100);
  
  //draw the circles
  ellipse(x, y, size, size);
  
  //set the stroke weight and its color back to the default
  stroke(0);
  strokeWeight(1);
  
  //BACK HAIR
  
  //set the color of the hair
  fill(112,66,65);
  
  //make the circles for the segment of hair
  ellipse(200, 350, 100, 100);
  ellipse(200, 400, 100, 100);
  ellipse(230, 450, 100, 100);
  ellipse(270, 510, 100, 100);
  ellipse(550, 450, 100, 100);
  ellipse(590, 350, 100, 100);
  ellipse(590, 390, 100, 100);
  
  //set the fill to a skin tone
  fill(247, 225, 211);
  
  //RIGHT EAR
  arc(560, 380, 100, 125, -PI / 2, 3 * PI / 2);
  /*I placed the ear before the face because it should be behind
  the ellipse that makes the faceshape*/

  //FACE

  //shape of the face
  ellipseMode(CENTER); //setting the 0,0 position of the circle to center of the canva
  ellipse(400, 400, 350, 500);

  //LEFT EAR
  arc(240, 380, 100, 125, PI / 2, 3 * PI / 2);

  //FRONT HAIR
  
  //set the color of the front hair
  fill(112,66,65);

  //draw the front section of the hair
  ellipse(200, 310, 100, 100);
  ellipse(230, 250, 100, 100);
  ellipse(250, 320, 100, 100);
  ellipse(300, 200, 100, 100);
  ellipse(300, 250, 100, 100);
  ellipse(350, 200, 100, 100);
  ellipse(400, 160, 100, 100);
  ellipse(400, 250, 100, 100);
  ellipse(450, 200, 100, 100);
  ellipse(500, 240, 100, 100);
  ellipse(540, 220, 100, 100);
  ellipse(550, 320, 100, 100);
  ellipse(540, 100, 100, 100);
  ellipse(600, 290, 100, 100);
  
  //RIGHT EYE with the shape of a rose
  
  //make flower-eye color pink
  fill(255, 192, 203);
  stroke(255, 192, 203);
  
  //eye shape formula
  beginShape();
  for(float i = 0; i < TWO_PI; i += 0.05 )
  {
    float r = 100*cos(4*i);
    float x_position = 350 + r*cos(i);
    float y_position = 355 + r*sin(i);
    vertex(x_position,y_position);
  }
  endShape(CLOSE);
  
  //center of the flower
  strokeWeight(20);
  stroke(255, 141, 56);
  point(350, 355);
  
  //set the color of the stroke to black
  stroke(0);
  //set the fill of the shape to none
  noFill();

  //LEFT EYE
  strokeWeight(4);
  arc(510, 350, 70, 50, 0, PI);
  
  //EYELASHES
  line(540, 365, 545, 380);
  line(530, 370, 535, 385);
  line(520, 375, 520, 390);
  line(510, 375, 510, 390);
  line(500, 375, 497, 390);
  line(490, 370, 485, 385);
  line(480, 365, 475, 375);
  
  //NOSE
  //set the weight of the stroke to the default
  strokeWeight(1);
  //shape of the nose
  bezier(480, 290, 400, 300, 500, 550, 400, 500);
  
  /*
  Testing of points for the nose
  strokeWeight(8);
  point(480, 250);
  point(430, 300);
  point(420, 500);
  point(390, 495);
  */
  
  /*
  This is another nose I made.
  I liked the curve from Bezier better so I used that one.
  
  beginShape();
  curveVertex(480, 250);
  curveVertex(430, 300);
  curveVertex(420, 500);
  curveVertex(390, 495);
  endShape();
  
  line(420, 500, 400, 500);
  */
  
  //MOUTH
  curve(250, 480, 350, 550, 450, 550, 550, 480);
  
  //GLASSES
  
  //make the frames thicker 
  strokeWeight(4);
  
  ellipse(523, 400, 150, 100); //frame of the glasses 
  arc(432, 400, 30, 30, -PI, 0); // bridge of the glasses
 
  }
