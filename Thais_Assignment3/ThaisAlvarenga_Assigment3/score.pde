class Score
{
  //make variable to hold the score
  int score;
  //make variable that will be used to display the score
  String s;
  //variables to check for staBit collection and meteor collisions
  boolean collected, collide;

  //constructor  
  Score()
  {
    //initialize score to 0
    score = 0;
    s = "Score: " + score;
  }

  //increase score if Starbit has been collected
  void collected()
  {
    //assign value returned by spacecraft.checkCollect()
    collected = spacecraft.checkCollect();
    //increase score if starbit was collected
    if (collected == true)
    {
      score ++;
    }

    //upadate s with the new score
    s = "Score: " + score;
  }
  //decrease score if there was a collision with a meteor
  void collided()
  {
    //assign value returned by spacecraft.checkCollide();
    collide = spacecraft.checkCollide();

    //if collided, decrease score until player gets away from the meteor
    if (collide == true)
    {
      score --;
    }

    //upadate s with the new score
    s = "Score: " + score;
  }

  //display the score
  void display()
  {
    //if score is below 0, show the text in red
    if (score < 0)
    {
      textSize(20);
      textAlign(LEFT);
      fill(255, 0, 0);
      text(s, 10, 20);
    } 
    //else show them in white
    else 
    {
      textSize(20);
      textAlign(LEFT);
      fill(255);
      text(s, 10, 20);
    }
  }
}
