class TaiChiSystem {

  ArrayList<Taichi> ts;

  TaiChiSystem() {
    ts = new ArrayList<Taichi>();

    int m = 100;
    //for (int i=0; i<10; i++)
    //  ts.add(new Taichi(random(m, width-m), random(m, height-m), random(200, 500)));

    ts.add(new Taichi(width/2, height/2, 378));
  }

  void update() {
    for (Taichi t : ts) {
      t.update();
    }
  }

  void render(PGraphics pg) {
    pg.background(WHITE);

    for (Taichi t : ts) {
      t.render(pg);
    }

    beginBlendDifference(pg);
    for (Taichi t : ts) {
      t.renderBlendDifference(pg);
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
