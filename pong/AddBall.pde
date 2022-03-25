class AddBall extends Action {
  void run() {
    scene.objects.add(new Ball(width/2,floor(random(height)), width/80, boolean(floor(random(2))), color(255,255,0))); //spawns a ball at a random height in the midde of the screen
  }
}
