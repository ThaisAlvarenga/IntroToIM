class Score
{
  int score;
  String s;
  boolean collected;

  Score()
  {
    score = 0;
    s = "Score: " + score;
  }
  
  void collected()
  {
    collected = spacecraft.checkCollect();
    if (collected == true)
    {
      score ++;
    }
  }
  
  void display()
  {
    textSize(12);
    textAlign(LEFT);
    fill(255);
    text(s, 10, 20);
  }
}
