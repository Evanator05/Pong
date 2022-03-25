class Explosion extends GameObject {
  
  ArrayList<Particle> particles = new ArrayList<Particle>();
  float lifeTime = 3;
  
  
  Explosion(float x, float y, int particleCount, float lifeTime) {
    this.lifeTime = lifeTime;
    this.x = x;
    this.y = y;
    for (int i = 0; i < particleCount; i++) {
      particles.add(new Particle(this.x,this.y,random(width/40,width/10),random(360), this.lifeTime));
    }
    
  }
  
  void run() {
    this.lifeTime -= time.deltaTime;
    if (this.lifeTime <= 0) {//deletes self if the timer is less than or equal to 0
          for (int n = 0; n < scene.objects.size(); n++) {
            if (scene.objects.get(n) == this) {
              scene.objects.remove(n);
              break;
          }
      }
    }
    for (int i = 0; i < particles.size(); i++) {
      particles.get(i).run();
    }
  }
  
  void paint() {
      for (int i = 0; i < particles.size(); i++) {
      particles.get(i).paint();
    }
  }
  
}
