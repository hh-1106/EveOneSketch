class Arc extends MG {

  float d1;
  float d2;
  float angle;
  float len;
  int   off;

  Arc(float x, float y) {
    super(x, y);

    T      = floor(random(20, 30));
    float size = random(200, height);

    d1     = random(size*.9);
    d2     = d1 + random( (size-d1)*.8 );
    angle  = random(TWO_PI);
    len    = angle + random(PI);
    off    = 4;
  }

  void gradientArc(PGraphics pg, float t) {
    pg.push();

    pg.blendMode(BLEND);
    pg.translate(x, y);
    pg.noFill();
    pg.stroke( BLACK );
    pg.strokeWeight(off);

    int n = floor((d2-d1)/off);
    for (int i=0; i<n*EA.easeInOutExpo(t); i++) {
      float d = map(i, 0, n, d1, d2);
      pg.arc(0, 0, d, d, angle, len);
    }

    pg.pop();
  }

  void render(PGraphics pg) {
    pg.push();
    float t1 = EA.clamp(t, 0, 0.5, true);
    float t2 = EA.clamp(t, 0.5, 1, true);

    if (t < 0.5)
      gradientArc(pg, t1);
    else
      gradientArc(pg, 1-t2);
    pg.pop();
  }
}
