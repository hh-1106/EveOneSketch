class MG {

  float x, y;
  float size;
  int      T;
  float    t;

  MG() {
  }

  MG(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
    T = 120;
  }

  void update() {
    t = (frameCount % T) / float(T);
  }

  void render(PGraphics pg) {
  }

  void renderBlendDifference(PGraphics pg) {
  }
}
