public class study_room extends Room {
  PImage bookshelf2;
  GUI_Dialogue_Box textbox;
  void setup()
  {
    background(32, 175, 145);
    stroke(100);
    bookshelf2 = loadImage("bookshelf2.jpeg");
    textbox = new GUI_Dialogue_Box (0, 500, 600, 100);
    textbox.setText("Welcome to the Study. I was his Financial Advisor. \n I handled his immense fortune and made any changes to his will. \n He and I were good friends and I cannot imagine anyone who would do this.");
  }

  void draw ()
  {
    background(32, 175, 145);
    drawroom();
    drawtable(); 
    drawclock();
    drawdoor();

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
  }

  void drawroom ()
  {

    line(125, 475, 0, 600); // bottom left line
    line(475, 475, 600, 600); //bottom right line
    line(100, 100, 0, 0); //top left line
    line(500, 100, 600, 0); //top right line

    fill(12, 144, 117); 
    quad(125, 125, 475, 125, 475, 475, 125, 475);
    quad(125, 125, 0, 0, 600, 0, 475, 125);
    fill(55, 203, 173);

    image(bookshelf2, 325, 175, 150, 300);
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
    quad(500, 200, 550, 160, 550, 550, 500, 500);
    fill(219, 154, 55);
    ellipse(510, 340, 10, 5);
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
  }
}