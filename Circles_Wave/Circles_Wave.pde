int num =100;
float step, sz, offSet, theta;

void setup() {
  size(1000, 600);
  strokeWeight(1);
  step = 40; // distance between curves
}

void draw() {
  background(0);
  translate(width/2, height);
  for (int i=0; i<num; i++) {
    stroke(255);
    noFill();
    sz = i*step;
    float offSet = TWO_PI/num*i;
    float arcEnd = map(sin(theta+offSet),-1,1, PI, TWO_PI);
    arc(0, 0, sz, sz, PI, arcEnd);
  }
  colorMode(RGB);
  resetMatrix();
  theta += .0523;
  
}