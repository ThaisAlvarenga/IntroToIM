Movie menuVideo;

PImage harryPotter, and, wizardingMaze;

PImage playButton, playHover, exitButton, exitHover;

boolean overPlayButton = false;
boolean overExitbutton = false;

int playPosX = 0;
int playPosY = 50;
int exitPosX = 0;
int exitPosY = 300;

void loadMenuData()
{
  menuVideo = new Movie(this, "THEMARAUDERSMAP.mp4");

  harryPotter = loadImage("titleHarryPotter.png"); 
  and = loadImage("andTitle.png"); 
  wizardingMaze = loadImage("WizardingMaze.png");
}

void movieEvent(Movie menuVideo)
{
  menuVideo.read();
}

void menu()
{
  menuVideo.loop();

  pushMatrix();
  translate((width/2), (height/2));

  pushMatrix();
  scale(1.20);
  image(menuVideo, 0, 0);
  popMatrix();

  image(harryPotter, 0, -300);
  //and.resize(100, 0);
  image(and, 0, -250);
  image(wizardingMaze, 0, -200);

  popMatrix();

  showButtons();
}

void loadButtons()
{
   playButton = loadImage("play.PNG");
   playHover = loadImage("PlayHover.PNG");
   exitButton = loadImage("exit.PNG");
   exitHover = loadImage("exitHover.PNG");
}

void showButtons()
{
  pushMatrix();
  //translate((width/2), (height/2));
  
  checkHover();
  
  if (overPlayButton) {
    image(playHover, width/2 + playPosX, (height/2)+playPosY);
    
  } 
  else {
    image( playButton,width/2 + playPosX, (height/2)+playPosY);
  }
  
  if (overExitbutton) {
    image(exitHover, width/2 + exitPosX, (height/2)+ exitPosY);
    
  } 
  else {
    image(exitButton, width/2 + exitPosX, (height/2)+ exitPosY);
  }
  popMatrix();
}

void checkHover()
{
  //Check hover over the Exit button
    if (dist(mouseX, mouseY,width/2 + playPosX, width/2 + playPosY ) < 150 ) 
  {
    overPlayButton = true;
   // println("Mouse Over");
  } 
  else 
  {
    overPlayButton = false;
  }
  
  //Check hover over the Exit button
  // dimensions of exit button 357 x 96
  if (mouseX >= (width/2 + exitPosX-178) && mouseX <= (width/2 +exitPosX+178) && mouseY >= ((height/2)+ exitPosY-48) && mouseY <= ((height/2)+ exitPosY+48)) 
  {
     overExitbutton = true;
     //println("Mouse Over");
  } 
  else
  {
    overExitbutton = false;
  }

}
