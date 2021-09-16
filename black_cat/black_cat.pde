BlackCatSystem   BS;
MusicManager     MM;

void setup() {
  size(1920, 1080, P2D);

  BS = new BlackCatSystem();
  BS.setup();

  MM = new MusicManager(this);

  SetupPostFX(this);
  //surface.setLocation(0, 0);

  frameRate(60);
}

void draw() {
  background(240);

  BS.update();
  BS.render();

  MM.Update();
  //MM.Render(g);

  if (MM.isHat(1)) {
    BS.addBackCats();
  }

  if (frameCount > 600 && frameCount % 5 == 0) {
    BS.addBackCats();
  }

  if (MM.isSnare(1)) {
    BS.addCats(random(1) < 0.5);
  }

  ApplyPostFX();
  surface.setTitle("" + frameRate);
}
