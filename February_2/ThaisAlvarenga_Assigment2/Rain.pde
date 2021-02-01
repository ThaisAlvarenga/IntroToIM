class rainDrop
{
  //variables for the drop
  float xPosition, yPosition, speed;
  //variables for the ripples
  float xRipple = 0, yRipple = 0, endDrop;
  //color of the rain
  color white = 255;
  
  rainDrop()
  {
    //assign a position to the raindrop horizontally
    xPosition = random(width);
    /*assign a position veritcally. I use -200 to that 
    it is outside the canva at the beginning. I placed 
    a greater range in here than in the reset function 
    because the rain falls in badges and the initial 
    one is closer together than the rest so I need to space
    them out for them to look like the following ones.
    
    I know this explanation is not the best but you can change
    to random(-500 , 0); to see the difference*/
    yPosition = random(-1000, 0);
    
    //assign a speed to the drop
    speed = random(3, 20);
    
    //initialize the values of the ripples to 0
    xRipple = 0;
    yRipple = 0;
    
    /*generate an end position for the drop (point at which it 
    touches a surface)*/
    endDrop = height - 200 + random(190);
  }
  
  //resets all the values of the drop element
  void reset()
  {
    //assign a position to the raindrop horizontally
    xPosition = random(width);
    /*assign a position veritcally. I use -200 to that 
    it is outside the canva at the beginning*/
    yPosition = random(-200, 0);
    
    //assign a speed to the drop
    speed = random(3, 20);
    
    //initialize the values of the ripples to 0
    xRipple = 0;
    yRipple = 0;
    
    /*generate an end position for the drop (point at which it 
    touches a surface)*/
    endDrop = height - 200 + random(190);
  }
  
  //function will update the y position of the drop as it falls
  void fallPosition()
  {
    //increate the y position by the speed as the drop falls
    yPosition += speed;
    
    //re-set the yPosition when the drop reaches the ground
    if(yPosition > height)
    {
      yPosition = random(-200, 0);
    }
  }
  
  void show()
  {
    //map speed with mouse to be able to slow down
    speed = map(mouseY, 0, width, 0, 15);
    
    //make color of the drop white
    stroke(white);
    //make drop stroke small
    strokeWeight(0.5);
    rect(xPosition, yPosition, 1, 10);
    
    //I tried to use a stroke but it made the drops too big
    
    /*I tried doing 
        stroke(white);
        strokeWeight(1);
        line(xPosition, yPosition, 1, 10); 
    instead of what I did above and it gave a very interesting result
    */
    
    //update the position that the drop is at
    fallPosition();
  }
  
  //function for when the drop touches the ground which creates ripples
  
  void ripples()
  {
    //map speed with mouse to be able to slow down
    speed = map(mouseY, 0, width, 0, 15);
    
    //make the ripples white
    stroke(white);
    //the ellipses that make the circle should be empty
    noFill();
    
    //draw the ripple using ellipse function
    ellipse(xPosition, yPosition, xRipple, yRipple);
    
    //make the ripple grow by changing the diameters
    xRipple += speed; 
    /*I had to divide speed by half because if not,
    the ripple would be a perfect circle*/
    yRipple += speed/2;
    
    //reset the drop once the ripple reaches its maximum size
    if(xRipple > 50)
    {
      reset();
    }
  }
  
}
