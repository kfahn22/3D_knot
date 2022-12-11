// Base code from 3D Knot Coding Challenge

// Coding Train / Daniel Shiffman 
// https://thecodingtrain.com/challenges/87-3d-knots
// https://youtu.be/r6YMKr1X0VA

float angle = 0;
float beta;
int i = 0;
float j = 1.2;
int k = 36; // 48
float l = 0.4;
int m = 6;
int t = 2;
float sc = 1.0;
float c;
float f = 0.05;
ArrayList<PVector> vectors = new ArrayList<PVector>();

//float beta = 0;

void setup() {
  size(800, 450, P3D);
}

void draw() {
  background(0,50,73);
  translate(width/2, height * 1/2);
  //rotate(PI/2);
  rotateY(angle);
  angle += 0.03;
  
  if (i < 430) {
  float r = 90*(j + sc * sin(k * beta));
  float theta = t * beta;
  float phi = l * PI * sin(m * beta);
  float x = r * cos(phi) * cos(theta);
  float y = r * cos(phi) * sin(theta);
  float z = -r * sin(phi);
  vectors.add(new PVector(x,y,z));

   beta += f;
  }


  noFill();
  //stroke(255);
  strokeWeight(3);
  push();
  scale(0.6);
  beginShape();
  for (PVector v : vectors) {
    c = v.mag();
    if (c < 50) {
      stroke(204,219,220);
      vertex(v.x, v.y, v.z);
    }
    else {
      stroke(154,209,212);
      vertex(v.x, v.y, v.z);
    }
  }
  endShape();
  pop();
  push();
  rotate(PI/2);
  beginShape();
  
  for (PVector v : vectors) {
    c = v.mag();
    if (c < 50) {
      stroke(204,219,220);
      vertex(v.x, v.y, v.z);
    }
    else {
      stroke(128,206,215);
      vertex(v.x, v.y, v.z);
    }
  }
  endShape();
  pop();
  i += 1;
}