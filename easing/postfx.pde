import ch.bildspur.postfx.builder.*;
import ch.bildspur.postfx.pass.*;
import ch.bildspur.postfx.*;
import com.jogamp.opengl.*;

GL3                        gl;
PostFX                     fx;

void SetupPostFX(PApplet app) {
  fx = new PostFX(app);
  gl = GLContext.getCurrentGL().getGL3();
}

void ApplyPostFX() {
  fx.render()
    .bloom(0.2, 10, 5)
    //.invert()
    //.toon()
    //.rgbSplit(50)
    //.vignette(0.9, 0.4)
    .compose();
}

color RED          = #FC6255;
color GREEN        = #83C167;
color BLUE         = #58C4DD;
color GREY         = #888888;
color BLACK        = #1a181b;
color WHITE        = #eeeeee;
color YELLOW       = #FFFF00;
color ORANGE       = #FF862F;
color PINK         = #D147BD;
color GOLD         = #F0AC5F;
color TEAL         = #5CD0B3;
color MAROON       = #C55F73;
color PURPLE       = #9A72AC;
