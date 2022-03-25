class GameObject {
  float x;
  float y;
  float w;
  float h;
  float moveX;
  float moveY;
  float side;
  color colour;
  float angle;
  void run(){}
  void paint(){}
  float getX() { return this.x; }
  float getMoveX() { return this.moveX; }
  float getY() { return this.y; }
  float getW() { return this.w; }
  float getH() { return this.h; }
  color getColour() { return this.colour; }
  float getSide() { return this.side; }
  void setAngle(float a) { this.angle = a; }
}
