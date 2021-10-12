Ease       EA;
PGraphics  pg;
MGSystem   TS;

void setup() {
  //size(1000, 500, P2D);
  size(2000, 900, P2D);
  frameRate(60);
  smooth(8);
  surface.setLocation(250, 300);

  pg = createGraphics(width, height, P2D);
  EA = new Ease();
  SetupPostFX(this);
  TS = new MGSystem();
}

void draw() {
  pg.beginDraw();
  TS.update();
  TS.render(pg);
  pg.endDraw();

  background(255);
  blendMode(REPLACE);
  image(pg, 0, 0);
  ApplyPostFX(pg);

  surface.setTitle("" + frameRate);
}
