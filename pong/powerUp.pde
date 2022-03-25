class PowerUp extends GameObject {
  
  float x,y,w,h;
  Action powerUp;
  color colour = color(255,0,0,200);
  
  PowerUp(float x, float y, float w, float h, Action powerUp) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.powerUp = powerUp;
  }
  
  void run() {
    for (int i = 0; i < scene.objects.size(); i++) { //Get all balls and check their collisions
      if (scene.objects.get(i) instanceof Ball) {
        GameObject ball = scene.objects.get(i);
        float ballX = ball.getX();
        float ballY = ball.getY();
        float ballS = ball.getSide();
        if (collision(ballX,ballY,ballS,ballS,this.x,this.y,this.w,this.h)) {//if there is a collision use the powerup and then delete itself
          powerUp.run();
          for (int n = 0; n < scene.objects.size(); n++) {//finds itself in the objects list and removes itself
            if (scene.objects.get(n) == this) {
              scene.objects.remove(n);
              break;
            }
          }
        }
      }
    }    
  }
  
  boolean collision(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2) {//checks if 2 objects are overlapping
    boolean xCheck = (x1 < x2+w2 && x1+w1 > x2);
    boolean yCheck = (y1 < y2+h2 && y1+h1 > y2);
    return (xCheck && yCheck);
  }

  void paint() {
    fill(this.colour);
    rect(this.x,this.y,this.w,this.h);
  }
  
}
