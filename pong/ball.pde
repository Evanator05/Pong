class Ball extends GameObject{
  float x;
  float y;
  float side = 25;
  float speed = 300;
  float angle = 45;
  color colour = color(255,255,255);
  
  IntList xtrail = new IntList();
  IntList ytrail = new IntList();
  
  Ball(int x, int y, float side, boolean dir, color colour) {
    this.x = x;
    this.y = y;
    this.side = side;
    this.colour = colour;
    this.angle = random(90)-45+(180*int(dir));
}
    float getX() {
    return this.x;
  }
  
  float getY() {
    return this.y;
  }
  void run() {
    for (int i = 0; i < scene.objects.size(); i++) { //Get all paddles and check their collisions
      if (scene.objects.get(i) instanceof Paddle) {
        GameObject paddle = scene.objects.get(i);
        
        float paddleX = paddle.getX();
        float paddleY = paddle.getY();
        float paddleW = paddle.getW();
        float paddleH = paddle.getH();
        
        Boolean xCheck = ((this.x+this.side/2) > paddleX && this.x-this.side/2 < (paddleX+paddleW));
        Boolean yCheck = ((this.y+this.side/2) > paddleY && this.y-this.side/2 < (paddleY+paddleH));
        
        if (xCheck && yCheck) {
          this.angle = getAngleTo(this.x,this.y,paddleX+paddleW/2,paddleY+paddleH/2);
          this.speed += 20;
          this.colour = paddle.getColour();
          if (this.x < width/2) {
            this.x = paddleX+paddleW+this.side/2;
          } else {
            this.x = paddleX-this.side/2;
          }
        }
           
      };
    }
    
    float moveX = cos(radians(this.angle))*this.speed*time.deltaTime;
    float moveY = sin(radians(this.angle))*this.speed*time.deltaTime;
    
    this.x += moveX;
    this.y += moveY;  
    
    if (this.y-this.side/2 <= 0 || this.y+this.side/2 >= height) {
      this.angle = -this.angle;
      this.y = constrain(this.y, 0+(this.side/2), height-(this.side/2)); //keep ball inside the screen
    }
    
    if (this.x <= 0-(this.side/2) || this.x >= width+(this.side/2)) {
      if (this.x < width/2) {
        scene.score[1] += 1;
      } else {
        scene.score[0] += 1;
      }
      
      scene.init();
    }
        
    //add to ball trail
    xtrail.append(round(this.x));
    ytrail.append(round(this.y));
    
  }
  
  float getAngleTo(float x1,float y1,float x2,float y2) {
    float angle = atan((y1-y2)/(x1-x2)) + radians(180)*int((x1<x2));
    return degrees(angle);
  };
  
  
  
  void paint() {
    
    for (float i = 0; i < xtrail.size(); i++) {
      fill(this.colour/2,i/float(xtrail.size())*255);
      float size = (this.side*(i/(xtrail.size()-1)));
      circle(xtrail.get(round(i)),ytrail.get(round(i)),size);
    }
    fill(this.colour);
    circle(this.x,this.y,this.side);
    if (xtrail.size() > this.speed * 20*time.deltaTime) {
      xtrail.remove(0);
      ytrail.remove(0);
    }
  }

}
