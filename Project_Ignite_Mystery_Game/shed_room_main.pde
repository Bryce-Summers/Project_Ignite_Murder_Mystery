class shed_room_main extends Room {
  //please put variables here
  int timer;

  private boolean holdingWand=true;
  private int wandRange=100;
  private MusicPlayer musicPlayer=new MusicPlayer();


  void setup() {
    musicPlayer.play();
    timer=0;
  }

  void draw() {
    noFill();
    timer++;

    background(255);

    drawConcealed();
    drawNormal();
  }

  void drawLineObject(int[][] lineObject) {
    for (int i=shed_room_objects.DATA_START; i<lineObject.length; i++) {
      int[] coors=lineObject[i];
      int x1=coors[0];
      int y1=coors[1];
      int x2=coors[2];
      int y2=coors[3];
      line(x1, y1, x2, y2);
    }
  }

  void drawCircleObject(int[][] circleObject) {
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

  void drawConcealed() {
    if (holdingWand) {
      drawConcealedLines();
      drawConcealedCircles();
      loadPixels();
      for (int x=0; x<width; x++) {
        for (int y=0; y<height; y++) {
          if (getDistance(x, y, mouseX, mouseY)>wandRange) {
            int index=x+y*width;
            pixels[index]=color(255);
          }
        }
      }
      updatePixels();
    }
  }


  void drawConcealedLines() {
    for (int[][] object_lines : shed_room_objects.room_lines) {
      if (object_lines[0][0]==shed_room_objects.CONCEALED) {
        drawLineObject(object_lines);
      }
    }
  }

  void drawConcealedCircles() {
    for (int[][] object_circles : shed_room_objects.room_circles) {
      if (object_circles[0][0]==shed_room_objects.CONCEALED) {
        drawCircleObject(object_circles);
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
        drawLineObject(object_lines);
      }
    }
  }

  void drawVisibleCircles() {
    for (int[][] object_circles : shed_room_objects.room_circles) {
      if (object_circles[0][0]==shed_room_objects.SHOWING) {
        drawCircleObject(object_circles);
      }
    }
  }

  void mouseClicked() {
    println("click registered");
    if (checkLineObjectClicked(shed_room_objects.exit_arrow)) {
      println("\texit arrow clicked");
      //goToRoom()      //where does the shed lead to?
    } else if (checkCircleObjectClicked(shed_room_objects.face_circles)) {
      println("\t\tface clicked");
      int dist=(int)(Math.random()*100);
      int dir=(int)(Math.random()*2);
      translateObject(shed_room_objects.face_circles, dist, dir);
      translateObject(shed_room_objects.face_smile, dist, dir);
    }
  }

  void translateObject(int[][] object, int dist, int dir) {//dir==0, horiz    dir==1, vert
    int[][] oldObject=new int[object.length][object[shed_room_objects.DATA_START].length];
    set(object, oldObject);
    println("init set passed");
    for (int i=shed_room_objects.DATA_START; i<object.length; i++) {
      for (int j=dir; j<object[i].length; j+=2) {
        object[i][j]+=dist;
      }
    }
    int[] bounds=getLineObjectBounds(object);
    int minX=bounds[0];
    int minY=bounds[1];
    int maxX=bounds[2];
    int maxY=bounds[3];
    if (minX<0||minY<0||maxX>width||maxY>height) {
      println("starting final set");
      set(oldObject, object);
      println("final set passed");
      translateObject(object, -dist, dir);
    }
  }

  void set(int[][] input, int[][] output) {
    for (int i=0; i<output.length; i++) {
      for (int j=0; j<output[i].length; j++) {
        output[i][j]=
          input[i][j];
      }
    }
  }

  /////////////////////clicking not working////////////////////
  boolean checkLineObjectClicked(int[][] lineObject) {
    int[] bounds=getLineObjectBounds(lineObject);
    int minX=bounds[0];
    int counter=0;

    background(255);
    drawLineObject(lineObject);
    loadPixels();
    for (int x=minX; x<mouseX; x++) {
      int index=mouseY*width+x;
      if (pixels[index]<255) {
        counter++;
      }
    }
    draw();
    return counter%2==1;
  }

  boolean checkCircleObjectClicked(int[][] circleObject) {
    int[] bounds=getCircleObjectBounds(circleObject);
    int minX=bounds[0];
    int counter=0;

    background(255);
    drawCircleObject(circleObject);
    loadPixels();
    for (int x=minX; x<mouseX; x++) {
      int index=mouseY*width+x;
      if (pixels[index]!=color(255)) {
        counter++;
      }
    }
    draw();
    return counter%2==1;
  }

  int[] getLineObjectBounds(int[][] lineObject) {
    int minX=width;
    int minY=height;
    int maxX=0;
    int maxY=0;
    for (int i=shed_room_objects.DATA_START; i<lineObject.length; i++) {
      for (int j=0; j<lineObject[i].length; j++) {
        int coor=lineObject[i][j];
        if (j%2==0) {//if is x coor
          minX=Math.min(minX, coor);
          maxX=Math.max(maxX, coor);
        } else {
          minY=Math.min(minY, coor);
          maxY=Math.max(maxY, coor);
        }
      }
    }

    return new int[]{minX, minY, maxX, maxY};
  }

  int[] getCircleObjectBounds(int[][] circleObject) {
    int minX=width;
    int minY=height;
    int maxX=0;
    int maxY=0;
    for (int i=shed_room_objects.DATA_START; i<circleObject.length; i++) {
      int radius=(int)getDistance(circleObject[i][0], circleObject[i][1], circleObject[i][2], circleObject[i][3]);
      int centerX=circleObject[i][0];
      int centerY=circleObject[i][1];

      minX=Math.min(minX, centerX-radius);
      maxX=Math.max(maxX, centerX+radius);
      minY=Math.min(minY, centerY-radius);
      maxY=Math.max(maxY, centerY+radius);
    }

    return new int[]{minX, minY, maxX, maxY};
  }

  double getDistance(double x1, double y1, double x2, double y2) {
    double dX=x2-x1;
    double dY=y2-y1;
    return Math.sqrt(Math.pow(dX, 2)+Math.pow(dY, 2));
  }
}