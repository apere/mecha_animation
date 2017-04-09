void setup() {
  size(300, 300);
}
int w =300, N=13, r=0;
float t=0, k=0;
void draw() {
  background(#000000);
  float dw = 250/N;
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