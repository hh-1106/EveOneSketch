int        iw = 300;      // image width
int        ih = 0;        // image height
int        ROWS = 2;
int        COLS = 3;

PImage     img;
MaskManager MM;

void settings() {
  img = loadImage("wallhaven-vg7lv3.jpg");
  img.resize(iw, 0);
  ih = floor(iw * img.height / (float)img.width);
  size(iw/4 + COLS*iw*5/4, ih/4 + ROWS*ih*5/4);
}

void setup() {
  MM = new MaskManager();
  imageMode(CENTER);
}

void draw() {
  background(0);
  MM.render();
}
