class Arc extends MG {

  float d1;
  float d2;
  float angle;
  float len;
  int   dir;
  int   off;

  Arc(float x, float y, float size) {
    super(x, y, size);
    T = floor(random(60, 120));
    //T = 120;

    d1     = random(size);
    d2     = random(d1, size);
    angle  = random(TWO_PI);
    len    = random(TWO_PI);
    dir    = random(2)<1 ?1 :-1;
    off    = 1;
  }

  void render(PGraphics pg) {
    //pg.push();
    //pg.translate(x, y);
    //renderArc(pg, t);
    //pg.pop();
  }

  void renderArc(PGraphics pg, float t) {
    pg.push();
    pg.translate(x, y);
    pg.noFill();
    pg.stroke( 255,0,0 );
    
    if(dir == 1) pg.stroke(0,0,255 );
    
    pg.strokeWeight(off);

    int n = floor((d2-d1)/off);
    for (int i=0; i<n*EA.easeOutExpo(t); i++) {
      float d = map(i, 0, n, d1, d2);
      pg.arc(0, 0, d, d, angle, len);
    }

    //pg.stroke(RED);
    //pg.strokeWeight(2);
    //pg.arc(0, 0, d1, d1, 0, TWO_PI);
    //pg.arc(0, 0, d2, d2, 0, TWO_PI);
    pg.pop();
  }

  void renderBlendDifference(PGraphics pg) {
    pg.push();
    renderArc(pg, t);
    pg.pop();
  }
}
