Scene scene;
InputManager input = new InputManager();
Time time = new Time();
void setup() {
  fullScreen();
  frameRate(60);
  strokeWeight(0);
  changeScene(new MainMenu());
}

void keyPressed() {
   input.keys[keyCode] = true;

}

void keyReleased() {
   input.keys[keyCode] = false;
}

void draw() {
  if (input.keys[9]) { // TAB
    changeScene(new MainMenu());
  }
  
  //time scale controls
  if (input.keys[61]) { // + key
    time.gameSpeedScale += time.deltaTime;
  }
  
  if (input.keys[45]) {// - key
    time.gameSpeedScale -= time.deltaTime;
  }

  time.updateTime();
  scene.run();
  
}


void changeScene(Scene s) {
  scene = s;
  scene.init();
  println("Changed Scene To: " + s);
}
