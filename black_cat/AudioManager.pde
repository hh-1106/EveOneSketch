import ddf.minim.*;
import ddf.minim.analysis.*;


class MusicManager {

  Minim                        minim;
  AudioPlayer                   song;
  BeatDetect                    beat;
  BeatListener                    bl;

  int   k=0, s=0, h=0;
  float kickSize, snareSize, hatSize;

  MusicManager(PApplet app) {
    minim       = new Minim(app);

    song = minim.loadFile("data/cat.mp3", 1024);
    song.loop();
    //song.setGain(-40);
    beat = new BeatDetect(song.bufferSize(), song.sampleRate());
    beat.setSensitivity(300);
    bl   = new BeatListener(beat, song);

    kickSize = snareSize = hatSize = 32;
  }

  void Update() {

    if ( beat.isKick() ) {
      kickSize = 96;
      k++;
    }
    if ( beat.isSnare() ) {
      snareSize = 96;
      s++;
    }
    if ( beat.isHat() ) {
      hatSize = 96;
      h++;
    }
  }

  boolean isKick(int count) {
    return beat.isKick() && k%count == 0;
  }

  boolean isSnare(int count) {
    return beat.isSnare() && s%count == 0 && s>0;
  }

  boolean isHat(int count) {
    return beat.isHat() && h%count == 0 && h>0;
  }

  void Render(PGraphics pg) {

    pg.beginDraw();
    pg.textAlign(CENTER);

    pg.fill(255, 0, 0);
    pg.textSize(kickSize);
    pg.text("KICK"  + k, pg.width/4, pg.height/2);
    pg.textSize(snareSize);
    pg.text("SNARE" + s, pg.width/2, pg.height/2);
    pg.textSize(hatSize);
    pg.text("HAT"   + h, 3*pg.width/4, pg.height/2);

    kickSize  = constrain( kickSize * 0.95, 32, 96);
    snareSize = constrain(snareSize * 0.95, 32, 96);
    hatSize   = constrain(  hatSize * 0.95, 32, 96);

    pg.endDraw();
  }
}


class BeatListener implements AudioListener {
  private BeatDetect  beat;
  private AudioPlayer source;

  BeatListener(BeatDetect beat, AudioPlayer source) {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }

  void samples(float[] samps) {
    beat.detect(source.mix);
  }

  void samples(float[] sampsL, float[] sampsR) {
    beat.detect(source.mix);
  }
}
