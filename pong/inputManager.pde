class InputManager {
    boolean mouseClicked = false;
    boolean previous = false;
    boolean[] keys = new boolean[256];
    
    boolean updateMouse() {//ensures that the mouse only stays clicked for 1 frame
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
