class TextMaskFliter extends MaskFliter {

  TextMaskFliter(int w, int h) {
    super(w, h);
  }

  void updateMask() {
    mask.beginDraw();
    mask.pushMatrix();
    mask.background(0);
    mask.fill(255);

    mask.textAlign(CENTER, CENTER);
    mask.textSize(10);
    int w = 10;
    for (int i=0; i<2000; i++) {
      mask.text(
        floor(random(10)), 
        floor(random(width) / w) * w, 
        floor(random(height) / w) * w);
    }
    mask.popMatrix();
    mask.endDraw();
  }
}
