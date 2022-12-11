// Base code from 3D Knot Coding Challenge

// Coding Train / Daniel Shiffman 
// https://thecodingtrain.com/challenges/87-3d-knots
// https://youtu.be/r6YMKr1X0VA

float angle = 0;
float beta;
int i = 0;
float j = 0.8;
int k = 12;
float sc = 1.22;
float c;
float f = 0.05;
ArrayList<PVector> vectors = new ArrayList<PVector>();

//float beta = 0;

void setup() {
  size(800, 450, P3D);
}

void draw() {
  background(206,71,96);
  translate(width/2, height * 3/4);
  //rotate(PI/2);
  rotateY(angle);
  angle += 0.03;
  
   if (i < 430) {
  float r = 100*(j + sc * sin(k * beta));
  float theta = 2 * beta;
  float phi = 0.6 * PI * sin(12 * beta);
  float x = r * cos(phi) * cos(theta);
  float z = r * cos(phi) * sin(theta);
  float y = -r * sin(phi);
  vectors.add(new PVector(x,y,z));

   beta += f;
  }


  noFill();
  stroke(255);
  strokeWeight(3);
  //int i = 0;
  beginShape();
  for (PVector v : vectors) {
    c = v.mag();
    if (c < 190) {
      stroke(239,203,104);
      vertex(v.x, v.y, v.z);
    }
    else {
      stroke(99,132,117);
      vertex(v.x, v.y, v.z);
    }
  }
  endShape();
  i += 1;
}