class BlackCatSystem {

  ArrayList<BlackCat>          cats;
  ArrayList<BlackCat>      justEyes;
  int                   catNum = 64;
  int                    backCatNum;
  PGraphics   pg, pg_outline, pg_bg;

  BlackCatSystem() {
    pg         = createGraphics(width, height);
    pg_outline = createOutlinePG(200);

    cats     = new ArrayList<BlackCat>();
    justEyes = new ArrayList<BlackCat>();
  }

  void setup() {
    ArrayList<BlackCat> back_cats = new ArrayList<BlackCat>();
    pg_bg = createBackPG(back_cats);
    back_cats.clear();
  }

  void addBackCats() {
    if (backCatNum == 1600) return;

    pg_bg.beginDraw();
    BlackCat bc = new BlackCat(
      random(-300, width), random(-300, height),
      floor(random(50, 300)), false
      );
    bc.render(pg_bg);
    pg_bg.endDraw();

    backCatNum++;
  }

  void addCats(boolean bJustEyes) {
    if (cats.size() == catNum) return;

    if (bJustEyes) {
      justEyes.add(new BlackCat(
        random(-200, width), random(-200, height),
        floor(random(100, 200)), true
        ));
    }

    cats.add(new BlackCat(
      random(-200, width), random(-200, height),
      floor(random(100, 200)), false
      ));
  }

  void update() {
    for (BlackCat c : cats) {
      c.update();
    }

    for (BlackCat c : justEyes) {
      c.update();
    }
  }

  void render() {
    pg.beginDraw();
    pg.clear();

    for (BlackCat c : cats) {
      c.render(pg);
    }

    for (BlackCat c : justEyes) {
      c.render(pg);
    }
    pg.endDraw();

    image(pg_bg, 0, 0);
    image(pg, 0, 0);
  }

  PGraphics createBackPG(ArrayList<BlackCat> back_cats) {
    PGraphics pg = createGraphics(width, height);
    pg.beginDraw();
    pg.clear();
    for (BlackCat c : back_cats) {
      c.render(pg);
    }
    pg.endDraw();
    return pg;
  }

  PGraphics createOutlinePG(int a) {
    PGraphics pg = createGraphics(a, a);
    pg.beginDraw();
    pg.clear();

    pg.noStroke();
    pg.fill(10);
    pg.beginShape();
    pg.curveVertex(0.302 * a, 1.090 * a);
    pg.curveVertex(0.226 * a, 1.000 * a);
    pg.curveVertex(0.182 * a, 0.766 * a);
    pg.curveVertex(0.184 * a, 0.544 * a);
    pg.curveVertex(0.236 * a, 0.388 * a);
    pg.curveVertex(0.370 * a, 0.486 * a);
    pg.curveVertex(0.508 * a, 0.550 * a);
    pg.curveVertex(0.640 * a, 0.436 * a);
    pg.curveVertex(0.806 * a, 0.278 * a);
    pg.curveVertex(0.884 * a, 0.450 * a);
    pg.curveVertex(0.794 * a, 0.576 * a);
    pg.curveVertex(0.912 * a, 0.584 * a);
    pg.curveVertex(0.994 * a, 0.684 * a);
    pg.curveVertex(1.132 * a, 0.816 * a);
    pg.curveVertex(1.000 * a, 1.000 * a);
    pg.curveVertex(1.000 * a, 1.000 * a);
    pg.endShape();

    pg.beginShape();
    pg.curveVertex(0.474 * a, 0.600 * a);
    pg.curveVertex(0.288 * a, 0.634 * a);
    pg.curveVertex(0.366 * a, 0.486 * a);
    pg.curveVertex(0.642 * a, 0.432 * a);
    pg.curveVertex(0.778 * a, 0.526 * a);
    pg.curveVertex(0.602 * a, 0.580 * a);
    pg.endShape();

    pg.beginShape();
    pg.curveVertex(0.696 * a, 0.494 * a);
    pg.curveVertex(0.696 * a, 0.494 * a);
    pg.curveVertex(0.822 * a, 0.388 * a);
    pg.curveVertex(0.868 * a, 0.382 * a);
    pg.curveVertex(0.884 * a, 0.436 * a);
    pg.curveVertex(0.936 * a, 0.600 * a);
    pg.curveVertex(1.100 * a, 0.832 * a);
    //pg.curveVertex(1.092 * a, 0.890 * a);
    pg.curveVertex(0.804 * a, 0.632 * a);
    pg.curveVertex(0.766 * a, 0.588 * a);
    pg.endShape();

    pg.endDraw();

    return pg;
  }
}
