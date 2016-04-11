public class study_room extends Room {
  PImage bookshelf2;
  GUI_Dialogue_Box textbox;
  GUI_Dialogue_Box toLivingRoom;
  int[] toLivingRoomBounds=new int[]{50, 0, 350, 50};
  int[] toBedRoomBounds=new int[]{350, 0, 650, 50};
  int[] toKitchenRoomBounds=new int[]{650, 0, 950, 50};
  GUI_Dialogue_Box toBedRoom;
  GUI_Dialogue_Box toKitchenRoom;
  void setup()
  {
    background(32, 175, 145);
    stroke(100);
    bookshelf2 = loadImage("bookshelf2.jpeg");
    textbox = new GUI_Dialogue_Box (0, 600, 1200, 200);
    textbox.setText("Welcome to the Study. I was his Financial Advisor. \n I handled his immense fortune and made any changes to his will. \n He and I were good friends and I cannot imagine anyone who would do this.");
    toLivingRoom=new GUI_Dialogue_Box(50, 0, 300, 50);
    toLivingRoom.setText("Go to living room");
    toBedRoom=new GUI_Dialogue_Box(350, 0, 300, 50);
    toBedRoom.setText("Go to bed room");
    toKitchenRoom=new GUI_Dialogue_Box (650, 0, 300, 50);
    toKitchenRoom.setText("Go to kitchen");
  }

  void draw ()
  {
    background(32, 175, 145);
    drawroom();
    drawtable(); 
    drawclock();
    drawdoor();
    toLivingRoom.draw();
    toBedRoom.draw();
    toKitchenRoom.draw();

    //BOOKSHELF BORDER
    if (mouseX > 325 && mouseX < 475)
    {
      if (mouseY > 175 && mouseY < 475)
      {
        strokeWeight(5);
        stroke(108, 162, 232);
        noFill();
        rect(325, 175, 150, 300);
        stroke(100);
        strokeWeight(1);
      }
    }

    //CLOCK BORDER
    if (mouseX > 215 && mouseX < 335)//clock
    {
      if (mouseY > 140 && mouseY < 260)
      {
        strokeWeight(5);
        stroke(108, 162, 232);
        noFill();
        ellipse(275, 200, 60, 60);
        stroke(100);
        strokeWeight(1);
      }
    }

    //TABLE BORDER
    if (mouseX > 50 && mouseX < 225)
    {
      if (mouseY > 350 && mouseY < 425 || mouseY > 425 && mouseY < 550)
      {
        strokeWeight(5);
        stroke(108, 162, 232);
        noFill();
        quad(125, 350, 225, 350, 175, 425, 50, 425);
        quad(50, 425, 175, 425, 175, 550, 50, 550); //square facing viewer
        quad(225, 350, 225, 475, 175, 550, 175, 425);
        stroke(100);
        strokeWeight(1);
      }
    }

    textbox.draw();

    drawAdvisor();
  }

  private void drawAdvisor() {
    PGraphics pg=createGraphics(width, height);

    pg.beginDraw();
    pg.fill(237, 183, 124);
    pg.ellipse(600, 200, 60, 60);
    pg.line(600, 230, 600, 360);
    pg.line(600, 260, 620, 310);
    pg.line(600, 260, 580, 310);
    pg.line(600, 360, 620, 400);
    pg.line(600, 360, 580, 400);

    pg.ellipse(590, 200, 20, 20);
    pg.ellipse(610, 200, 20, 20);
    pg.line(580, 200, 570, 190);
    pg.line(620, 200, 630, 190);

    pg.line(600, 220, 620, 215);
    pg.endDraw();
    
    image(pg, 0, 200, width, height);
  }

  void drawroom ()
  {

    line(125, 475, 0, 600); // bottom left line
    line(1075, 475, 1200, 600); //bottom right line
    line(100, 100, 0, 0); //top left line
    line(1100, 100, 1200, 0); //top right line

    fill(12, 144, 117); 
    quad(125, 125, 1075, 125, 1075, 475, 125, 475);
    quad(125, 125, 0, 0, 1200, 0, 1075, 125);
    fill(55, 203, 173);

    image(bookshelf2, 325, 175, 150, 300);
    image(bookshelf2, 475, 175, 150, 300);
    image(bookshelf2, 625, 175, 150, 300);
  }

  void drawtable()
  {
    fill(98, 31, 9);
    quad(125, 350, 225, 350, 175, 425, 50, 425); //tabletop
    fill(59, 23, 11);
    quad(50, 425, 175, 425, 175, 550, 50, 550); //square facing viewer
    quad(225, 350, 225, 475, 175, 550, 175, 425); //rect facing books
  }

  void drawclock()
  {
    fill(229, 222, 222);
    ellipse(275, 200, 60, 60);
    line(275, 200, 255, 210); //short line
    line(275, 200, 295, 220); //long line
  }

  void drawdoor()
  {
    fill(98, 31, 9);
    //quad(500, 200, 550, 160, 550, 550, 500, 500);
    quad(1100, 200, 1150, 160, 1150, 550, 1100, 500);
    fill(219, 154, 55);
    //ellipse(510, 340, 10, 5);
    ellipse(1110, 340, 10, 5);
  }

  void mousePressed()
  {
    if (mouseX > 325 && mouseX < 475)//bookshelf
    {
      if (mouseY > 175 && mouseY < 475)
      {
        textbox.setText("You have found the victim's will. \n It has recently been updated to leaving his entire fortune to the spouse, \n rather than the advisor.");
      }
    }
    if (mouseX > 215 && mouseX < 335)//clock
    {
      if (mouseY > 140 && mouseY < 260)
      {
        textbox.setText("You have noticed the clock is cracked and has stopped at a specific time. \n The pieces of glass on the floor indicate that it was cracked recently \n and hastily put back up. \n The time is stopped at around the time when the murder occurred. ");
      }
    }
    if (mouseX > 50 && mouseX < 225)
    {
      if (mouseY > 350 && mouseY < 425 || mouseY > 425 && mouseY < 550)
      {
        textbox.setText("On the desk you see scratch marks and some faint drops of blood. \n It seems there has been a fight in this room.");
      }
    }

    if (checkObjectClicked(toLivingRoomBounds)) {
      goToRoom(living_room);
    } else if (checkObjectClicked(toBedRoomBounds)) {
      goToRoom(bed_room);
    } else if (checkObjectClicked(toKitchenRoomBounds)) {
      goToRoom(kitchen_room);
    }
  }
}  

private boolean checkObjectClicked(int[]bounds) {
  int minX=bounds[0];
  int minY=bounds[1];
  int maxX=bounds[2];
  int maxY=bounds[3];

  return mouseX>minX&&mouseX<maxX&&mouseY>minY&&mouseY<maxY;
}