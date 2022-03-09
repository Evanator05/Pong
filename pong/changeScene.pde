class ChangeScene extends Action {
  Scene s;
  
  ChangeScene(Scene s) {
    this.s = s;
  }
  
  void run() {
    changeScene(s);
  }
}
