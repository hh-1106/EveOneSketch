class SnowSystem {

  ArrayList<Snow> snows;
  int             snowNum = 5000;

  SnowSystem() {
    snows = new ArrayList<Snow>();
    //for (int i=0; i<snowNum; i++) {
    //  snows.add(new Snow());
    //}
  }

  void update() {

    if (frameCount < 60 * 20) {
      if (frameCount % 5 == 0)
        snows.add(new Snow());
    } else if (snows.size() < snowNum) {
      snows.add(new Snow());
    }

    for (Snow s : snows) {
      s.update();
    }
  }

  void render() {
    for (Snow s : snows) {
      s.render();
    }
  }
}
