class Eye {

  PVector             pos;
  PVector     pupilOffset;
  PVector  pupilOriOffset;
  float              w, h;
  float            pupilD;

  int          glanceTime;

  Eye(float x1, float y1, float w, float h, float x2, float y2, float d) {
    pos            = new PVector(x1, y1);
    pupilOffset    = new PVector(x2-x1, y2-y1);
    pupilOriOffset = pupilOffset.copy();
    glanceTime  = -1;
    this.w      = w;
    this.h      = h;
    this.pupilD = d;
  }

  void update() {
    if (glanceTime < 0) {
      pupilOffset = pupilOriOffset.copy();
    } else {
      glanceTime--;
    }
  }

  void glance(float angle, float dist, int glanceTime) {
    this.glanceTime = glanceTime;

    PVector dir = PVector.fromAngle(angle);
    dir.setMag(dist);
    pupilOffset = dir.copy();
  }

  void render(PGraphics pg) {
    pg.push();
    pg.translate(pos.x, pos.y);
    pg.fill(240);
    pg.ellipse(0, 0, w, h);

    pg.fill(10);
    //pg.fill(255, 99, 87);
    pg.ellipse(pupilOffset.x, pupilOffset.y, pupilD, pupilD);
    pg.pop();
  }
}
