int xspacing = 2;
int w;
int res = 360;
int radius = 150;
float yoff = 0.0f;
float xoff = 0.0f;
float noiseStep = 0.015f;
float amplitude = 1.0f;
float cx, cy;

void setup() {
  background(0);
  size(500, 500);
  frameRate(30);
  colorMode(RGB, 255, 255, 255, 100);
  smooth();
  w = width + 16;
  cx = width/2;
  cy = height/2;
}

void draw() {
  //background(0);
  drawFade();
  renderWave();
  yoff += noiseStep;
  xoff += noiseStep;
}

void drawFade() {
  fill(0, 2);
  noStroke();
  rect(0, 0, width, height);
}

float getNoise(float xoff, float yoff, float i) {
  float offset = i * noiseStep;
  float a = amplitude * noise(offset) * 2;
  return a * noise(xoff + offset, yoff + offset);
}

void renderWave() {

  // A simple way to draw the wave with an ellipse at each location

  stroke(127, 231, 225, 30);
  noFill();

  beginShape();

  for (float i = 0, index = 0, step = TWO_PI/res; i < TWO_PI; i += step, index++) {
    float noise = getNoise(xoff, yoff, index);
    float dx = cos(i) * radius * noise;
    float dy = sin(i) * radius * noise;
    curveVertex(cx + dx, cy + dy);
  }
  endShape();
}