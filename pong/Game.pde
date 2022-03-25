class Game extends Scene {
  TextBox p1ScoreText;
  TextBox p2ScoreText;
  int score[] = {0,0};
  float timer = 30;
  NightBackground background = new NightBackground(200);
  
  void init() {
    //make scoreboard
    p1ScoreText = new TextBox(str(scene.score[0]), width/2-width/20,0,width/30,height/8);
    p1ScoreText.calculateFontSize();
    p1ScoreText.textColor = color(255,255,255);
    p2ScoreText = new TextBox(str(scene.score[1]), width/2+width/40,0,width/30,height/8);
    p2ScoreText.calculateFontSize();
    p2ScoreText.textColor = color(255,255,255);
    //create ball and paddles
    objects.clear();
    objects.add(new Paddle(width*1/16, height/2-height*1/10, width*1/60, height*1/5,color(100,0,0), 87, 83, false));
    objects.add(new Paddle(width*15/16-width*1/60, height/2-height*1/10, width*1/60, height*1/5,color(0,0,100), 38, 40, Ai));
    objects.add(new Ball(width/2,height/2, width/80, boolean(floor(random(2))), color(255,255,0)));
    timer = 30;
  }
  void addPowerUp() {
    Action powerUps[] = {new AddBall()}; //A list of all the available powerups
    objects.add(new PowerUp(width/2-50, random(0,height), 100, 100, powerUps[floor(random(powerUps.length))])); //creates a powerup object that does a thing from the powerups list when triggered
  }
  void run() {
    //count down timer
    timer -= time.deltaTime; //counts down the timer
    if (timer < 0) {
        addPowerUp();
        timer = 20; //resets the timer to 20 seconds
    }
    //background
    fill(0);
    rect(0,0,width,height);
    background.run();
    //draw center line
    int w = 6;
    float x = (width-w)*0.5;
    int step = width/16;
    fill(255);
    for (int y = 0; y < width; y += step) {
      rect(x,y+step*0.25, w, step*0.5);
    }
   //Draw Player Scores
   p1ScoreText.text = str(scene.score[0]);
   p1ScoreText.calculateFontSize();
   p2ScoreText.text = str(scene.score[1]);
   p2ScoreText.calculateFontSize();
   p1ScoreText.drawText();
   p2ScoreText.drawText();
   //run objects
   for (int i = 0; i < objects.size(); i++) {
     objects.get(i).run();
   }
   //draw objects
   for (int i = 0; i < objects.size(); i++) {
     objects.get(i).paint();
   }
  }
}
