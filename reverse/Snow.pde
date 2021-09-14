class Snow {

  float         x;
  float         y;
  float         d;
  float       vel;
  color       col;
  float     alpha;

  float      maxD;

  float      freq;
  float       phi;

  Snow() {
    this.setup();
  }

  void setup() {
    x     = random(width);
    y     = -random(100, height);
    vel   = random(1, 6);
    col   = color(229);
    maxD  = random(1, 12);

    freq  = 0.05;
    phi   = random(TWO_PI);
  }

  void update() {
    y += vel;

    float r = map(sin(frameCount * freq + phi), -1, 1, 0, 1);

    alpha = r * r * 255;
    d     = r * maxD;

    if (y > height + maxD*2) {
      this.setup();
    }
  }

  void render() {
    push();
    strokeWeight(d);
    stroke(col, alpha);
    point(x, y);
    pop();
  }
}
