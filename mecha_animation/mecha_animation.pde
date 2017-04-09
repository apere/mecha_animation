int sequence, numSequence;

float rX, rY, rW, rH;

int lilFrame;
int heightFrame;

int rSpeed = 3;
int[] offset = new int[313];

PGraphics[] pg;

void setup() {
  size(800, 400, P2D);
  background(0);
  sequence = 1;
  numSequence = 2;
  lilFrame = 0;
  
  pg = new PGraphics[numSequence];
  for(int i = 0; i < pg.length; i++) {
    pg[i] = createGraphics(width, height); 
  }
  
  chooseVal();
  
  heightFrame = height/rSpeed + 5;
  
  for(int i = 0; i < offset.length; i++){
     offset[i] = 0; 
  }
}




void draw() {
   
  background(0);
  println("---");
  println(sequence);
  println(pg[sequence].toString());
  println("---");
  drawSequence(pg[sequence]);
  image(pg[sequence], 0, 0);
  
  
}

void reset() {
  lilFrame = 0;
  for(int i = 0; i < offset.length; i++){
     offset[i] = 0; 
  }
  
  chooseVal();
}

void drawSequence(PGraphics pg) {
  pg.beginDraw();
    pg.background(0,0,0,0);
  pg.endDraw();
  
  switch(sequence) {
   case 0:
     pg.beginDraw();
       pg.rect(rX, rY, rW, rH);
     pg.endDraw();
     
     if(lilFrame < heightFrame) { // rising white
       rY = rY - rSpeed; 
       rH = rH + rSpeed;
     } else if(lilFrame >= heightFrame && lilFrame < heightFrame*2) { // white shrinking up
       rH = rH - rSpeed;
     } else if(lilFrame >= heightFrame*2 && lilFrame < heightFrame*3) { // single white line moving up
       rH = 1;
       rY = rY + rSpeed;
     } else if(lilFrame >= heightFrame*3 && lilFrame < heightFrame*3.5) { // single white line moving up
       rY = rY - rSpeed;
     }else if(lilFrame >= heightFrame*3.5 && lilFrame < heightFrame*3.75) {  } // pause 
     else if(lilFrame >= heightFrame*3.75 && lilFrame < heightFrame*4) { // 2 lines move outward
       //rY = rY - rSpeed;
       pg.beginDraw();
        pg.stroke(255, 255, 255);
        pg.rect(rX, rY+offset[0], rW, rH);
        pg.rect(rX, rY-offset[0], rW, rH);
       pg.endDraw();
       offset[0]++;
     }else if(lilFrame >= heightFrame*4 && lilFrame < heightFrame*5) {  // pause 
       pg.beginDraw();
        pg.stroke(255, 255, 255);
        pg.rect(rX, rY+offset[0], rW, rH);
        pg.rect(rX, rY-offset[0], rW, rH);
       pg.endDraw();
     }
     else if(lilFrame >= heightFrame*5 && lilFrame < heightFrame*5.25) {  // add two more lines outward
       pg.beginDraw();
        pg.stroke(255, 255, 255);
        pg.rect(rX, rY+offset[0], rW, rH);
        pg.rect(rX, rY-offset[0], rW, rH);
        pg.rect(rX, rY+offset[0] + offset[1], rW, rH);
        pg.rect(rX, rY-offset[0]-offset[1], rW, rH);
       pg.endDraw();
       offset[1]++;
     } 
      else if(lilFrame >= heightFrame*5.25 && lilFrame < heightFrame*6.25) {  // pause
       pg.beginDraw();
        pg.stroke(255, 255, 255);
        pg.rect(rX, rY+offset[0], rW, rH);
        pg.rect(rX, rY-offset[0], rW, rH);
        pg.rect(rX, rY+offset[0]+offset[1], rW, rH);
        pg.rect(rX, rY-offset[0]-offset[1], rW, rH);
       pg.endDraw();
      }
      else if(lilFrame >= heightFrame*6.25 && lilFrame < heightFrame*8) {  // outward & grow
       pg.beginDraw();
        pg.stroke(255, 255, 255);
        pg.rect(rX, rY+offset[0], rW, rH + offset[3]);
        pg.rect(rX, rY-offset[0], rW, rH + offset[3]);
        pg.rect(rX, rY+offset[0]+offset[1], rW, rH+offset[3]);
        pg.rect(rX, rY-offset[0]-offset[1], rW, rH+offset[3]);
       pg.endDraw();
       offset[0] -= 1;
       offset[1] -= 1;
       offset[3] ++;
      }else if(lilFrame >= heightFrame*8 && lilFrame < heightFrame*8.75) {  // outward & grow
       pg.beginDraw();
        pg.stroke(255, 255, 255);
        pg.rect(rX, rY+offset[0], rW, rH + offset[3]);
        pg.rect(rX, rY-offset[0], rW, rH + offset[3]);
        pg.rect(rX, rY+offset[0]+offset[1], rW, rH+offset[3]);
        pg.rect(rX, rY-offset[0]-offset[1], rW, rH+offset[3]);
       pg.endDraw();
       offset[0] -= 10;
       offset[3] += 6;
      }
     
     
     
     else {
       nextSequence();
     }
     lilFrame++;  
     break;
       
     case 1:
     
     pg.beginDraw();
       pg.rect(rX, 100, rW, rH);
     pg.endDraw();
     
     if(lilFrame >= 120) {
        nextSequence(); 
     }
     
     lilFrame++;
     break;
    
  } 
}

void nextSequence() {
  println("--- next sequence ---");
  sequence++;
  if(sequence >= numSequence) {
   sequence = 0; 
   reset();
  }
  reset();
}

void chooseVal() {
  switch(sequence) {
    case 0: 
      rX = 0;
      rY = height;
      rW = width;
      rH = 5;
      break;
    case 1:
      rX = 0;
      rY = height;
      rW = width;
      rH = 5;
      break;
      
     default:
       rX = 0;
       rY = height;
       rW = width;
       rH = 5;
       break;
  } 
}