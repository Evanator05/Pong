class TextBox {
  String text = "";
  float x = 0;
  float y = 0;
  float w = 0;
  float h = 0;
  float fontSize = 100;
  color textColor = color(255,255,255);
  int[] textAlign = {CENTER, CENTER};
  boolean drawBox = false;
 
  TextBox(String text, float x,float y,float w,float h) {
    this.text = text;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }//End of TextBox
  
  void calculateFontSize() {
    textSize(this.fontSize);
    while (textWidth(this.text) > this.w) {
      fontSize -= 1;
      textSize(fontSize);
    }
    while (textWidth(this.text) < this.w) {
      fontSize += 1;
      textSize(fontSize);
    }
    
    fontSize = fontSize * 0.8;
    textSize(fontSize);
    
  }// End of calculateFontSize()
  
  void setTextColour(int r, int g, int b) {
    textColor = color(r,g,b);
  }
  
  void setTextAlign(int hAlign, int vAlign) {
    this.textAlign[0] = hAlign;
    this.textAlign[1] = vAlign;  
}

  void setText(String t){
    this.text = t;
    calculateFontSize();
  }
  
  void drawText() {
    if (drawBox) {
      fill(random(255),random(255),random(255));
      rect(this.x,this.y,this.w,this.h);
    }
    fill(this.textColor);
    textAlign(textAlign[0],textAlign[1]); 
    textSize(fontSize);
    text(this.text, this.x, this.y, this.w, this.h);
  } 
}
