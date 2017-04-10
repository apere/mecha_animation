float y;
PVector[] colors= {
    new PVector(255, 0, 0),
    new PVector(0, 0, 255),
    new PVector(0, 255, 0)
  };

void setup()
{
  size(1920, 1080);
  y = height/2;
  smooth();
  //noLoop();
}

void draw()
{
  background(0);
  noFill();
  //stroke(255,200); 
  blendMode(ADD);
  strokeWeight(4);

  strokeWeight(2 - sin(.075*frameCount)*2 );
  for(int i = 0; i < 100; i+=20)
  {
  stroke(colors[(i+2)%colors.length].x, colors[(i+2)%colors.length].y, colors[(i+2)%colors.length].z);
  beginShape();
  
  vertex(0,height);
  //for(int x = 0; x < width; x+=10)
  //{
    //noise always return a number between 0,1
   float xV = (width/3)-i+ (noise(2*.0001, (frameCount*.01), i*.0001 )*100);
   vertex(xV, mouseY);
    
  //}
  vertex(width, height);
  endShape();
  
  beginShape();
  vertex(0,0);
  //for(int x = 0; x < width; x+=10)
  //{
    //noise always return a number between 0,1
   vertex(xV, mouseY);
    
  //}
  vertex(width, 0);
  endShape();
  
  }  
  
}