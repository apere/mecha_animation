float y;

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
  stroke(255,200); 

  
  for(int i = 0; i < 50; i+=40)
  {
  beginShape();
  vertex(0,height);
  //for(int x = 0; x < width; x+=10)
  //{
    //noise always return a number between 0,1
   vertex(mouseX,(height/3)-i+ (noise(2*.01, (frameCount*.01), i*.01 )*300));
    
  //}
  vertex(width, height);
  endShape();
  
  beginShape();
  vertex(0,0);
  //for(int x = 0; x < width; x+=10)
  //{
    //noise always return a number between 0,1
   vertex(mouseX,(height/3)-i+ (noise(2*.01, (frameCount*.01), i*.01 )*300));
    
  //}
  vertex(width, 0);
  endShape();
  
  }  
  
}