class MainMenu extends Scene {
  
  Button startButton = new Button(width*3/5,height*2/5,width/5,height/5, "   Play   ", new ChangeScene(new Game()));
  Button toggleAIButton = new Button(width*1/5,height*2/5,width/5,height/5, "Toggle AI", new SetAi());
  
  
  GameObject background = new NightBackground(500);
  
  TextBox pongText = new TextBox("  Pong  ", width/3, 0, width/3, height/3);
  TextBox tabText = new TextBox("Press TAB at any time to return to the main menu", 0, 0, width/2, height/16);
  
  void init(){
    startButton.textBox.setTextColour(0,0,0);
    toggleAIButton.textBox.setTextColour(0,0,0);
    tabText.calculateFontSize();
    tabText.setTextAlign(LEFT, CENTER);
    tabText.setTextColour(255,255,255);
  }
  
  void run(){
    //draw background
    fill(0);
    rect(0,0,width,height);
    
    background.run();
    
    //draw buttons
    startButton.update();
    startButton.paint();
    
    toggleAIButton.update();
    toggleAIButton.paint();
    
    tabText.drawText();
    
    pongText.drawText();
    
    
  }
  
}
