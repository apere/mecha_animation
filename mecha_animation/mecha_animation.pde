int sequence, numSequence;

float rX, rY, rW, rH;

int tempFrame;

int heightFrame;

int rSpeed = 3;

void setup() {
  size(800, 400, P2D);
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
  background(0);
  switch(sequence) {
   case 0:
     
     stroke(255, 255, 255);
     rect(rX, rY, rW, rH);
     
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