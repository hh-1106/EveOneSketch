class MaskManager {

  ArrayList<MaskFliter> mfs;

  MaskManager() {
    mfs = new ArrayList<MaskFliter>();
    mfs.add(new MaskFliter(iw, ih));
    mfs.add(new CircleMaskFliter(iw, ih));
    mfs.add(new TextMaskFliter(iw, ih));
    mfs.add(new CrossMaskFliter(iw, ih));
    mfs.add(new ImageMaskFliter(iw, ih));
  }

  void render() {
    push();
    translate(iw*0.75, ih*0.75);
    image(img, 0, 0);

    for (int i=0; i<mfs.size(); i++) {
      MaskFliter mf = mfs.get(i);
      mf.updateMask();
      mf.applyMask();

      push();
      float x = (i+1)%COLS * iw * 1.25;
      float y = (i+1)/COLS * ih * 1.25;
      translate(x, y);
      image(mf.mix, 0, 0);
      pop();
    }
    pop();
  }
}
