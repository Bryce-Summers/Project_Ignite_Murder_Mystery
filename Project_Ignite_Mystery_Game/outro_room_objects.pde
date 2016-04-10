public  class outro_room_objects {

  public outro_room_objects() {
    translateObject(face_smile, -700, 0);
    translateObject(face_circles, -700, 0);
    translateObject(face_smile, -200, 1);
    translateObject(face_circles, -200, 1);
    creepoBoundingBox=getCircleObjectBounds(face_circles);
  }

  ///////////////creepo/////////////////
  int[][] face_circles=new int[][]{
    new int[]{775, 333, 900, 332}, 
    new int[]{800, 310, 832, 310}, 
    new int[]{750, 310, 782, 310}, 
  };

  int[][] face_smile=new int[][]{
    new int[]{730, 355, 825, 355}, 
    new int[]{825, 355, 775, 390}, 
    new int[]{730, 355, 775, 390}, 
  };

  int[] creepoBoundingBox=getCircleObjectBounds(face_circles);

  public int[][][] creepo={face_circles, face_smile};

  public void drawCreepo() {
    noFill();
    drawLineObject(face_smile);
    drawCircleObject(face_circles);
  }

  private void drawLineObject(int[][] lineObject) {
    for (int i=0; i<lineObject.length; i++) {
      int[] coors=lineObject[i];
      int x1=coors[0];
      int y1=coors[1];
      int x2=coors[2];
      int y2=coors[3];
      line(x1, y1, x2, y2);
    }
  }

  private void drawCircleObject(int[][] circleObject) {
    for (int i=0; i<circleObject.length; i++) {
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

  private void translateObject(int[][] object, int dist, int dir) {//dir==0, horiz    dir==1, vert
    for (int i=0; i<object.length; i++) {
      for (int j=dir; j<object[i].length; j+=2) {
        object[i][j]+=dist;
      }
    }
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

  /////////////////////////butler///////////////////
  public String butlerImagePath="butler.png";
  PImage butler=loadImage (butlerImagePath);
  public int[] butlerBoundingBox=new int[]{120,130,465,585};

  public void drawButler() {
    image (butler, 100, 100, butler.width/2.5, butler.height/2.5);
  }


  ////////////////////////////chef///////////////
  public int[] chefBoundingBox={850, 75, 950, 310};

  public void drawChef() {    
    arc(900, 140, 80, 80, -PI/8, PI*9/8 );//Chef Head  
    rect(893, 179, 12, 15, 0, 0, 5, 5); //Chef Neck
    line(893, 190, 863, 210);
    line(863, 210, 863, 300);
    line(905, 190, 935, 210);
    line(935, 210, 935, 300);//Chef Body
    line(865, 130, 885, 130);
    line(895, 130, 915, 130);//Chef Eyes
    ellipse(888, 149, 1, 1);//Chef Nose
    //Chef Moustache                     
    line(862, 124, 935, 124);
    fill(255, 255, 255);
    quad(862, 95, 935, 95, 935, 124, 862, 124);
    ellipse(898, 90, 80, 30);//Chef Hat
    noFill();
    fill(236, 245, 15);
    ellipse(890, 220, 7, 7);
    ellipse(890, 240, 7, 7);
    ellipse(890, 260, 7, 7);
    ellipse(890, 280, 7, 7);
    ellipse(890, 300, 7, 7);
    ellipse(908, 220, 7, 7);
    ellipse(908, 240, 7, 7);
    ellipse(908, 260, 7, 7);
    ellipse(908, 280, 7, 7);
    ellipse(908, 300, 7, 7);//Chef Buttons
    fill(255, 0, 0);
    ellipse(890, 250, 5, 5);
    ellipse(885, 260, 6, 4);
    ellipse(885, 250, 7, 5);//Blood

    noFill();
    line(880, 210, 880, 300);
    line(918, 210, 918, 300);//Chef Arms
    line(870, 160, 915, 160);//Chef Mouth
    //Chef Hat
  }


  //////////////////maid///////////////////
  PGraphics pg=createGraphics(width, height);    
  int[] maidBoundingBox=new int[]{580, 100, 670, 400};
  public void drawMaid() {
    //rect(580,100,110,300);
    pg.beginDraw();
    //background(0);
    pg.ellipse(840, 330, 60, 60);//Maid Head
    pg.line(840, 360, 885, 480);//Left Arm
    pg.line(840, 360, 785, 480);//Right Arm
    pg.line(820, 480, 820, 600);//Left Leg
    pg.line(850, 480, 850, 600);//Right Leg
    pg.fill(255, 255, 255);
    pg.triangle(840, 360, 805, 480, 875, 480);//Maid Body
    pg.fill(255, 255, 255);
    pg.ellipse(825, 320, 10, 10); //Eye 1
    pg.ellipse(855, 320, 10, 10); //Eye 2
    pg.ellipse(840, 330, 1, 1);
    pg.endDraw();
    image(pg, -200, -200);
  }
}