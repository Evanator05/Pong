class Button {
  int x, y, w, h;
  Action action;
  TextBox textBox;
  color buttonColour = color(255,255,255);
  
  Button(int x, int y, int w, int h, String text, Action action) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.action = action;
    this.textBox = new TextBox(text, x, y, w, h);
    this.textBox.calculateFontSize();
  }

  void paint() {
    fill(buttonColour);
    rect(x,y,w,h);
    textBox.drawText();
  }

  boolean inRect() {//checks if the mouse is in the button
    boolean xCheck = (mouseX > this.x && mouseX < this.x + this.w);
    boolean yCheck = (mouseY > this.y && mouseY < this.y + this.h);
    return (xCheck && yCheck);
  }

  void update() {
    if (inRect() && input.mouseClicked) {
      println("working");
      click();
    } 
  }
  
  void click() {
    try {
      action.run();
    } catch(NullPointerException e) {
      println(e);
    }
  }

}
