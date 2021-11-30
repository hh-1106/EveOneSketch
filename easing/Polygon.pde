class Polygon extends MG {

  boolean  bReverse;
  float         num;
  int           dir;
  float          sw;
  float        size;
  float       angle;

  float     maxSize;
  float    maxAngle;

  Polygon(float x, float y) {
    super(x, y);

    bReverse = random(8) < 1;
    num      = floor(random(3, 7));
    if (random(8) < 1) num = 0;

    dir      = random(2)<1 ?1 :-1;
    size     = 0;
    angle    = 0;
    maxSize  = random(height * 0.1, height * 1.3);
    maxAngle = random(HALF_PI, TWO_PI);
  }

  void update() {
    super.update();

    sw    = EA.easeInExpo(1-t) * maxSize * 0.25;
    size  = EA.easeOutExpo(t)  * maxSize;
    angle = EA.easeOutExpo(t)  * maxAngle * dir;
  }

  void render (PGraphics pg) {
    pg.push();

    pg.strokeWeight(this.sw);
    pg.translate(this.x, this.y);
    pg.rotate(this.angle);

    if (bReverse) {
      pg.fill(255);
      pg.noStroke();
    } else {
      pg.noFill();
      pg.stroke(255);
    }

    if (this.num == 0) {
      pg.circle(0, 0, this.size * 2);
    } else {
      pg.beginShape();
      for (int i = 0; i < this.num; i++) {
        float a = map(i, 0, this.num, 0, TWO_PI);
        float x = this.size * cos(a);
        float y = this.size * sin(a);
        pg.vertex(x, y);
      }
      pg.endShape(CLOSE);
    }

    pg.pop();
  }

  void fade() {
    if (bReverse) MS.reverse();
  }
}
