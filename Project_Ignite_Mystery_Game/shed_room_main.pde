class shed_room_main extends Room {
  //please put variables here
  int timer;

  private boolean holdingWand=false;
  private int wandRange=100;
  private MusicPlayer musicPlayer=new MusicPlayer();


  void setup() {
    timer=0;
  }

  void draw() {
    if (mousePressed) {
      this.mouseClicked();
    }
    musicPlayer.play();
    noFill();
    timer++;

    background(255);

    //@todo:make concealed objects, check in range of wand, set to white all non-in-range pixels
    //print(pixels);
    drawConcealed();
    drawNormal();
  }

  void drawConcealed() {
    if (holdingWand) {
      drawConcealedLines();
      drawConcealedCircles();
      loadPixels();
      for (int x=0; x<width; x++) {
        for (int y=0; y<height; y++) {
          if (getDistance(x, y, mouseX, mouseY)>wandRange) {
            int index=x+y*width;
          }
        }
      }
    }
  }


  void drawConcealedLines() {
    for (int[][] object_lines : shed_room_objects.room_lines) {
      if (object_lines[0][0]==shed_room_objects.CONCEALED) {
        for (int i=1; i<object_lines.length; i++) {
          int[] coors=object_lines[i];
          int x1=coors[0];
          int y1=coors[1];
          int x2=coors[2];
          int y2=coors[3];
          line(x1, y1, x2, y2);
        }
      }
    }
  }

  void drawConcealedCircles() {
    for (int[][] object_circles : shed_room_objects.room_circles) {
      if (object_circles[0][0]==shed_room_objects.CONCEALED) {
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

  void drawNormal() {
    drawVisibleLines();
    drawVisibleCircles();
  }

  void drawVisibleLines() {
    for (int[][] object_lines : shed_room_objects.room_lines) {
      if (object_lines[0][0]==shed_room_objects.SHOWING) {
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

  void drawVisibleCircles() {
    for (int[][] object_circles : shed_room_objects.room_circles) {
      if (object_circles[0][0]==shed_room_objects.SHOWING) {
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

  double getDistance(double x1, double y1, double x2, double y2) {
    double dX=x2-x1;
    double dY=y2-y1;
    return Math.sqrt(Math.pow(dX, 2)+Math.pow(dY, 2));
  }
}