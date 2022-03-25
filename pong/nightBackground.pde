class NightBackground extends GameObject {
  ArrayList<GameObject> stars = new ArrayList<GameObject>();

  
  NightBackground(int starCount) {
    for (int i = 0; i < starCount; i++) {//creates a certain amount of stars in random positions, the amount of stars created is dictated by starCount
      stars.add(new Star(floor(random(0,width)),floor(random(0,height)), random(10), random(360)));
    }
  }
  
  void run() {
    for (int i = 0; i < stars.size(); i++) {
      stars.get(i).run();
    }
  }
  
}
