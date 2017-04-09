int num=35, frames = 80;
float theta;

void setup() {
  size(1920, 1080);
  frameRate(90);
}


void draw() {
  background(20);
  stroke(240);
  noFill();

  for (int i=0; i<num; i++) {
    float sz = i*10;
    float sw = map(sin(theta+TWO_PI/num*i), -1, 1, .25, 5);
    strokeWeight(sw);
    triangle(width/2, height/2-sz, width/2-sz*0.7, height/2+sz/2, width/2+sz*0.7, height/2+sz/2);
  }
  theta += TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.gif");
}