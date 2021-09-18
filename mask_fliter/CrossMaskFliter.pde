class CrossMaskFliter extends MaskFliter {

  CrossMaskFliter(int w, int h) {
    super(w, h);
  }

  void updateMask() {
    mask.beginDraw();
    mask.pushMatrix();
    mask.background(0);
    mask.stroke(255);
    mask.strokeWeight(20);
    float x = map(mouseX, 0, width, 0, w);
    float y = map(mouseY, 0, height, 0, h);
    mask.line(x, 0, x, h);
    mask.line(0, y, w, y);
    mask.popMatrix();
    mask.endDraw();
  }
}
