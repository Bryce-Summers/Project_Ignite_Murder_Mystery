import java.util.Arrays;

class shed_room_main extends Room {
  //please put variables here
  private int timer;

  private int wandRange=100;
  private MusicPlayer musicPlayer=new MusicPlayer();

  /////////////////////progression of room status////////////////////////
  private boolean powderEaten=false;
  private boolean chairSquashed=false;
  private boolean holdingWand=false;
  private boolean knifeFound=false;
  private int faceClickCount=0;
  private boolean doorOpened=false;

  void setup() {
    timer=0;
  }


  ///////////////user interaction//////////////////////////////
  void mouseClicked() {
    if (checkLineObjectClicked(shed_room_objects.paper)) {
      powderEaten=true;
      shed_room_objects.powder[0][0]=shed_room_objects.HIDDEN;
    } else if (powderEaten&&checkLineObjectClicked(shed_room_objects.chair)&&shed_room_objects.chair[0][0]==shed_room_objects.SHOWING) {
      chairSquashed=true;
      shed_room_objects.chair[0][0]=shed_room_objects.HIDDEN;
      shed_room_objects.squashedChair[0][0]=shed_room_objects.SHOWING;
    } else if (chairSquashed&&checkLineObjectClicked(shed_room_objects.magicWand)) {
      shed_room_objects.magicWand[0][0]=shed_room_objects.HIDDEN;
      holdingWand=true;
    } else if (holdingWand&&checkLineObjectClicked(shed_room_objects.dagger)) {
      knifeFound=true;
      shed_room_objects.dagger[0][0]=shed_room_objects.HIDDEN;
    } else if (knifeFound&&checkCircleObjectClicked(shed_room_objects.face_circles)) {
      int dist=(int)(Math.random()*wandRange+wandRange)*(Math.random()<.5?-1:1);
      int dir=(int)(Math.random()*2);
      translateObject(shed_room_objects.face_circles, dist, dir);
      faceClickCount++;
      if (faceClickCount>10) {
        player.setCreepo(true);
        print("hi!");
      }
    } else if(holdingWand&&checkCircleObjectClicked(shed_room_objects.door_closed)){
      //fall into new room;
      doorOpened=true;
      shed_room_objects.door_closed[0][0]=shed_room_objects.HIDDEN;
      shed_room_objects.door_open_circles[0][0]=shed_room_objects.SHOWING;
      shed_room_objects.door_open_lines[0][0]=shed_room_objects.SHOWING;
    }
  }

  private void translateObject(int[][] object, int dist, int dir) {//dir==0, horiz    dir==1, vert
    int[][] oldObject=new int[object.length][object[shed_room_objects.DATA_START].length];
    copyOver(object, oldObject);
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
      copyOver(oldObject, object);
      translateObject(object, -dist, dir);
    }
  }

  /////////////////////clicking////////////////////
  private boolean checkLineObjectClicked(int[][] lineObject) {
    int[] bounds=getLineObjectBounds(lineObject);
    int minX=bounds[0];
    int minY=bounds[1];
    int maxX=bounds[2];
    int maxY=bounds[3];
    int counter=0;

    //background(255);
    //drawLineObject(lineObject);
    //loadPixels();
    //for (int x=minX; x<mouseX; x++) {
    //  int index=mouseY*width+x;
    //  if (pixels[index]==color(0)) {
    //    counter++;
    //  }
    //}
    //draw();
    //return counter%2==1;

    return mouseX>minX&&mouseX<maxX&&mouseY>minY&&mouseY<maxY;
  }

  private boolean checkCircleObjectClicked(int[][] circleObject) {
    int[] bounds=getCircleObjectBounds(circleObject);
    int minX=bounds[0];
    int minY=bounds[1];
    int maxX=bounds[2];
    int maxY=bounds[3];
    int counter=0;

    //background(255);
    //drawCircleObject(circleObject);
    //loadPixels();
    //for (int x=minX; x<mouseX; x++) {
    //  int index=mouseY*width+x;
    //  if (pixels[index]!=color(255)) {
    //    counter++;
    //  }
    //}
    //draw();
    //return counter%2==1;

    return mouseX>minX&&mouseX<maxX&&mouseY>minY&&mouseY<maxY;
  }

  private int[] getLineObjectBounds(int[][] lineObject) {
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

  private int[] getCircleObjectBounds(int[][] circleObject) {
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

  private double getDistance(double x1, double y1, double x2, double y2) {
    double dX=x2-x1;
    double dY=y2-y1;
    return Math.sqrt(Math.pow(dX, 2)+Math.pow(dY, 2));
  }


  /////////////////////////////drawing/////////////////////////////////
  void draw() {
    //musicPlayer.play();
    noFill();
    timer++;

    background(255);

    drawConcealed();
    drawNormal();
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

  private  void drawVisibleLines() {
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

  ////////////////////////misc///////////////
  public void copyOver(int[][] input, int[][] output) {
    for (int i=0; i<output.length; i++) {
      for (int j=0; j<output[i].length; j++) {
        output[i][j]=
          input[i][j];
      }
    }
  }
}