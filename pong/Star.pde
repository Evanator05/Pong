class Star extends GameObject {
  int x; //xpos
  int y; //ypos
  float radius; //the default size of the star
  float scale; //multiplied by the radius for when the scale of the star changes 
  float t; //the time that the star has existed for(used to calculate scale)
  float toffset; //offsets the variable t so that not all stars move in sync
  
  Star(int x,int y, float radius, float toffset) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.scale = 1;
    this.t = 0;
    this.toffset = toffset;
  }
  void run() {
    this.t += time.deltaTime;//adds the the t variable
    scale = cos((this.t+toffset)*0.25)+1;//sets the scale of the radius to the cos of t + toffset with the time scale multiplied by .25 so it moves slower
    paint();
  }
  void paint() {
    fill(255,255,255,200);
    circle(this.x, this.y, this.radius*this.scale);
  }
}
