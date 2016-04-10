class entrance_room extends Room {
  PImage background;
  PImage butler;
  PImage otherstuff;
  PImage papers;
  PImage thekey;
  PImage closekey;
  PImage arrow11;
  PImage arrow22;
  personclue butler2;
  itemhover keys;
  itemhover otherstuffs;
  itemhoverclue paper;
  itemhover_arrow arrow1;
  itemhover_arrow arrow2;
  //itemhover otherstuff2;
  //itemhover papers2;
  //itemhover thekey2;
  void setup() {
    background (0);
    background = loadImage ("backgorund.png");
    butler = loadImage ("butler.png");
    otherstuff = loadImage ("otherstuff.png");
    papers = loadImage ("papers.png");
    thekey = loadImage ("key.png");
    closekey = loadImage ("keycloseup.png");
    arrow11 = loadImage ("arrow11.png");
    arrow22 =loadImage ("arrow22.png");
    butler2 = new personclue (butler, 750, 200, butler.width/2, butler.height/2);
    keys = new itemhover (papers, 70, 570, papers.width/5, papers.height/5);  
    otherstuffs = new itemhover (otherstuff, 9, 570, otherstuff.width/4, otherstuff.height/4);
    paper =new itemhoverclue (thekey, 117, 550, thekey.width/4, thekey.height/4);
    arrow1 = new itemhover_arrow (arrow11, 1100, 720, arrow11.width/2, arrow11.height/2);
    arrow2 = new itemhover_arrow (arrow22, 50, 720, arrow22.width/2, arrow22.height/2);
  }
  void draw () {
    image (background, 0, 0, 1200, 800);
    image (butler, 750, 200, butler.width/2, butler.height/2);
    image (papers, 70, 570, papers.width/5, papers.height/5);  
    image (otherstuff, 9, 570, otherstuff.width/4, otherstuff.height/4);
    //image (thekey, 117, 550, thekey.width/4, thekey.height/4);
    //image (closekey, 200, 20, closekey.width, closekey.height);
    stroke(0);
    strokeWeight (4);
    fill (0, 80);
    rect (0, 0, 170, 70);


    otherstuffs.itemchange();
    paper.itemchangeclue();
    butler2.personclue1();
    arrow2.itemhover();

    arrow1.itemhover();
    keys.itemchange();
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
      text = "Tragic incident. I feel most sorrow for his wife - but she is quite resilient.";
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
  class DialogueBox3
  {
    int x;
    int y;
    int xlength;
    int ylength;
    String text;
    color backgroundColor;
    //constructor
    DialogueBox3(int x_in, int y_in, int xlength_in, int ylength_in)
    {
      x = x_in;
      y = y_in;
      xlength = xlength_in;
      ylength = ylength_in;
      backgroundColor = 255;
      text = "I can't remember ever seeing that woman cry.";
    }
    void draw3()
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
    PImage img;  
    PImage keyclose;
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
      keyclose = loadImage ("keycloseup.png");

      clicked = false;
      clicked2 = false;
    }
    void itemchangeclue () {
      //timesinceclick = timesinceclick + 1;
      if (clicked) {
        timesinceclick = timesinceclick + 1;
        //fill (0);
        //ellipse (400, 400, 100, 100);
        rectX = rectX - 10;
        rectY = rectY - 50;
        if (timesinceclick<50) {
          letterclue.draw();
        }
      }
      if (rectX<25 && rectY<20) {
        rectX = 25;
        rectY = 20;
      } 
      image(img, rectX, rectY, itemWidth, itemHeight);

      if (mouseX>rectX && mouseX<rectX + itemWidth && mouseY>rectY && mouseY<rectY + itemHeight) {
        image(img, rectX - 10, rectY - 10, itemWidth + 20, itemHeight + 20);
        if (mousePressed == true) {

          clicked = true;
          //CLUE TRIGGER
          //player.setKey(true);
        }
        if (mouseY>rectY + itemHeight) {

          image (img, rectX, rectY, itemWidth, itemHeight);
        }
        if (rectX == 25 && rectY ==20) {

          if (mouseX>rectX && mouseX<rectX + itemWidth && mouseY>rectY && mouseY<rectY + itemHeight) {
            if (mousePressed == true) {

              fill (0, 100);

              rect (0, 0, 1200, 800);
              image (closekey, 320, 70, closekey.width*2.3, closekey.height*2.3);
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
    PImage background2;
    PImage butler;
    PImage otherstuff;
    PImage papers;
    PImage thekey;
    DialogueBox2 butlertalk;

    itemhover (PImage imgX_in, int rectX_in, int rectY_in, int itemWidth_in, int itemHeight_in)
    {
      img = imgX_in;
      rectX = rectX_in;
      rectY = rectY_in;
      itemWidth = itemWidth_in;
      itemHeight = itemHeight_in;
      y1 = rectY + itemHeight;
      x1 = rectX + itemWidth;
      butlertalk = new DialogueBox2 (0, 450, 900, 150);
      background2 = loadImage ("background.png");
      butler = loadImage ("butler.png");
      otherstuff = loadImage ("otherstuff.png");
      papers = loadImage ("papers.png");
      thekey = loadImage ("key.png");
      //clicked = false;
    }
    void itemchange () {
      //noStroke ();
      //fill(255,0);
      image(img, rectX, rectY, itemWidth, itemHeight);

      if (mouseX>rectX && mouseX<rectX + itemWidth && mouseY>rectY && mouseY<rectY + itemHeight) {
        //image (background,0,0, 900,600);

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
    DialogueBox3 dialogueclue2;

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
      dialogueclue2 = new DialogueBox3 (0, 600, 1200, 200);
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
          //player.setButler(true);
        }
        if (mouseY>rectY + itemHeight) {

          image (img, rectX, rectY, itemWidth, itemHeight);
        }
      }
      if (clicked) {
        timesinceclick = timesinceclick + 1;
        //fill (0);
        //ellipse (400, 400, 100, 100);

        if (timesinceclick<50) {
          dialogueclue.draw2();
        } 
        if (timesinceclick>50&&timesinceclick<80) {
          dialogueclue2.draw3();
        }
      }
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
        if (img == arrow11) {
          if (mousePressed == true) {
            goToRoom(bed_room);
          }
          if (img == arrow22) {
            if (mousePressed == true) {
              goToRoom(living_room);
            }
            if (mouseY>rectY + itemHeight) {

              image (img, rectX, rectY, itemWidth, itemHeight);
            }
          }
        }
      }
    }
  }
}