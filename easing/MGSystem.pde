class MGSystem {

  ArrayList<MG> mgs;

  MGSystem() {
    mgs = new ArrayList<MG>();

    int m = 100;

    for (int i=0; i<64; i++)
      mgs.add(new Arc(width/2, height/2, random(m, height)));

    //mgs.add(new Taichi(width/2, height/2, 378));
  }

  void update() {
    for (MG mg : mgs) {
      mg.update();
    }
  }

  void render(PGraphics pg) {
    pg.background(WHITE);

    for (MG mg : mgs) {
      mg.render(pg);
    }

    beginBlendDifference(pg);
    for (MG mg : mgs) {
      mg.renderBlendDifference(pg);
    }
    endBlendDifference(pg);
  }

  void beginBlendDifference(PGraphics pg) {
    pg.beginDraw();
    gl.glEnable(GL3.GL_BLEND);
    gl.glBlendFunc(GL3.GL_ONE_MINUS_DST_COLOR, GL3.GL_ZERO);
  }

  void endBlendDifference(PGraphics pg) {
    pg.endDraw();
  }
}
