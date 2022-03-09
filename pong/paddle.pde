class Paddle extends GameObject {
  float x;
  float y;
  float w;
  float h;
  color colour;
  float speed = height;
  int upKey = 18;
  int downKey = 18;
  boolean ai = false;
  
  
  Paddle(float x, float y, float w, float h, color colour, int upKey, int downKey, boolean ai) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.colour = colour;
    this.upKey = upKey;
    this.downKey = downKey;
    this.ai = ai;
  }
  
  float getX() {
    return this.x;
  }
  
  float getY() {
    return this.y;
  }
  float getW() {
    return this.w;
  }
  float getH() {
    return this.h;
  }
  
    color getColour() {
    return this.colour;
  }
  
  GameObject getNearestBall() {
    GameObject nearestBall = null;//set the default nearest ball to null
    for (int i = 0; i < scene.objects.size(); i++) { //Get all paddles and check their collisions
      if (scene.objects.get(i) instanceof Ball) {//if the object is a ball
        GameObject ball = scene.objects.get(i);
        if (nearestBall == null) {//there is no ball in the variable pick the first ball found
          nearestBall = ball;
        } else {//otherwise pick the new ball if its closer to the paddle
          float oldBallDistance = (this.x - nearestBall.getX());
          float newBallDistance = (this.x - ball.getX());     
          if (abs(newBallDistance) < abs(oldBallDistance)) {//check if the new ball is closer
            nearestBall = ball;
          }
        }
      }
    }
    return nearestBall;
  };
  
  void run(){
    int dir = int(input.keys[downKey]) - int(input.keys[upKey]);
    if (ai) {
      GameObject ball = getNearestBall();
      if (ball != null) {
      float ballPos = ball.getY();
      dir = int(ballPos >= this.y+this.h/2) - int(ballPos <= this.y+this.h/2);
      }
    }
    this.y += this.speed*dir*time.deltaTime;
    this.y = constrain(this.y, 0, height-this.h);
  }
  
  void paint(){
    fill(this.colour);
    rect(this.x, this.y, this.w, this.h);
  }
}
