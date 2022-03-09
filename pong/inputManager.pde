class InputManager {
    boolean mouseClicked = false;
    boolean previous = false;
    boolean[] keys = new boolean[256];
    
    boolean MousePressed() {
      if (mousePressed) {
        this.mouseClicked = !this.previous;
        this.previous = true;
      } else {
        this.mouseClicked = false;
        this.previous = false;
      }
      return mouseClicked;
    }
    
}
