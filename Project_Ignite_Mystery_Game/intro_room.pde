//this amazing room programmed by ____


class intro_room extends Room {
  PImage img_room; 
  PImage img;  
  PImage img1;
  PImage img2;
  PImage img3;
  int t = 0;

  void setup() {
    img_room = loadImage("Dining_Room2a.jpg");   
    img = loadImage("Death1.gif");
    img1 = loadImage("Death2.gif");
    img2 = loadImage("Death3.gif");
    img3 = loadImage("Death4.gif");
    frameRate(10);
  }
  
  void mousePressed(){
    goToRoom(instruction_room);
  }

  void draw() {

    background(255);

    image(img_room, 0, 0, width, height);

    if (t == 0) {
      image(img, 340, 5);
    }

    if (t == 1) {
      image(img1, 340, 5);
    }
    if (t == 2) {
      image(img2, 340, 5);
    }
    if (t == 3) {
      image(img3, 340, 5);
    }
    if (t==3)
    {
      t=0;
    }
    if (t < 3)
    {
      t++;
    }
    text ("Click anywhere", 400, 700, 400, 90);
  }
}