class ImageMaskFliter extends MaskFliter {

  PImage maskImg;

  ImageMaskFliter(int w, int h) {
    super(w, h);
    maskImg = loadImage("wallhaven-vg7lv3.jpg");
    maskImg.resize(w, h);
  }

  void updateMask() {
    mask.beginDraw();
    mask.background(0);
    mask.image(maskImg, 0, 0);
    mask.filter(THRESHOLD, mouseX / float(width));
    mask.filter(INVERT);
    mask.endDraw();
  }
}
