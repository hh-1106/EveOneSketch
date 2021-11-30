class MGSystem {

  ArrayList<MG>       mgs;
  boolean           black;

  MGSystem() {
    mgs   = new ArrayList<MG>();
    black = true;
  }

  void update() {
    for (int i = mgs.size() - 1; i > -1; i--) {
      MG mg = mgs.get(i);
      mg.update();

      if (mg.done) {
        mgs.remove(i);
        mg.fade();
      }
    }
  }

  void render(PGraphics pg) {
    pg.beginDraw();
    pg.background(this.black ?BLACK :WHITE);

    pg.strokeCap(SQUARE);
    pg.blendMode(DIFFERENCE);

    for (MG mg : mgs) {
      mg.render(pg);
    }

    pg.endDraw();
  }

  void addMG (MG mg) {
    this.mgs.add(mg);
  }

  void reverse() {
    black = !black;
  }
}
