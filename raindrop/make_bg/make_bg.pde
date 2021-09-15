import ch.bildspur.postfx.builder.*;
import ch.bildspur.postfx.*;

PostFX fx;
PImage back;

void setup() {
  back = loadImage("back.png");
  size(2400, 1352, P2D);
  fx = new PostFX(this);
  frameRate(60);
}

void draw() {
  background(0);
  image(back, 0, 0);

  fx.render()
    .bloom(0.4, 10, 10)
    .blur(10, 2)
    .compose();
}
