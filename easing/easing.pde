Ease EA;

void setup() {
  size(900, 450, P2D);
  noFill();
  frameRate(60);
  smooth(8);
  surface.setLocation(300, 0);

  EA = new Ease();
  SetupPostFX(this);
}

void draw() {
  int   T = 120;
  float t = (frameCount % T) / float(T);
  float size = height * 0.8;

  float t1 = EA.clamp(t, 0, 0.5, true);
  float t2 = EA.clamp(t, 0.2, 1, true);

  background(WHITE);
  noStroke();
  translate(width/2, height/2);

  rotateTaichi(size * 0.618, t1);
  expandRipple(size * 1, t2);

  ApplyPostFX();
  surface.setTitle("" + frameRate);
}

void expandRipple(float size, float t) {
  float d  = size * EA.easeOutExpo(t);
  float sw = 8 * EA.easeInExpo(1-t);
  sw = max(sw, 0);
  noFill();
  stroke(BLACK);
  strokeWeight(sw);
  ellipse(0, 0, d, d);
}

void rotateTaichi(float size, float t) {
  push();
  float     d = size;
  float angle = 2 * TWO_PI * EA.easeInOutExpo(t);
  rotate(angle);

  fill(WHITE);
  arc(0, 0, d, d, radians(90), radians(270));
  fill(BLACK);
  arc(0, 0, d, d, radians(-90), radians(90));
  ellipse(0, 0 + d/4, d/2, d/2);
  fill(WHITE);
  ellipse(0, 0 - d/4, d/2, d/2);
  ellipse(0, 0 + d/4, d/8, d/8);
  fill(BLACK);
  ellipse(0, 0 - d/4, d/8, d/8);
  pop();
}
