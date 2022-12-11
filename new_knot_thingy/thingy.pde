// Base code from 3D Knot Coding Challenge

// Coding Train / Daniel Shiffman 
// https://thecodingtrain.com/challenges/87-3d-knots
// https://youtu.be/r6YMKr1X0VA

float angle = 0;
float beta;
int i = 0;
float j = 0.8;
int k = 12;
float l = 0.6;
int m = 8;
float sc = 1.22;
float c;
float f = 0.05;
ArrayList<PVector> vectors = new ArrayList<PVector>();

//float beta = 0;

void setup() {
  size(800, 450, P3D);
}

void draw() {
  background(65,67,97);
  translate(width/2, height * 1/2);
  //rotate(PI/2);
  rotateY(angle);
  angle += 0.03;
  
   if (i < 430) {
  float r = 100*(j + sc * sin(k * beta));
  float theta = 2 * beta;
  float phi = l * PI * sin(m * beta);
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
    if (c < 45) {
      stroke(255,169,231);
      vertex(v.x, v.y, v.z);
    }
    else {
      stroke(255,132,232);
      vertex(v.x, v.y, v.z);
    }
  }
  endShape();
  i += 1;
}