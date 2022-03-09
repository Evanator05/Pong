class MainMenu extends Scene {
  
  Button startButton = new Button(width*2/5,height*2/5,width/5,height/5, "   Play   ", new ChangeScene(new Game()));
  
  TextBox pongText = new TextBox("  Pong  ", width/3, 0, width/3, height/3);
  void init(){
    startButton.textBox.setTextColour(0,0,0);
  }
  
  void run(){
    //draw background
    fill(0);
    rect(0,0,width,height);
    
    //draw buttons
    startButton.paint();
    startButton.update(input.MousePressed());
    pongText.drawText();
  }
  
}
