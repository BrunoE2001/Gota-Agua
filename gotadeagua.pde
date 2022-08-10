import processing.sound.*;
SoundFile Sondgota;
float x = 0;
float y = 0, y1=0;
float difuminacion=2;


void setup() {
  size(500, 500);
  smooth();
  Sondgota = new SoundFile(this, "sfx-water42.mp3");
  Sondgota.play();
}

void draw() {
  background(0);
  y1 += 9;
  difuminacion -= 0.01;
  if (difuminacion == 0.05) {
    difuminacion = 3;
  }

  if (y1 >= 255) {
    y1=255;
    OndaWave(250, 250);
  } else {
    gota();
  }
}

void gota() {
  color c;
  float r;      // radio de las gotas

  r = 7;       // Las gotitas son de tamaño random
  c = color(0, 190, 255);   // Color dorado

  stroke(c);
  fill(c);
  for (int i = 2; i < r; i++ ) {
    ellipse(250, y1 + i*4, i*2, i*2);
  }
}


void OndaWave(float a, float b) {

  noFill();
  strokeWeight(difuminacion);
  x = x + 3;

  if (x > 500) {
    x = 0;
  }
  ellipse(a, b, x, x);
}
