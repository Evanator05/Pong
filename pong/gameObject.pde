class GameObject {
  float x;
  float y;
  float w;
  float h;
  color colour = color(0,0,0);
  
  void run(){}
  void paint(){}
  
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
}
