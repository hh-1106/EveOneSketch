class BlackCat {

  int                 a;
  PVector           pos;
  float           angle;

  // Eye
  Eye leftEye, rightEye;
  int        blinkCycle;
  int          blinkDur;
  int          blinkPhi;

  float      glanceProp;
  int      minGlanceDur;
  int      maxGlanceDur;
  float   minGlanceDist;
  float   maxGlanceDist;

  // for framerate
  boolean     bJustEyes;

  BlackCat(float x, float y, int a, boolean bJustEyes) {
    this.a     = a;
    this.pos   = new PVector(x, y);
    angle      = random(-0.5, 0.5);
    leftEye    = new Eye(0.395 * a, 0.717 * a, 0.158 * a, 0.154 * a, 0.378 * a, 0.705 * a, 0.090 * a);
    rightEye   = new Eye(0.696 * a, 0.666 * a, 0.164 * a, 0.162 * a, 0.676 * a, 0.652 * a, 0.090 * a);

    blinkCycle = floor(random(100, 500));
    blinkPhi   = floor(random(blinkCycle));
    blinkDur   = floor(random(5, 30));

    glanceProp    = random(0.01, 0.02);
    minGlanceDur  = 20;
    maxGlanceDur  = 50;
    minGlanceDist = a * 0.01;
    maxGlanceDist = a * 0.03;

    this.bJustEyes = bJustEyes;
  }

  void update() {
    if (random(1) < glanceProp) {
      glance();
    }

    leftEye.update();
    rightEye.update();
  }

  void glance() {
    int   glanceDur   = floor(random(minGlanceDur, maxGlanceDur));
    float glanceDist  = random(minGlanceDist, maxGlanceDist);
    float glanceAngle = random(TWO_PI);

    leftEye.glance(glanceAngle, glanceDist, glanceDur);
    rightEye.glance(glanceAngle, glanceDist, glanceDur);
  }

  void render(PGraphics pg) {
    pg.push();
    pg.translate(pos.x, pos.y);

    pg.translate(a*0.75, a*0.75);
    pg.rotate(angle);
    pg.translate(-a*0.75, -a*0.75);

    if (!bJustEyes) {
      pg.image(BS.pg_outline, 0, 0, a, a);
    }

    if ( (frameCount + blinkPhi) % blinkCycle > blinkDur ) {

      if (!bJustEyes || (bJustEyes && MM.isKick(1))) {
        leftEye.render(pg);
        rightEye.render(pg);
      }
    }

    pg.pop();
  }
}
