import ch.bildspur.postfx.builder.*;
import ch.bildspur.postfx.pass.*;
import ch.bildspur.postfx.*;


PostFX                     fx;

void SetupPostFX(PApplet app) {
  fx = new PostFX(app);
}

void ApplyPostFX(PGraphics pg_) {
  blendMode(SCREEN);

  fx.render(pg_)
    .bloom(0.1, 9, 9)
    .rgbSplit(10)
    .compose();
}

color RED          = #FC6255;
color GREEN        = #83C167;
color BLUE         = #58C4DD;
color GREY         = #888888;
color BLACK        = #040404;
color WHITE        = #eeeeee;
color YELLOW       = #FFFF00;
color ORANGE       = #FF862F;
color PINK         = #D147BD;
color GOLD         = #F0AC5F;
color TEAL         = #5CD0B3;
color MAROON       = #C55F73;
color PURPLE       = #9A72AC;
