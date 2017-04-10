import processing.core.*;
 
public class second extends PApplet {
 
  private final int w, h;
  private PApplet myParent;
 
  public second() {
    w = 1280;
    h = 720;
    myParent = this;
  }
 
  public second(int w, int h, PApplet par) {
    this.w = w;
    this.h = h;
    this.myParent = par;
    println(this.myParent);
  }
 
  public void settings() {
    size(w, h);
  }
 
  public void draw() {
    
    println("ADAMDAMDAMDADMAMDA") ;
    background(255);
    fill(0);
    ellipse(100, 50, 10, 10);
  }
}