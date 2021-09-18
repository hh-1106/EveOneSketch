class MaskFliter {
  PGraphics mask;
  PGraphics mix;
  int       w, h;

  MaskFliter() {
  }

  MaskFliter(int w, int h) {
    this.w = w;
    this.h = h;
    mask = createMask(w, h);
    mix  = createGraphics(iw, ih);
  }

  PGraphics createMask(int w, int h) {
    PGraphics pg = createGraphics(w, h);
    pg.beginDraw();
    pg.background(0);
    pg.noStroke();
    pg.fill(255);
    pg.ellipse(w/2, h/2, h*0.618, h*0.618);
    pg.endDraw();
    return pg;
  }

  void updateMask() {
    mask.beginDraw();
    float gray = map(mouseX, 0, width, 0, 255);
    mask.background(gray);
    mask.fill(255);
    mask.ellipse(w/2, h/2, h*0.618, h*0.618);
    mask.endDraw();
  }

  void updateMask(int mx, int my) {
  }

  void applyMask() {
    mix.beginDraw();
    mix.image(img, 0, 0);
    mix.endDraw();
    mix.mask(mask);
  }
}
