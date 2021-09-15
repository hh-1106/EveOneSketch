import com.jogamp.opengl.GL2;
import com.thomasdiewald.pixelflow.java.DwPixelFlow;
import com.thomasdiewald.pixelflow.java.dwgl.DwGLTexture;
import com.thomasdiewald.pixelflow.java.imageprocessing.DwShadertoy;
import com.thomasdiewald.pixelflow.java.imageprocessing.filter.DwFilter;


DwPixelFlow context;
DwShadertoy toy, toyA, toyB, toyC, toyD;
DwGLTexture tex;


void settings() {
  size(2560, 1440, P2D);
  smooth(0);
}

void setup() {
  context = new DwPixelFlow(this);
  tex     = new DwGLTexture();

  toyA = new DwShadertoy(context, "data/Test_BufA.frag");
  toyB = new DwShadertoy(context, "data/Test_BufB.frag");
  toyC = new DwShadertoy(context, "data/Test_BufC.frag");
  toyD = new DwShadertoy(context, "data/Test_BufD.frag");
  toy  = new DwShadertoy(context, "data/Test.frag");

  PImage img = loadImage("data/wallhaven-r29w2m-blur.png");
  tex.resize(context, GL2.GL_RGBA8, img.width, img.height, GL2.GL_RGBA, GL2.GL_UNSIGNED_BYTE, GL2.GL_LINEAR, GL2.GL_MIRRORED_REPEAT, 4, 1);
  DwFilter.get(context).copy.apply(img, tex);
  DwShadertoy.setTextureFilter(tex, DwShadertoy.TexFilter.MIPMAP);
  DwShadertoy.setTextureWrap(tex, DwShadertoy.TexWrap.CLAMP);

  frameRate(60);
}

void draw() {
  toyA.apply(width, height);

  toyB.set_iChannel(0, toyC);
  toyB.set_iChannel(1, toyA);
  toyB.apply(width, height);

  toyC.set_iChannel(0, toyB);
  toyC.set_iChannel(1, toyA);
  toyC.apply(width, height);

  toyD.set_iChannel(0, toyC);
  toyD.set_iChannel(1, toyA);
  toyD.apply(width, height);

  toy.set_iChannel(0, toyD);
  toy.set_iChannel(1, tex);
  toy.apply(this.g);
}
