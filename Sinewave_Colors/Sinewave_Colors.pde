/*
 * twisted lines
 *
 * @author aadebdeb
 * @date 2017/02/04
 */

PVector[] colors= {
    new PVector(255, 0, 0),
    new PVector(0, 255, 0),
    new PVector(0, 0, 255)
  };
int type;

void setup() {
  size(1000, 800);
  
  
  type = 0;
}

void draw() {
  blendMode(BLEND);
  
  if(type == 0) {
    background(255);
    blendMode(EXCLUSION);
  } else {
    background(0);
    blendMode(SCREEN);
    
  }
  noFill();
  strokeWeight(4);
  for(int i = 0; i < 3; i++) {
    stroke(colors[i].x, colors[i].y, colors[i].z);
    beginShape();
    for(int w = -20; w < width + 20; w += 5) {
      float h = height / 2;
      h += 10 * sin(w * 0.03 + frameCount * 0.07 + i * TWO_PI / 3) * pow(abs(sin(w * 0.001 + frameCount * 0.02)), 5);
      curveVertex(w, h);
    }    
    endShape();
  }
  
}

void mousePressed() {
  if(type == 0) {
    type = 1;
  } else {
    type = 0;
  }
}