PGraphics  PG_MS;
PGraphics  PG_FX;

Ease          EA;
MGSystem      MS;


void setup() {
  size(1920, 1080, P2D);
  //fullScreen(P2D);
  frameRate(60);
  smooth(8);
  //surface.setLocation(300, 100);
  SetupPostFX(this);

  EA = new Ease();
  MS = new MGSystem();

  PG_MS = createGraphics(width, height);
  PG_FX = createGraphics(width, height, P2D);
}

void draw() {

  MS.update();
  MS.render(PG_MS);

  //MM.render(PG_MS);

  PG_FX.beginDraw();
  PG_FX.image(PG_MS, 0, 0);
  PG_FX.endDraw();

  if ( frameCount % 30 == 0 )
    MS.addMG(new Polygon(random(width), random(height)));

  background(255);
  blendMode(BLEND);
  image(PG_FX, 0, 0);
  ApplyPostFX(PG_FX);

  //surface.setTitle("" + frameRate);
}

void mousePressed() {
  MS.addMG(new Polygon(mouseX, mouseY));
}
