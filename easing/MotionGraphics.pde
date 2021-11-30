class MG {

  float   x, y;
  int        T;
  int   startF;
  float      t;
  boolean done;

  MG() {
  }

  MG(float x, float y) {
    this.x = x;
    this.y = y;
    T      = floor(random(60, 120));
    startF = frameCount;
  }

  void update() {
    int f = (frameCount-startF);
    t    = (f % T) / float(T);
    done = f % T == 0;
  }

  void render(PGraphics pg) {
  }

  void fade() {
  }
}
