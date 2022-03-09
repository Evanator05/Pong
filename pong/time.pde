class Time {
  float deltaTime = 1;
  float deltaPrevious = 0;
  float gameSpeedScale = 1;
  
  void updateTime() {
    float m = millis();
    deltaTime = (m - deltaPrevious)/1000;
    deltaPrevious = m;
    deltaTime = deltaTime*gameSpeedScale;
  }
}
