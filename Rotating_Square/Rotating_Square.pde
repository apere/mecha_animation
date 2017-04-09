void setup() {
  size(1000, 800);
}
int w = 1000, N=20, r=0;
float t=0, k=0;
void draw() {
  background(#000000);
  float dw = width/N;
  translate(width/2, height/2);
  noStroke();
  rectMode(CENTER);
  for (int i=0; i<N; i++) { 
    rotate(radians(t*(N-i)));
    if (i%2==0)fill(-1);
    else fill(#000000);
    rect(0, 0, w-i*dw, w-i*dw, r*(N-i), r*(N-i), r*(N-i), r*(N-i) );
  }
  t = sin(radians(k));
  k++;
}