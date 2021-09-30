class Taichi {

  float x, y;
  float size;
  int      T;
  float    t;

  PGraphics shadow;

  Taichi(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
    T = 120;

    shadow = createGraphics(int(size * 0.618), int(size * 0.618));
    shadow.beginDraw();
    shadow.clear();
    rotateTaichi(shadow, shadow.width/2, shadow.height/2, shadow.width, 1);
    shadow.endDraw();
  }

  void update() {
    t = (frameCount % T) / float(T);
  }

  void render(PGraphics pg) {
    
    renderShadow(pg);
    
    float t1 = EA.clamp(t, 0, 0.5, true);
    rotateTaichi(pg, x, y, size * 0.618, t1);
  }

  void renderShadow(PGraphics pg) {
    float t5 = EA.clamp(t, 0.2, 0.7, true);
    float a  = 255 * EA.easeInPower(1-t5, 2);
    float d  = size * 1.1 * EA.easeOutExpo(t5);
 
    pg.beginDraw();
    pg.push();
    pg.imageMode(CENTER);
    pg.tint(255, a);
    float angle = 2 * TWO_PI * EA.easeOutExpo(t5);
    pg.translate(x, y);
    pg.rotate(0.02+angle);
    pg.image(shadow, 0, 0, d, d);
    pg.pop();
    pg.endDraw();
  }

  void renderBlendDifference(PGraphics pg) {
    float t2 = EA.clamp(t, 0.2, 1, true);
    float t3 = EA.clamp(t, 0.3, 1, true);
    float t4 = EA.clamp(t, 0.7, 1, true);

    pg.push();
    pg.translate(x, y);
    expandRipple(pg, size * 1, t2);
    expandRipple(pg, size * 1.2, t3);
    expandRipple(pg, size * 1.2, 1-t4);
    pg.pop();
  }

  void expandRipple(PGraphics pg, float size, float t) {
    float d  = size * EA.easeOutExpo(t);
    float sw = 10 * EA.easeInExpo(1-t);
    sw = max(sw, 0);
    pg.noFill();
    pg.stroke(BLACK);
    pg.strokeWeight(sw);
    pg.ellipse(0, 0, d, d);
  }

  void rotateTaichi(PGraphics pg, float x, float y, float size, float t) {
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
