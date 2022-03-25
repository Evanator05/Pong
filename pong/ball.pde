class Ball extends GameObject{
  float speed = 300;//the balls speed
  IntList xtrail = new IntList();//holds the x values of the balls trail
  IntList ytrail = new IntList();//holds the y values of the balls trail
  
  Ball(int x, int y, float side, boolean dir, color colour) {
    this.x = x;
    this.y = y;
    this.side = side;
    this.colour = colour;
    setAngle(random(90)-45+(180*int(dir)));//Sets the balls angle to be a random angle that goes 45 degrees up or down
  }
  void setAngle(float a) {
    moveX = cos(radians(a))*this.speed;//sets moveX to the x component of the balls velocity
    moveY = sin(radians(a))*this.speed;//sets moveY to the y component of the balls velocity
  }
  void run() {
    for (int i = 0; i < scene.objects.size(); i++) { //Get all objects and for specific objects check for collisions
      if (scene.objects.get(i) instanceof Paddle) {//paddle collisions
        GameObject paddle = scene.objects.get(i);
        
        float paddleX = paddle.getX();
        float paddleY = paddle.getY();
        float paddleW = paddle.getW();
        float paddleH = paddle.getH();
        Boolean xCheck = ((this.x+this.side/2) > paddleX && this.x-this.side/2 < (paddleX+paddleW));//checks if the ball is in the xaxis
        Boolean yCheck = ((this.y+this.side/2) > paddleY && this.y-this.side/2 < (paddleY+paddleH));//checks if the ball is in the yaxis
        
        if (xCheck && yCheck) {//only run this code if both the x and y axis align
          setAngle(getAngleTo(this.x,this.y,paddleX+paddleW/2,paddleY+paddleH/2));//sets the balls angle to the opposite of the paddles center
          this.speed += 20;//add 20 to the balls speed
          this.colour = paddle.getColour();//sets the balls colour to the paddles colour
          if (this.x < width/2) {//checks which side of the screen the ball is on then sets its position to the front of that sides paddle
            this.x = paddleX+paddleW+this.side/2;
          } else {
            this.x = paddleX-this.side/2;
          }
        }
      }
      if (scene.objects.get(i) instanceof Ball) {//ball collisions
        GameObject ball = scene.objects.get(i);
        
        if (ball != this) {        
          float ballX = ball.getX();
          float ballY = ball.getY();
          float ballW = ball.getSide();
          float ballH = ball.getH();
          
          Boolean xCheck = ((this.x+this.side/2) > ballX && this.x-this.side/2 < (ballX+ballW));//checks if the ball is in the xaxis
          Boolean yCheck = ((this.y+this.side/2) > ballY && this.y-this.side/2 < (ballY+ballH));//checks if the ball is in the yaxis
          
          if (xCheck && yCheck) {//only run this code if both the x and y axis align
            float angle = getAngleTo(this.x,this.y,ballX,ballY); 
            setAngle(angle);//set this balls variable to 180 degrees the other direction of the other ball
            ball.setAngle(angle-180);//does the same with the other ball
          }
       } 
      }
    }

    this.x += moveX*time.deltaTime;//adds the balls x velocity to the x pos
    this.y += moveY*time.deltaTime;//adds the balls y velocity to the y pos
    
    if (this.y-this.side/2 <= 0 || this.y+this.side/2 >= height) {//bounce off of the floor and ceiling
      moveY *= -1;
      this.y = constrain(this.y, 0+(this.side/2), height-(this.side/2)); //keep ball inside the screen
    }
    
    if (this.x <= 0-(this.side/2) || this.x >= width+(this.side/2)) {//score in either of the goals
      scoreGoal();
    }//end of score checking
        
    //add to ball trail
    xtrail.append(round(this.x));
    ytrail.append(round(this.y)); 
  }
  
  float getAngleTo(float x1,float y1,float x2,float y2) {
    float a = atan((y1-y2)/(x1-x2)) + radians(180)*int((x1<x2));
    return degrees(a);
  };
  
  void scoreGoal() {
        if (this.x < width/2) {//check which side of the screen the ball is on and score on that sides corresponding goal
        scene.score[1] += 1;
      } else {
        scene.score[0] += 1;
      }
      int ballCount = 0;
      for (int i = 0; i < scene.objects.size(); i++) {//if a ball is detected add 1 to ballCount
        if (scene.objects.get(i) instanceof Ball) {
          ballCount += 1;
        }
      }
      if (ballCount-1 == 0) {//if there are no balls left spawn a new ball
        scene.objects.add(new Ball(width/2,height/2, width/80, boolean(floor(random(2))), color(255,255,0)));
      }
      
      scene.objects.add(new Explosion(this.x, this.y, 100, 5));//create explosion effect when scoring
      
      for (int n = 0; n < scene.objects.size(); n++) {
            if (scene.objects.get(n) == this) {
              scene.objects.remove(n);
              break;
          }
      }
  }
  
  void paint() {
    for (float i = 0; i < xtrail.size(); i++) {//draw the balls trail
      fill(this.colour/2,i/float(xtrail.size())*255);//sets the trails colour to the balls colour and its opacity to its position in the array(the first element is 100% opacity and the last element is 0% opacity)
      float size = (this.side*(i/(xtrail.size()-1)));//set the balls size based on its % position in the array(the first element is 100% size and the last element is 0% size)
      circle(xtrail.get(round(i)),ytrail.get(round(i)),size);//draws the current trail index
    }
    fill(this.colour);
    circle(this.x,this.y,this.side);//draws the ball
    if (xtrail.size() > this.speed * 20*time.deltaTime) {//removes the last element in the trail array if the trail is too long
      xtrail.remove(0);
      ytrail.remove(0);
    }
  }

}
