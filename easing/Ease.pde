class Ease {

  Ease() {
  }

  float clamp(float t, float minV, float maxV, boolean remap) {
    t = min(max(t, minV), maxV);
    return remap
      ? map(t, minV, maxV, 0, 1)
      : t;
  }

  float easeInPower(float t, float k) {
    return pow(t, k);
  }
  float easeOutPower(float t, float k) {
    return 1 - pow(1-t, k);
  }
  float easeInOutPower(float t, float k) {
    t *= 2;
    return t < 1
      ? pow(t, k) * 0.5
      : 1 - pow(2-t, k) * 0.5;
  }

  float easeInSine(float t) {
    return 1 - cos(HALF_PI*t);
  }
  float easeOutSine(float t) {
    return sin(HALF_PI*t);
  }
  float easeInOutSine(float t) {
    return -(cos(PI*t) - 1) * 0.5;
  }

  float easeInExpo(float t) {
    return t==0 ?0 :pow(2, 10*t - 10);
  }
  float easeOutExpo(float t) {
    return t==1 ?1 :1 - pow(2, -10*t);
  }
  float easeInOutExpo(float t) {
    return t == 0  ? 0
      :    t == 1  ? 1
      :    t < 0.5 ? pow(2, 20*t - 10) * 0.5
      : (2 - pow(2, -20*t + 10)) * 0.5;
  }

  float easeInCirc(float t) {
    return 1 - sqrt(1 - pow(t, 2));
  }
  float easeOutCirc(float t) {
    return sqrt(1 - pow(t-1, 2));
  }
  float easeInOutCirc(float t) {
    return t < 0.5
      ? (1 - sqrt(1 - pow(2*t, 2))) * 0.5
      : (sqrt(1 - pow(-2*t + 2, 2)) + 1) * 0.5;
  }

  float easeInBack(float t) {
    float c1 = 1.70158;
    float c3 = c1 + 1;
    return c3 * pow(t, 3) - c1 * pow(t, 2);
  }
  float easeOutBack(float t) {
    float c1 = 1.70158;
    float c3 = c1 + 1;
    return 1 + c3 * pow(t-1, 3) + c1 * pow(t-1, 2);
  }
  float easeInOutBack(float t) {
    float c1 = 1.70158;
    float c2 = c1 * 1.525;
    return t < 0.5
      ? (pow(2*t, 2) * ((c2 + 1) * 2*t - c2)) * 0.5
      : (pow(2*t - 2, 2) * ((c2 + 1) * (2*t - 2) + c2) + 2) * 0.5;
  }

  float easeInElastic(float t) {
    float c4 = TWO_PI / 3.;
    return t == 0  ? 0
      :    t == 1  ? 1
      : -pow(2, 10*t - 10) * sin((10*t - 10.75) * c4);
  }
  float easeOutElastic(float t) {
    float c4 = TWO_PI / 3.;
    return t == 0  ? 0
      :    t == 1  ? 1
      : pow(2, -10*t) * sin((10*t - 0.75) * c4) + 1;
  }
  float easeInOutElastic(float t) {
    float c5 = TWO_PI / 4.5;
    return t == 0  ? 0
      :    t == 1  ? 1
      :    t < 0.5 ? -(pow(2, 20*t - 10) * sin((20*t - 11.125) * c5)) * 0.5
      : (pow(2, -20*t + 10) * sin((20*t - 11.125) * c5)) * 0.5 + 1;
  }

  float easeInBounce(float t) {
    return 1 - easeOutBounce(1-t);
  }
  float easeOutBounce(float t) {
    float n1 = 7.5625;
    float d1 = 2.75;
    if      (t < 1/d1)    return n1 * t * t;
    else if (t < 2/d1)    return n1 * (t -= 1.5   /d1) * t + 0.75;
    else if (t < 2.5/d1)  return n1 * (t -= 2.25  /d1) * t + 0.9375;
    else                  return n1 * (t -= 2.625 /d1) * t + 0.984375;
  }
  float easeInOutBounce(float t) {
    return t < 0.5
      ? (1 - easeOutBounce(1 - 2*t)) * 0.5
      : (1 + easeOutBounce(2*t - 1)) * 0.5;
  }
}
