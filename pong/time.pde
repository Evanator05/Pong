class Time {
  float deltaTime = 1;
  float deltaPrevious = 0;
  float gameSpeedScale = 1;
  
  void updateTime() { //updates the time it took the cpu to calculate the most recent frame
    float m = millis();
    deltaTime = (m - deltaPrevious)/1000;
    deltaPrevious = m;
    deltaTime = deltaTime*gameSpeedScale;
  }
}
