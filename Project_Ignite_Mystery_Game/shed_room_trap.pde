import java.awt.*;
import java.util.*;

class shed_room_trap extends Room {
  PImage image;
  private shed_room superRoom;
  private int fluctuation=1;
  private int increase=32;

  public void setSuperRoom(shed_room superRoom) {
    this.superRoom=superRoom;
  }

  public void setup() {
  }
  
  public void mousePressed(){
    fluctuation*=increase;
    increase/=4;
    print(fluctuation);
    increase=(increase<2?2:increase);
    if(fluctuation>=Math.pow(2,14)){
      superRoom.setCurrentSubRoom('m');
    }
  }

  /////////////////////////////drawing/////////////////////////////////
  void draw() {
    noFill();

    background(0);
    stroke(255);
    drawNormal();
    makeSpotLight();
    drawConcealed();
    makeText();
    fluctuate();
  }

  private void drawLineObject(int[][] lineObject) {
    for (int i=shed_room_objects.DATA_START; i<lineObject.length; i++) {
      int[] coors=lineObject[i];
      int x1=coors[0];
      int y1=coors[1];
      int x2=coors[2];
      int y2=coors[3];
      line(x1, y1, x2, y2);
    }
  }

  private void drawCircleObject(int[][] circleObject) {
    for (int i=shed_room_objects.DATA_START; i<circleObject.length; i++) {
      int[] circle=circleObject[i];
      int x1=circle[0];
      int y1=circle[1];
      int x2=circle[2];
      int y2=circle[3];

      int dX=x2-x1;
      int dY=y2-y1;
      int diameter=(int)Math.sqrt(Math.pow(dX, 2)+Math.pow(dY, 2));

      ellipse(x1, y1, diameter, diameter);
    }
  }

  private void drawConcealed() {
    drawConcealedLines();
    drawConcealedCircles();
  }


  private void drawConcealedLines() {
    for (int[][] object_lines : shed_room_objects.room_lines) {
      if (object_lines[0][0]==shed_room_objects.CONCEALED) {
        drawLineObject(object_lines);
      }
    }
  }

  private void drawConcealedCircles() {
    for (int[][] object_circles : shed_room_objects.room_circles) {
      if (object_circles[0][0]==shed_room_objects.CONCEALED) {
        drawCircleObject(object_circles);
      }
    }
  }

  private void drawNormal() {
    drawVisibleLines();
    drawVisibleCircles();
  }

  private void drawVisibleLines() {
    for (int[][] object_lines : shed_room_objects.room_lines) {
      if (object_lines[0][0]==shed_room_objects.SHOWING) {
        drawLineObject(object_lines);
      }
    }
  }

  private  void drawVisibleCircles() {
    for (int[][] object_circles : shed_room_objects.room_circles) {
      if (object_circles[0][0]==shed_room_objects.SHOWING) {
        drawCircleObject(object_circles);
      }
    }
  }

  private void makeSpotLight() {
    int lightRadius=200;
    PGraphics pg=createGraphics(2*lightRadius, 2*lightRadius);
    pg.beginDraw();
    pg.background(0);
    pg.fill(255);//color(100,220,50));
    pg.ellipse(lightRadius, lightRadius, 2*lightRadius, 2*lightRadius);
    pg.endDraw();
    //    image(pg,0,0);
    blend(pg, 0, 0, 2*lightRadius, 2*lightRadius, 
      mouseX-lightRadius, mouseY-lightRadius, 2*lightRadius, 2*lightRadius, EXCLUSION );
  }
  
  private void makeText(){
    String s="GAME OVER";
    fill(255);
    textSize(213);
    textAlign(CENTER,CENTER);
    text(s,width/2,height/2-32);
  }
  
  private void fluctuate(){
    loadPixels();
    for(int i=0;i<pixels.length;i++){
      int colour=pixels[i];
      int red=(int)red(colour);
      int green=(int)green(colour);
      int blue=(int)blue(colour);
      
      int flux=(int)(Math.random()*fluctuation-fluctuation/2);
      
      int newRed=red-flux;//(int)(Math.random()*fluctuation-fluctuation/2);
      int newGreen=green-flux;//(int)(Math.random()*fluctuation-fluctuation/2);
      int newBlue=blue-flux;//(int)(Math.random()*fluctuation-fluctuation/2);
      
      pixels[i]=color(newRed,newGreen,newBlue);
    }
    updatePixels();
  }
}