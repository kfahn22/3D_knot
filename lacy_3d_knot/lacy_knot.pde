// 3D Knot
// Coding Train / Daniel Shiffman / Kathy
// https://thecodingtrain.com/challenges/87-3d-knots
// https://youtu.be/r6YMKr1X0VA

// Code from challenge https://github.com/CodingTrain/Coding-Challenges/tree/main/087_3D_Knots/Processing

float angle = 0;
float beta;
float sc = 1.22;
float c;
ArrayList<PVector> vectors = new ArrayList<PVector>();

float f = 0.05; // 0.01
int i = 0;
//float beta = 0;

void setup() {
  size(800, 450, P3D);
}

void draw() {
  background(189,207,181);
  //background(206,71,96);
  translate(width/2, height/2);
  
  rotateY(angle);
  angle += 0.03;
  if (i < 430) {
  float r = 100*(0.8 + sc * sin(6 * beta));
  float theta = 2 * beta;
  float phi = 0.6 * PI * sin(12 * beta);
  float x = r * cos(phi) * cos(theta);
  float y = r * cos(phi) * sin(theta);
  float z = r * sin(phi);
  vectors.add(new PVector(x,y,z));

   beta += f;
  }
  
  noFill();
  beginShape();
  for (PVector v : vectors) {
    c = v.mag();
    if (c < 50) {
      strokeWeight(1);
      stroke(178, 135, 163);
      vertex(v.x, v.y, v.z);
    }
    else if (c < 150) {
      strokeWeight(2);
      stroke(126,78,96);
      vertex(v.x, v.y, v.z);
    }
    else {
      strokeWeight(4);
      stroke(72,39,40);
      // stroke(144,227,154);
      vertex(v.x, v.y, v.z);
    } 
  }
  i += 1;
 // println(i);
  
  endShape();
}