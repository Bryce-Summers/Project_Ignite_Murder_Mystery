class bed_room extends Room {
  PImage img;
  PImage img2;
  PImage img3;
  PImage img4;
  PImage img5;
  PImage img6;
  PImage img7;
  PImage img8;
  PImage img9;
  PImage img10;
  itemhover boots;
  itemhover clothes;
  itemhover suitcase;
  itemhover pictureframe;
  itemhover books;
  personclue sigother;
  itemhoverclue envelope;
  itemhover_arrow arrow1;
  itemhover_arrow arrow2;
  void setup() {
    background(0);
    img = loadImage ("IMG_2901.png");
    img2 = loadImage ("boots.png");
    img3 = loadImage ("clothes.png");
    img4 = loadImage ("suitcase.png");
    img5 = loadImage ("books.png");
    img6 = loadImage ("pictureframe.png");
    img7 = loadImage ("envelope.png");
    img8 = loadImage ("arrow1.png");
    img9 = loadImage ("arrow2.png");
    img10 = loadImage ("sigother.png");
    boots = new itemhover (img2, 71, 640, img2.width/9, img2.height/9);
    clothes = new itemhover (img3, 290, 695, img3.width/4, img3.height/4);
    suitcase = new itemhover (img4, 570, 720, img4.width/6, img4.height/6);
    pictureframe = new itemhover (img6, 507, 446, img6.width/17, img6.height/17);
    books = new itemhover (img5, 450, 670, img5.width/8, img5.height/8);
    envelope = new itemhoverclue (img7, 1000, 680, img7.width/25, img7.height/25); 
    arrow1 = new itemhover_arrow (img8, 1100, 720, img8.width/2, img8.height/2);
    arrow2 = new itemhover_arrow (img9, 50, 720, img9.width/2, img9.height/2);
    sigother = new personclue (img10, 105, 410, (int) (img10.width/2.5), (int)(img10.height/2.5));
  }
  void draw () {

    image(img, 0, 0, 1200, 800);

    stroke(0);
    strokeWeight (4);
    fill (0, 80);
    rect (0, 0, 170, 70);

    //image (img5, 310, 480, img5.width/10, img5.height/10);
    //image (img2, 80, 450, img2.width/11, img2.height/11);
    //image (img3, 190, 500, img3.width/5, img3.height/5);
    //image (img4, 390, 530, img4.width/8, img4.height/8);
    //image (img6, 390, 325, img6.width/19, img6.height/19);
    //image (img7, 750, 500, img7.width/25, img7. height/25);
    //image (img10, 40, 260, img10.width/3, img10.height/3);
    //image (img8, 790, 520, img8.width/3, img8.height/3);
    //image (img9, 50, 520, img9.width/3, img9.height/3);

    boots.itemchange();
    clothes.itemchange();
    suitcase.itemchange();
    pictureframe.itemchange();
    books.itemchange();
    //image (img10, 40, 260, img10.width/3, img10.height/3);




    arrow1.itemhover();
    arrow2.itemhover();

    sigother.personclue1();
    envelope.itemchangeclue();
  }
  class DialogueBox
  {
    int x;
    int y;
    int xlength;
    int ylength;
    String text;
    color backgroundColor;
    //constructor
    DialogueBox(int x_in, int y_in, int xlength_in, int ylength_in)
    {
      x = x_in;
      y = y_in;
      xlength = xlength_in;
      ylength = ylength_in;
      backgroundColor = 255;
      text = "You found a clue! Click on the clue in your inventory to investigate.";
    }

    void draw()
    {
      fill(0, 200); //dialogue box color
      rect(x, y, xlength, ylength); 
      fill(#55FFE1);
      textAlign(CENTER, CENTER);
      textSize(25);
      text(text, x + xlength/2, y + ylength/2);
    }

    void setText(String text_in)
    {
      text = text_in;
    }
  }
  class itemhoverclue {
    //constructor
    PImage letterclue1;
    PImage img;  
    int rectX;
    int rectY;
    int itemWidth;
    int itemHeight;
    boolean clicked;
    boolean clicked2;
    int y1 = rectY + itemHeight;
    int x1 = rectX + itemWidth;
    int timesinceclick = 0;
    DialogueBox letterclue;

    itemhoverclue (PImage imgX_in, int rectX_in, int rectY_in, int itemWidth_in, int itemHeight_in)
    {
      img = imgX_in;
      rectX = rectX_in;
      rectY = rectY_in;
      itemWidth = itemWidth_in;
      itemHeight = itemHeight_in;
      y1 = rectY + itemHeight;
      x1 = rectX + itemWidth;
      letterclue = new DialogueBox (0, 600, 1200, 200);
      letterclue1 = loadImage ("letterclue.png");

      clicked = false;
      clicked2 = false;
    }
    void itemchangeclue () {
      //timesinceclick = timesinceclick + 1;
      if (clicked) {
        timesinceclick = timesinceclick + 1;
        //fill (0);
        //ellipse (400, 400, 100, 100);
        rectX = rectX - 45;
        rectY = rectY - 30;
        if (timesinceclick<60) {
          letterclue.draw();
        }
      }
      if (rectX<20 && rectY<20) {
        rectX = 20;
        rectY = 20;
      } 
      image(img, rectX, rectY, itemWidth, itemHeight);

      if (mouseX>rectX && mouseX<rectX + itemWidth && mouseY>rectY && mouseY<rectY + itemHeight) {
        image(img, rectX - 10, rectY - 10, itemWidth + 20, itemHeight + 20);
        if (mousePressed == true) {

          clicked = true;
          //CLUE TRIGGER
          //player.setLetter(true);
        }
        if (mouseY>rectY + itemHeight) {

          image (img, rectX, rectY, itemWidth, itemHeight);
        }
        if (rectX == 20 && rectY ==20) {

          if (mouseX>rectX && mouseX<rectX + itemWidth && mouseY>rectY && mouseY<rectY + itemHeight) {
            if (mousePressed == true) {
              fill (0, 100);

              rect (0, 0, 1200, 800);
              image (letterclue1, 350, 90, letterclue1.width*1.5, letterclue1.height*1.5);
            }
          }
        }
      }
    }
  }
  class itemhover {
    //constructor
    PImage img;  
    int rectX;
    int rectY;
    int itemWidth;
    int itemHeight;
    boolean clicked;
    int y1 = rectY + itemHeight;
    int x1 = rectX + itemWidth;

    itemhover (PImage imgX_in, int rectX_in, int rectY_in, int itemWidth_in, int itemHeight_in)
    {
      img = imgX_in;
      rectX = rectX_in;
      rectY = rectY_in;
      itemWidth = itemWidth_in;
      itemHeight = itemHeight_in;
      y1 = rectY + itemHeight;
      x1 = rectX + itemWidth;

      //clicked = false;
    }
    void itemchange () {
      //noStroke ();
      //fill(255,0);
      image(img, rectX, rectY, itemWidth, itemHeight);

      if (mouseX>rectX && mouseX<rectX + itemWidth && mouseY>rectY && mouseY<rectY + itemHeight) {
        image(img, rectX - 10, rectY - 10, itemWidth + 20, itemHeight + 20);

        if (mouseY>rectY + itemHeight) {

          image (img, rectX, rectY, itemWidth, itemHeight);
        }
      }
    }
  }
  class personclue {
    //constructor
    PImage img;  
    int rectX;
    int rectY;
    int itemWidth;
    int itemHeight;
    boolean clicked;
    boolean clicked2;
    int y1 = rectY + itemHeight;
    int x1 = rectX + itemWidth;
    int timesinceclick = 0;
    DialogueBox2 dialogueclue;

    personclue (PImage imgX_in, int rectX_in, int rectY_in, int itemWidth_in, int itemHeight_in)
    {
      img = imgX_in;
      rectX = rectX_in;
      rectY = rectY_in;
      itemWidth = itemWidth_in;
      itemHeight = itemHeight_in;
      y1 = rectY + itemHeight;
      x1 = rectX + itemWidth;
      dialogueclue = new DialogueBox2 (0, 600, 1200, 200);

      clicked = false;
      clicked2 = false;
    }
    void personclue1 () {
      //timesinceclick = timesinceclick + 1;


      if (rectX == 20 && rectY ==20) {

        if (mouseX>rectX && mouseX<rectX + itemWidth && mouseY>rectY && mouseY<rectY + itemHeight) {
          if (mousePressed == true) {
            fill (0);
            ellipse (100, 100, 100, 100);
          }
        }
      }
      image(img, rectX, rectY, itemWidth, itemHeight);

      if (mouseX>rectX && mouseX<rectX + itemWidth && mouseY>rectY && mouseY<rectY + itemHeight) {
        image(img, rectX - 10, rectY - 10, itemWidth + 20, itemHeight + 20);
        if (mousePressed == true) {

          clicked = true;
          //CLUE TRIGGER
          //player.setSigother(true);
        }
        if (mouseY>rectY + itemHeight) {

          //image (img, rectX, rectY, itemWidth, itemHeight);
        }
      }
      if (clicked) {
        timesinceclick = timesinceclick + 1;
        //fill (0);
        //ellipse (400, 400, 100, 100);

        if (timesinceclick<40) {
          dialogueclue.draw2();
        }
      }
    }
  }
  class DialogueBox2
  {
    int x;
    int y;
    int xlength;
    int ylength;
    String text;
    color backgroundColor;
    //constructor
    DialogueBox2(int x_in, int y_in, int xlength_in, int ylength_in)
    {
      x = x_in;
      y = y_in;
      xlength = xlength_in;
      ylength = ylength_in;
      backgroundColor = 255;
      text = "*weeps* Oh, my beloved husband! How could he be gone? *weeps*";
    }

    void draw2()
    {
      fill(0, 200); //dialogue box color
      rect(x, y, xlength, ylength); 
      fill(#55FFE1);
      textAlign(CENTER, CENTER);
      textSize(25);
      text(text, x + xlength/2, y + ylength/2);
    }

    void setText(String text_in)
    {
      text = text_in;
    }
  }
  class itemhover_arrow {
    //constructor
    PImage img;  
    int rectX;
    int rectY;
    int itemWidth;
    int itemHeight;
    boolean clicked;
    int y1 = rectY + itemHeight;
    int x1 = rectX + itemWidth;

    itemhover_arrow (PImage imgX_in, int rectX_in, int rectY_in, int itemWidth_in, int itemHeight_in)
    {
      img = imgX_in;
      rectX = rectX_in;
      rectY = rectY_in;
      itemWidth = itemWidth_in;
      itemHeight = itemHeight_in;
      y1 = rectY + itemHeight;
      x1 = rectX + itemWidth;

      clicked = false;
    }
    void itemhover () {
      //noStroke ();
      //fill(255,0);
      image(img, rectX, rectY, itemWidth, itemHeight);

      if (mouseX>rectX && mouseX<rectX + itemWidth && mouseY>rectY && mouseY<rectY + itemHeight) {
        image(img, rectX - 10, rectY - 10, itemWidth + 20, itemHeight + 20);
        if (img == img8) {
          if (mousePressed == true) {
            goToRoom(study_room);
          }
        }
        if (img == img9) {
          if (mousePressed == true) {
            goToRoom(entrance_room);
          }
          if (mouseY>rectY + itemHeight) {

            image (img, rectX, rectY, itemWidth, itemHeight);
          }
        }
      }
    }
  }
}