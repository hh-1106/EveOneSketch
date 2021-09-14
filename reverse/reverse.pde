SnowSystem SS;

void setup() {
  //size(500, 700, P2D);
  size(2560, 1440, P2D);
  //fullScreen(P2D);
  SS = new SnowSystem();

  SetupPostFX(this);
  frameRate(60);
}

void draw() {
  background(0);

  SS.update();
  SS.render();

  ApplyPostFX();
}
