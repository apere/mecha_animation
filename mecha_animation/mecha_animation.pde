import processing.video.*;

int sequence, numSequence;

float rX, rY, rW, rH, rX1, rY1, rW1, rH1;

int lilFrame, lilFrame2;
int heightFrame;
int genericStrokeWeight = 4;

int rSpeed = 3;
float[] offset = new float[313];

int num4 =100;
float step4, sz4, offSet4, theta4;

PGraphics[] pg;
PImage output, output2;

int maskWidth;

float maskLoc1, maskLoc2;

float angle3;
float rX3;
float rY3;
float strokeSize3;

float sinSteps;
int numSinSteps = 7;
int sinOffset;

String movieFiles[] = {
 "","","","","","","stand_still.mp4"
};


Movie myMovie;

Ball[] balls =  { 
  new Ball(100, 400, 20), 
  new Ball(700, 400, 80) 
};

//PVector[] colors= {
//    new PVector(255, 255, 0),
//    new PVector(0, 255, 255),
//    new PVector(255, 0, 255)
//  };

PVector[] colors= {
    new PVector(255, 0, 0),
    new PVector(0, 255, 0),
    new PVector(0, 0, 255)
  };


void setup() {
  size(1440, 800, P3D);
  //fullScreen();
  smooth(4);
  
  maskWidth = width/12;
 
  background(0);
  
  sequence = 3;
  numSequence = 7;
  
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
  sinOffset = width + 400;
  sinSteps = (height-100)/numSinSteps;
  heightFrame = height/rSpeed + 5; // max number for traveling from top to bottom
  
  // setup an array of values to use as temps for animation
  for(int i = 0; i < offset.length; i++){
     offset[i] = 0; 
  }
}





void draw() {
  // *** debug sequence info ***
  //println("---");
  //println("mask width: " + maskWidth);
  //println(sequence);
  //println(pg[sequence].toString());
  //println("---");
  // ***
  
  // clear frame
  background(0);  
  
  // set X value for the masked areas
  maskLoc1 = mouseX - maskWidth/2;
  maskLoc2 = ((float)mouseY/(float)height) * width;
  
  // draw each sequence image
 // drawSequence(pg[2], 2);
//  drawSequence(pg[3], 3);
//  drawSequence(pg[4], 4);
 //   drawSequence(pg[5], 5);
 drawSequence(pg[6], 6);
  
  // crop each sequence image
 // output = pg[4].get((int)maskLoc1, 0, maskWidth, height);
  //output2 = pg[3].get((int)maskLoc2, 0, maskWidth, height);
  
  // draw background image to screen
  image(pg[6], 0, 0);
  
  // draw cropped images to screen
  //image(output, (int)maskLoc1, 0);
  //image(output2, (int)maskLoc2, 0);
  
  
}

// chooses the sequence to draw
void drawSequence(PGraphics pg, int sequence) {
  pg.beginDraw();
    pg.background(0,0,0,0);
  pg.endDraw();
  
  switch(sequence) {
   case 0:
     drawLines(pg);    
   break;
       
   case 1:
     drawColoredRect(pg);
   break;
     
   case 2: 
     drawCircles(pg);
   break;
   
   case 3:
     drawTwoCircles(pg);
   break;
   
   case 4:
     drawCircleWave(pg);
   break;
   
   case 5:
     drawSineColors(pg);
   break;
   
   case 6:
     playMovie(pg);
   break;
   
   default:
     // catchall, do nothing
   break;
    
  } 
}

// move to the next sequence 
// (really only useful for playing a single sequence at a time)
void nextSequence() {
  println("--- next sequence ---");
  sequence++;
  if(sequence >= numSequence) {
   sequence = 0; 
  }
  reset(sequence);
}

// set everything back to zero
void reset(int sequence) {
  lilFrame = 0;
  lilFrame2 = 0;
  for(int i = 0; i < offset.length; i++){
     offset[i] = 0; 
  }
  
  chooseVal(sequence);
}

// reset sequence specific variables
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
      rX1 = (width/2) - rW1/2;
      rY1 = (height/2) - rH1/2;
    break;
    
    case 2:
    
    break;
    
    case 3:
      angle3 = 0;
      rX3 = 100;
      rX3 = 450;
      strokeSize3 = 20;
    break;
    
    case 4:
      step4 = 150;
    break;
    
    case 5:
      
    break;
    
    case 6:
      myMovie = new Movie(this, movieFiles[sequence]);
      myMovie.loop();
      println("Movie playing");
    break;
      
    default:
      rX = 0;
      rY = height;
      rW = width;
      rH = 5;
    break;
  } 
}

void playMovie(PGraphics pg) {
  pg.beginDraw();
    pg.image(myMovie, 0, 0);
  pg.endDraw();
  
  
}


void drawSineColors(PGraphics pg) {
  pg.beginDraw();
  pg.background(0,0);
  //pg.blendMode(BLEND);
  pg.blendMode(SCREEN);
  
  pg.noFill();
  pg.strokeWeight(4);
  for(int k = 0; k < numSinSteps; k++) {
    for(int i = 0; i < 3; i++) {
      pg.stroke(colors[i].x, colors[i].y, colors[i].z);
      pg.beginShape();
      for(int w = - 40 + sinOffset + k*50 + (int)offset[40+k] ; w < (width + sinSteps*(k)); w += 5) {
        float h = height - 100 - (sinSteps*k);
        h += 10 * sin((w) * 0.03 + (frameCount+100) * 0.07 + i * TWO_PI / 3) * pow(abs(sin(w * 0.001 + (frameCount+75) * 0.02)), 5);
        pg.curveVertex(w-(sinSteps*k), h);
      }    
      pg.endShape();
    }
    offset[40+k]-=5;
  }
  
  
  pg.endDraw();
 
  
  
  
}

void drawTwoCircles(PGraphics pg) {
  pg.background(0,0);
  angle3 += 0.075;

  float distanceFromCenter = mouseX/2 +10;
  //centerx = mouseX;
  //centery = mouseY;
  
  rX3 = rX3 + cos(angle3);

  float xPos = rX3 + cos(angle3) * distanceFromCenter;
  float yPos = rY3 + sin(angle3) * distanceFromCenter;
  pg.strokeWeight(genericStrokeWeight);
  pg.fill(0,0);
  

  for (int i=800; i>strokeSize3; i-=strokeSize3*2)
  {
    pg.beginDraw();
    pg.stroke(255, 250);
    pg.ellipse (xPos, yPos, i, i);
    pg.ellipse (yPos, xPos, i, i);
    pg.endDraw();
  }
}

void drawCircleWave(PGraphics pg) {
  pg.beginDraw();
  pg.background(0,0);
  pg.translate(width/2, height);
  pg.strokeWeight(genericStrokeWeight);
  for (int i=0; i<num4; i++) {
    
    pg.stroke(255, 250);
    pg.noFill();
    sz4 = i*step4;
    float offSet = TWO_PI/num4*i;
    float arcEnd = map(sin(theta4+offSet),-1,1, PI, TWO_PI);
    pg.arc(0, 0, sz4, sz4, PI, arcEnd);
    
  }

  pg.endDraw();
  theta4 += .0523;
  
}

void drawLines(PGraphics pg) {
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
}

void drawColoredRect(PGraphics pg) {
   pg.beginDraw();
     pg.strokeWeight(0);
     pg.fill(230,230,230,100);
     pg.rect(0, height/2 + 10, width, 20);
     pg.fill(0,0,0,0);
     pg.strokeWeight(2);
     pg.stroke(255,0,0);
     pg.rect(rX1+offset[22], rY1+offset[211], rW1+offset[21], rH1);
     pg.stroke(0,255,0);
     pg.rect(rX1, rY1+offset[23], rW1+offset[24], rH1+offset[25]);
     pg.stroke(0,0,255);
     pg.rect(rX1, rY1+offset[26], rW1+offset[27], rH1);
     pg.stroke(255,255,255);
     pg.rect(rX1+offset[28], rY1, rW1+offset[29], rH1+offset[210]);
   pg.endDraw();
   offset[21] = ((float)mouseX/(float)width/2)*lilFrame2;
   offset[22] = -((float)mouseY/(float)height/2)*lilFrame2/8;
   offset[23] = ((float)mouseY/(float)height/2)*lilFrame2/7;
   offset[24] = -((float)mouseX/(float)width/2)*lilFrame2/6;
   offset[25] = ((float)mouseY/(float)height/2)*lilFrame2/4;
   offset[26] = ((float)mouseX/(float)width/2)*lilFrame2/5;
   offset[27] = -((float)mouseY/(float)height/2)*lilFrame2/8;
   offset[28] = ((float)mouseY/(float)height/2)*lilFrame2/9;
   offset[29] = ((float)mouseX/(float)width/2)*lilFrame2/12;
   offset[210] = -((float)mouseY/(float)height/2)*lilFrame2/9;
   offset[211] = ((float)mouseY/(float)height/2)*lilFrame2/7;
   
   
   println("lilFrame2 " + lilFrame2);
   println("29: " + rW+offset[29]);
 
   lilFrame2++; 
   if(lilFrame2 > 300) {
      lilFrame2 = 0; 
   }
}

void drawCircles(PGraphics pg) {
  pg.beginDraw();
    pg.background(0, 0, 0, 0);
  pg.endDraw();

  for (Ball b : balls) {
    b.update();
    b.display(pg);
    b.checkBoundaryCollision();
  }
  
  balls[0].checkCollision(balls[1]);
  
}

void movieEvent(Movie m) {
  m.read();
}