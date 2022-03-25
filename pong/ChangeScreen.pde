class ChangeScreen extends Scene {

  GameObject background = new NightBackground(500);
  
  TextBox pongText = new TextBox("  Please relaunch the game in landscape mode  ", 0, 0, width, height);

  
  void init(){
    pongText.calculateFontSize();

  }
  
  void run(){
    //draw background
    fill(0);
    rect(0,0,width,height);
    
    background.run();
 
    pongText.drawText();

  }
}
