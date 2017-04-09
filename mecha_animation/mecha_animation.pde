int sequence, numSequence;

float rX, rY, rW, rH;

int tempFrame;

int heightFrame;

int rSpeed = 3;

PGraphics pg;

void setup() {
  size(800, 400, P2D);
  pg = createGraphics(width, height);
  background(0);
  sequence = 0;
  numSequence = 1;
  tempFrame = 0;
  
  rX = 0;
  rY = height;
  rW = width;
  rH = 5;
  
  heightFrame = height/rSpeed + 5;
}




void draw() {
  
  switch(sequence) {
   case 0:
     pg.beginDraw();
     pg.background(0);
     pg.stroke(255, 255, 255);
     pg.rect(rX, rY, rW, rH);
     pg.endDraw();
     image(pg, 0, 0);
     
     if(tempFrame < heightFrame) {
       rY = rY - rSpeed; 
       rH = rH + rSpeed;
     } else if(tempFrame >= heightFrame && tempFrame < heightFrame*2) {
       rH = rH - rSpeed;
     }else if(tempFrame >= heightFrame && tempFrame < heightFrame*2) {
       rH = rH - rSpeed;
     } else if(tempFrame >= heightFrame*2 && tempFrame < heightFrame*3) {
       rH = 1;
       rY = rY + rSpeed;
     }
     
     else {
       sequence++;
     }
     tempFrame++;  
     break;
   
    
  }
  
  
  if(sequence > numSequence-1) {
     sequence = 0; 
     reset();
  }
}

void reset() {
  tempFrame = 0;
  
  rX = 0;
  rY = height;
  rW = width;
  rH = 5;
}