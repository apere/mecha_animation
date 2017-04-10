float linesY;
PVector[] colors= {
    new PVector(255, 0, 0),
    new PVector(0, 0, 255),
    new PVector(0, 255, 0)
  };

void setup()
{
  size(960, 540);
  linesY = height/2;
  smooth();
  //noLoop();
}

void draw()
{
  background(0);
  noFill();
  stroke(255,155*sin(.025*frameCount) + 200); 
  //strokeWeight(2);
  //blendMode(EXCLUSION);

  strokeWeight(2.5 - sin(.075*frameCount)*2 );
  for(int i = 0; i < 100; i+=100)
  {
    float xV = (width/3)-i+ (noise(2*.0001, (frameCount*.01), i*.0001 )*100); //noise always return a number between 0,1
 
 for(int k = 0; k < 30; k+=5) {
  beginShape();
    vertex(abs(sin(.0025*frameCount))*width,1.2*height);
    vertex(xV + k, mouseY+k );
    vertex(1.2*width + k*sin(frameCount*.005), 1.2*abs(sin(.0025*frameCount))*height);
  endShape();
  
  beginShape();
    vertex(abs(sin(.0025*frameCount+100))*width,-50);
    vertex(xV+ k, mouseY+k);   
    vertex(1.2*k* sin(frameCount*.005) - 50, 1.2*abs(sin(.0025*frameCount+100))*height);
  endShape();
 }
  }  
  
}