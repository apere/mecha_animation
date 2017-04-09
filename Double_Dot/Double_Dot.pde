float angle;
float centerx;
float centery;
float strokeSize;

void setup() {
  size(800, 800);
  angle = 0;

  centerx = 100;
  centery = 450;
  strokeSize = 20;
}

void draw() {
  background(0);
  angle += 0.075;

  float distanceFromCenter = mouseX/2 +10;
  //centerx = mouseX;
  //centery = mouseY;
  
  centerx = centerx + cos(angle);

  float xPos = centerx + cos(angle) * distanceFromCenter;
  float yPos = centery + sin(angle) * distanceFromCenter;
  strokeWeight(2);
  fill(0,0);
  

  for (int i=800; i>strokeSize; i-=strokeSize*2)
  {
    stroke(255);
    ellipse (xPos, yPos, i, i);
    stroke(255);
    ellipse (yPos, xPos, i, i);
    //stroke(0);
    //ellipse (xPos, yPos, i-strokeSize, i-strokeSize);
    //stroke(0);
    //ellipse (yPos, xPos, i-strokeSize, i-strokeSize);
  }
}