float angle3;
float rX3;
float rY3;
float strokeSize3;

void setup() {
  size(800, 800);
  angle3 = 0;

  rX3 = 100;
  rY3 = 450;
  strokeSize3 = 20;
}

void draw() {
  background(0);
  angle3 += 0.075;

  float distanceFromCenter = mouseX/2 +10;
  //centerx = mouseX;
  //centery = mouseY;
  
  rX3 = rX3 + cos(angle3);

  float xPos = rX3 + cos(angle3) * distanceFromCenter;
  float yPos = rY3 + sin(angle3) * distanceFromCenter;
  strokeWeight(2);
  fill(0,0);
  

  for (int i=800; i>strokeSize3; i-=strokeSize3*2)
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