class CircleMaskFliter extends MaskFliter {

  CircleMaskFliter(int w, int h) {
    super(w, h);
  }

  void updateMask() {
    mask.beginDraw();
    mask.pushMatrix();
    mask.background(0);
    mask.fill(255);
    float x = map(mouseX, 0, width, 0, w);
    float y = map(mouseY, 0, height, 0, h);
    mask.ellipse(x, y, h*0.618, h*0.618);
    mask.popMatrix();
    mask.endDraw();
  }
}
