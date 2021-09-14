import ch.bildspur.postfx.builder.*;
import ch.bildspur.postfx.pass.*;
import ch.bildspur.postfx.*;


PostFX                     fx;
HalfInvertPass halfInvertPass;

void SetupPostFX(PApplet app) {
  fx = new PostFX(app);
  halfInvertPass = new HalfInvertPass();
}

void ApplyPostFX() {
  fx.render()
    .custom(halfInvertPass)         
    .bloom(0.2, 10, 3)        // threshold blurSize sigma
    .compose();
}
