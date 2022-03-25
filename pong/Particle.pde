class Particle extends GameObject {//used for the particles in the explosion object
  float speed;
  float lifeTime = 3;
  float startingLifetime;
  float side = 25;
  
  Particle(float x, float y, float speed, float angle, float lifeTime) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.angle = radians(angle);
    this.moveX = cos(this.angle)*this.speed;
    this.moveY = sin(this.angle)*this.speed;
    this.side = width/80;
    this.lifeTime = lifeTime;
    this.startingLifetime = 255/lifeTime;
  }
  
  void run() {
    lifeTime -= time.deltaTime;
    this.x += moveX*time.deltaTime;
    this.y += moveY*time.deltaTime;
  }
  
  void paint() {
    fill(255,255-this.speed*2,0,lifeTime*startingLifetime);
    circle(this.x,this.y,this.side);
  }
  
}
