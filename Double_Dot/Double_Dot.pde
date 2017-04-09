float angle;

void setup(){
  size(250,250);
  angle = 0;
}

void draw(){
  background(0);
  angle += 0.05;
  
  float cosVal = cos(angle);
  
  float distanceFromCenter = 50;
  
  float xPos = width/2 + cos(angle) * distanceFromCenter;
  float yPos = height/2 + sin(angle) * distanceFromCenter;

fill (255);
  ellipse (xPos, yPos, 410, 410);

  fill (255);
  ellipse (yPos, xPos, 410, 410);

  fill (0);
  ellipse (xPos, yPos, 390, 390);

  fill (0);
  ellipse (yPos, xPos, 390, 390);

  fill (255);
  ellipse (xPos, yPos, 370, 370);

  fill (255);
  ellipse (yPos, xPos, 370, 370);

  fill (0);
  ellipse (xPos, yPos, 350, 350);

  fill (0);
  ellipse (yPos, xPos, 350, 350);


  fill (255);
  ellipse (xPos, yPos, 330, 330);

  fill (255);
  ellipse (yPos, xPos, 330, 330);

  fill (0);
  ellipse (xPos, yPos, 310, 310);

  fill (0);
  ellipse (yPos, xPos, 310, 310);

  fill (255);
  ellipse (xPos, yPos, 290, 290);

  fill (255);
  ellipse (yPos, xPos, 290, 290);

  fill (0);
  ellipse (xPos, yPos, 270, 270);

  fill (0);
  ellipse (yPos, xPos, 270, 270);

fill (255);
  ellipse (xPos, yPos, 250, 250);

  fill (255);
  ellipse (yPos, xPos, 250, 250);

  fill (0);
  ellipse (xPos, yPos, 230, 230);

  fill (0);
  ellipse (yPos, xPos, 230, 230);

  fill (255);
  ellipse (xPos, yPos, 210, 210);

  fill (255);
  ellipse (yPos, xPos, 210, 210);

  fill (0);
  ellipse (xPos, yPos, 190, 190);

  fill (0);
  ellipse (yPos, xPos, 190, 190);

  fill (255);
  ellipse (xPos, yPos, 170, 170);

  fill (255);
  ellipse (yPos, xPos, 170, 170);

  fill (0);
  ellipse (xPos, yPos, 150, 150);

  fill (0);
  ellipse (yPos, xPos, 150, 150);

  fill (255);
  ellipse (xPos, yPos, 130, 130);

  fill (255);
  ellipse (yPos, xPos, 130, 130);

  fill (0);
  ellipse (xPos, yPos, 110, 110);

  fill (0);
  ellipse (yPos, xPos, 110, 110);

  fill (255);
  ellipse (xPos, yPos, 90, 90);

  fill (255);
  ellipse (yPos, xPos, 90, 90);

  fill (0);
  ellipse (xPos, yPos, 70, 70);
  
  fill (0);
  ellipse (yPos, xPos, 70, 70);

  fill (255);
  ellipse (xPos, yPos, 50, 50);
  
  fill (255);
  ellipse (yPos, xPos, 50, 50);
  
  fill (0);
  ellipse (xPos, yPos, 30, 30);
  
  fill (0);
  ellipse (yPos, xPos, 30, 30);
  
  fill (255,255,0);
  ellipse (xPos, yPos, 10, 10);
  
  fill (0,0,255);
  ellipse (yPos, xPos, 10, 10);
  
  //center
  noStroke();
  fill (255,0,0);
  ellipse(width/2, height/2, 10, 10);
}