import ch.bildspur.postfx.builder.*;
import ch.bildspur.postfx.pass.*;
import ch.bildspur.postfx.*;


PostFX                     fx;

void SetupPostFX(PApplet app) {
  fx = new PostFX(app);
}

void ApplyPostFX() {
  fx.render()
    .blur(9, 5)  // blurSize sigma
    .vignette(0.9, 0.5)
    .compose();
}
