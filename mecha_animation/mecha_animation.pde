int sequence, numSequence;

float rX, rY, rW, rH;

int lilFrame;
int heightFrame;

int rSpeed = 3;
float[] offset = new float[313];

PGraphics[] pg;
PImage output;

int maskWidth;


void setup() {
  size(800, 400, P2D);
  maskWidth = width/3;
  background(0);
  sequence = 0;
  numSequence = 2;
  lilFrame = 0;
  
  pg = new PGraphics[numSequence];
  output = createGraphics(width, height, P3D);
  
  for(int i = 0; i < pg.length; i++) {
    pg[i] = createGraphics(width, height, P3D); 
  }
  
  chooseVal();
  
  heightFrame = height/rSpeed + 5;
  
  for(int i = 0; i < offset.length; i++){
     offset[i] = 0; 
  }
}





void draw() {
   println("mask width: " + maskWidth);
  background(0);
  println("---");
  println(sequence);
  println(pg[sequence].toString());
  println("---");
  drawSequence(pg[sequence]);
  
  output = pg[sequence].get(mouseX - maskWidth/2, 0, maskWidth, height);
  image(output, mouseX - maskWidth/2, 0);
  
  
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
       pg.fill(0,0,0,1);
       pg.strokeWeight(2);
       pg.stroke(255,0,0);
       pg.rect(rX+offset[2], rY+offset[11], rW+offset[1], rH);
       pg.stroke(0,255,0);
       pg.rect(rX, rY+offset[3], rW+offset[4], rH+offset[5]);
       pg.stroke(0,0,255);
       pg.rect(rX, rY+offset[6], rW+offset[7], rH);
       pg.stroke(255,255,255);
       pg.rect(rX+offset[8], rY, rW+offset[9], rH+offset[10]);
     pg.endDraw();
     offset[1] = ((float)mouseX/(float)width/2)*lilFrame;
     offset[2] = -((float)mouseY/(float)height/2)*lilFrame/8;
     offset[3] = ((float)mouseY/(float)height/2)*lilFrame/7;
     offset[4] = -((float)mouseX/(float)width/2)*lilFrame/6;
     offset[5] = ((float)mouseY/(float)height/2)*lilFrame/4;
     offset[6] = ((float)mouseX/(float)width/2)*lilFrame/5;
     offset[7] = -((float)mouseY/(float)height/2)*lilFrame/8;
     offset[8] = ((float)mouseY/(float)height/2)*lilFrame/9;
     offset[9] = ((float)mouseX/(float)width/2)*lilFrame/7;
     offset[10] = -((float)mouseY/(float)height/2)*lilFrame/9;
     offset[11] = ((float)mouseY/(float)height/2)*lilFrame/7;
     
     
     println(lilFrame);
     println(((float)mouseX/(float)width));
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
      rW = 100;
      rH = 100;
      rX = (width/2) - rW/2;
      rY = (height/2) - rH/2;
      break;
      
     default:
       rX = 0;
       rY = height;
       rW = width;
       rH = 5;
       break;
  } 
}