class Taichi {

  float x, y;
  int   T = 120;
  float size;
  float t;

  Taichi(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }

  void update() {
    t = (frameCount % T) / float(T);
  }

  void render(PGraphics pg) {
    float t1 = EA.clamp(t, 0, 0.5, true);
    rotateTaichi(pg, size * 0.618, t1);
  }

  void renderBlendDifference(PGraphics pg) {
    float t2 = EA.clamp(t, 0.2, 1, true);
    float t3 = EA.clamp(t, 0.3, 1, true);
    float t4 = EA.clamp(t, 0.5, 1, true);

    pg.push();
    pg.translate(x, y);
    expandRipple(pg, size * 1, t2);
    expandRipple(pg, size * 1.2, t3);
    expandRipple(pg, size * 1.2, 1-t4);
    pg.pop();
  }

  void expandRipple(PGraphics pg, float size, float t) {
    float d  = size * EA.easeOutExpo(t);
    float sw = 80 * EA.easeInExpo(1-t);
    sw = max(sw, 0);
    pg.noFill();
    pg.stroke(255);
    pg.strokeWeight(sw);
    pg.ellipse(0, 0, d, d);
  }

  void rotateTaichi(PGraphics pg, float size, float t) {
    pg.beginDraw();
    pg.push();
    pg.noStroke();
    pg.translate(x, y);
    float     d = size;
    float angle = 2 * TWO_PI * EA.easeInOutExpo(t);
    pg.rotate(angle);

    pg.fill(WHITE);
    pg.arc(0, 0, d, d, radians(90), radians(270));
    pg.fill(BLACK);
    pg.arc(0, 0, d, d, radians(-90), radians(90));
    pg.ellipse(0, 0 + d/4, d/2, d/2);
    pg.fill(WHITE);
    pg.ellipse(0, 0 - d/4, d/2, d/2);
    pg.ellipse(0, 0 + d/4, d/8, d/8);
    pg.fill(BLACK);
    pg.ellipse(0, 0 - d/4, d/8, d/8);
    pg.pop();
    pg.endDraw();
  }
}
