Ease       EA;
PGraphics  pg;
TaiChiSystem     TS;

void setup() {
  size(900, 450, P2D);
  frameRate(60);
  smooth(8);
  surface.setLocation(300, 300);

  pg = createGraphics(width, height, P2D);
  EA = new Ease();
  SetupPostFX(this);
  TS = new TaiChiSystem();
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
