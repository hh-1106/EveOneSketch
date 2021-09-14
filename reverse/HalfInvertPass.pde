class HalfInvertPass implements Pass {
  PShader shader;

  public HalfInvertPass() {
    shader = loadShader("halfInvertFrag.glsl");
  }

  @Override
    public void prepare(Supervisor supervisor) {
    // set parameters of the shader if needed
  }

  @Override
    public void apply(Supervisor supervisor) {
    PGraphics pass = supervisor.getNextPass();
    supervisor.clearPass(pass);

    pass.beginDraw();
    pass.shader(shader);
    pass.image(supervisor.getCurrentPass(), 0, 0);
    pass.endDraw();
  }
}
