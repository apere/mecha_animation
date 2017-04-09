int sequence, numSequence;

float rX, rY, rW, rH, rX1, rY1, rW1, rH1;

int lilFrame, lilFrame2;
int heightFrame;

int rSpeed = 3;
float[] offset = new float[313];

PGraphics[] pg;
PImage output, output2;

int maskWidth;

float maskLoc1, maskLoc2;


void setup() {
  size(800, 400, P2D);
  maskWidth = width/3;
 
  background(0);
  
  sequence = 1;
  numSequence = 2;
  
  lilFrame = 0;
  lilFrame2 = 0;
  
  // create an empty PGraphic for each sequence
  pg = new PGraphics[numSequence];
  output = createGraphics(width, height, P3D);
  output2 = createGraphics(width, height, P3D);
  
  for(int i = 0; i < pg.length; i++) {
    pg[i] = createGraphics(width, height, P3D); 
    chooseVal(i); // set values
  }
  
  heightFrame = height/rSpeed + 5; // max number for traveling from top to bottom
  
  // setup an array of values to use as temps for animation
  for(int i = 0; i < offset.length; i++){
     offset[i] = 0; 
  }
}





void draw() {
  
  println("mask width: " + maskWidth);
  
  background(0);  // clear frame
  
  // *** debug sequence info ***
  println("---");
  println(sequence);
  println(pg[sequence].toString());
  println("---");
  // ***
  
  drawSequence(pg[0], 0);
  maskLoc1 = mouseX - maskWidth/2;
  output = pg[0].get((int)maskLoc1, 0, maskWidth, height);
  image(output, (int)maskLoc1, 0);
  
  drawSequence(pg[1], 1);
  maskLoc2 = ((float)mouseY/(float)height) * width;
  println("yswitch : " + maskLoc2);
  output2 = pg[1].get((int)maskLoc2, 0, maskWidth, height);
  
  image(output2, (int)maskLoc2, 0);
  
  
}

void reset(int sequence) {
  lilFrame = 0;
  lilFrame2 = 0;
  for(int i = 0; i < offset.length; i++){
     offset[i] = 0; 
  }
  
  chooseVal(sequence);
}

void drawSequence(PGraphics pg, int sequence) {
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
       pg.rect(rX1+offset[22], rY1+offset[211], rW1+offset[21], rH1);
       pg.stroke(0,255,0);
       pg.rect(rX1, rY1+offset[23], rW1+offset[24], rH1+offset[25]);
       pg.stroke(0,0,255);
       pg.rect(rX1, rY1+offset[26], rW1+offset[27], rH1);
       pg.stroke(255,255,255);
       pg.rect(rX1+offset[28], rY1, rW+offset[29], rH1+offset[210]);
     pg.endDraw();
     offset[21] = ((float)mouseX/(float)width/2)*lilFrame2;
     offset[22] = -((float)mouseY/(float)height/2)*lilFrame2/8;
     offset[23] = ((float)mouseY/(float)height/2)*lilFrame2/7;
     offset[24] = -((float)mouseX/(float)width/2)*lilFrame2/6;
     offset[25] = ((float)mouseY/(float)height/2)*lilFrame2/4;
     offset[26] = ((float)mouseX/(float)width/2)*lilFrame2/5;
     offset[27] = -((float)mouseY/(float)height/2)*lilFrame2/8;
     offset[28] = ((float)mouseY/(float)height/2)*lilFrame2/9;
     offset[29] = ((float)mouseX/(float)width/2)*lilFrame2/7;
     offset[210] = -((float)mouseY/(float)height/2)*lilFrame2/9;
     offset[211] = ((float)mouseY/(float)height/2)*lilFrame2/7;
     
     
     println(lilFrame2);
 
     lilFrame2++;
     break;
    
  } 
}

void nextSequence() {
  println("--- next sequence ---");
  sequence++;
  if(sequence >= numSequence) {
   sequence = 0; 
  }
  reset(sequence);
}

void chooseVal(int sequence) {
  switch(sequence) {
    case 0: 
      rX = 0;
      rY = height;
      rW = width;
      rH = 5;
      break;
    case 1:
      rW1 = 100;
      rH1 = 100;
      rX1 = (width/2) - rW/2;
      rY1 = (height/2) - rH/2;
      break;
      
     default:
       rX = 0;
       rY = height;
       rW = width;
       rH = 5;
       break;
  } 
}