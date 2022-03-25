Scene scene;
InputManager input = new InputManager();
Time time = new Time();
boolean Ai = true; //determines if the right paddle will be an AI or not

void setup() {
  fullScreen();
  frameRate(60);
  strokeWeight(0);
  changeScene(new MainMenu());
}
void keyPressed() {input.keys[keyCode] = true;}
void keyReleased() {input.keys[keyCode] = false;}

void draw() {
  if (input.keys[9]) { // TAB
    changeScene(new MainMenu());
  }
  int timeScaleDir = int(input.keys[61]) - int(input.keys[45]); //returns 1 if + is pressed -1 if - is pressed and 0 if none are pressed or if both are pressed
  time.gameSpeedScale += time.deltaTime*timeScaleDir; //adds to the timescale
  //time scale controls  
  if (input.keys[48]) { // 0 key
    time.gameSpeedScale = 1; //resets timescale back to 1
  }
  time.updateTime();
  input.updateMouse();//updates the mouse clicking for that frame
  scene.run();
}
void changeScene(Scene s) {
  scene = s;//sets the games scene to s
  scene.init();//then runs that scenes initialization code
  println("Changed Scene To: " + s);
}
