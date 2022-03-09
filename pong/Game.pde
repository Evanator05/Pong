class Game extends Scene {
  TextBox p1ScoreText;
  TextBox p2ScoreText;
  TextBox timerText;
  int score[] = {0,0};
  int test = 0;
  float timer = 30;
  float t = 0;
  void init() {
    //make scoreboard
    p1ScoreText = new TextBox(str(scene.score[0]), width/2-width/20,0,width/30,height/8);
    p1ScoreText.calculateFontSize();
    p1ScoreText.textColor = color(255,255,255);
    
    p2ScoreText = new TextBox(str(scene.score[1]), width/2+width/40,0,width/30,height/8);
    p2ScoreText.calculateFontSize();
    p2ScoreText.textColor = color(255,255,255);
    
    timerText = new TextBox(str(0), 0, 0, width/30, height/10);
    timerText.calculateFontSize();
    timerText.textColor = color(255,255,255);
    
    //create ball and paddles
    objects.clear();
    objects.add(new Paddle(width*1/16, height/2-height*1/10, width*1/60, height*1/5,color(100,0,0), 87, 83, false));
    objects.add(new Paddle(width*15/16-width*1/60, height/2-height*1/10, width*1/60, height*1/5,color(0,0,100), 38, 40, true));
    objects.add(new Ball(width/2,height/2, width/80, boolean(floor(random(2))), color(255,255,0)));
    timer = 30;
  }

  void run() {
    //count down timer
    timer -= time.deltaTime;
    if (timer < 0) {
        objects.add(new Ball(width/2,height/2, width/80, boolean(floor(random(2))), color(255,255,0)));
        timer = 30;
    }
    
    //background
    float xDivisionSize = 64;
    float yDivisionSize = 36;
    float xSize = width/xDivisionSize;
    float ySize = height/yDivisionSize;
    for (int x = 0; x < xDivisionSize; x++) {
      for (int y = 0; y < yDivisionSize; y++) {
        fill((x*y*sin(t*.1))*cos(t*0.1)*0.2,0,((xDivisionSize-x)*(yDivisionSize-y)*sin(t*.1))*cos(t*0.1)*0.2);
        rect(x*xSize,y*ySize,xSize,ySize);
      }
    }

    //draw center line
    int w = 6;
    float x = (width-w)*0.5;
    float y = 0;
    int step = width/16;
    fill(255);
    while (y < width) {
      rect(x,y+step*0.25, w, step*0.5);
      y += step;
    }
    
   //Draw Player Scores
   p1ScoreText.drawText();
   p2ScoreText.drawText();
   t += time.deltaTime;
   timerText.text = str(floor(t));
   timerText.calculateFontSize();
   timerText.drawText();
        
      
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
