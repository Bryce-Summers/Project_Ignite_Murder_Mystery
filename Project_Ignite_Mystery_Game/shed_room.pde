//this amazing room programmed by James Wang
/**
 *@author James Wang
 **/
//last modified 28 February 2016

class shed_room extends Room {
  //please put variables here
  int timer;
  
  private boolean holdingWand=false;

  
  void setup() {
    timer=0;
  }

  void draw() {
    noFill();
    
    timer++;

    background(255);

    //@todo:make concealed objects, check in range of wand, set to white all non-in-range pixels

    drawLines();
    drawCircles();
    
    
  }
  
  void mouseMoved(){
    int mouse_dX=mouseX-pmouseX;
    int mouse_dY=mouseY-pmouseY;
  }

  void revealObjects(){
    
  }

  void drawLines() {
    for (int[][] object_lines : shed_room_objects.room_lines) {
      if (object_lines[0][0]==1) {
        for (int i=1; i<object_lines.length; i++) {
          int[] coors=object_lines[i];
          int x1=coors[0];
          int y1=coors[1];
          int x2=coors[2];
          int y2=coors[3];
          //println("x1,y1: "+x1+","+y1+"x2,y2: "+x2+","+y2);
          line(x1, y1, x2, y2);
        }
      }
    }
  }

  void drawCircles() {
    for (int[][] object_circles : shed_room_objects.room_circles) {
      if (object_circles[0][0]==1) {
        for (int i=1; i<object_circles.length; i++) {
          int[] circle=object_circles[i];
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
    }
  }

  void mouseClicked() {
    shed_room_objects.chair[0][0]=(shed_room_objects.chair[0][0]+1)%2;
    shed_room_objects.squashedChair[0][0]=(shed_room_objects.squashedChair[0][0]+1)%2;
  }
}