//this amazing room programmed by ____


class living_room extends Room {
  int xcord;
  int x;
  int y;
  GUI_Dialogue_Box Maid;
  GUI_Dialogue_Box Yellow;
  GUI_Dialogue_Box Green;
  GUI_Dialogue_Box Blue;
  String Dialogue = "Oh! Hello!..";
  String[] MaidDialogue = {"Oh! Hello!...", "You're the \n guest, right?", "What do you want?", "The Murder?", "I can tell you this", " I had nothing to \n do with it", "What's even \n my motive?", "Hmm...", "How about I prove \n my innocence?", "What If I help you?", "I found this.", "It's a bloodied shirt", "I don't know \n who it belongs to.", "But it could \n probably help you", "How do you know it's \n it's not mine?", "Easy.", "I have a better \n sense of fashion", "Rather then that \n senseless killer", "It's right there \n on the couch", "What else could \n help you?", "Oh!", "An hour \n prior to dinner", "I heard my \n boss arguing", "I don't know\nwith whom", "Due to the fact I \n was listening,", "through a \n thick wall", "They were talking \n about money issues.", "That's all I can \n do to help", "Now excuse \n me while I", "procrastinate about \n cleaning this couch"};
  int MaidDialogueIndex= 0;
  boolean pressbluebutton = true;
  boolean pressyellowbutton = true;
  boolean pressgreenbutton = true;
  int blueColor;
  int yellowColor;
  int greenColor;

  void setup() {
    size(1200, 800);
    background(0, 0, 0);
    stroke(50);
    frameRate(150);
    Maid = new GUI_Dialogue_Box(550, 150, 270, 90);
    blueColor = color(3, 25, 255);
    yellowColor = color(237, 255, 0);
    greenColor = color(22, 255, 30);

    Yellow = new GUI_Dialogue_Box(55, 638 + 17, 200, 30);//CHANGE
    Blue = new GUI_Dialogue_Box(610, 638 + 17, 200, 30);//CHANGE
    Green = new GUI_Dialogue_Box(895, 638 + 17, 200, 30);///CHANGE
    Yellow.setText("Go To Entrance Hall?");
    Blue.setText("Go to Study?");
    Green.setText("Go to Dining Room?");
    Yellow.setTextSize(20);
    Green.setTextSize(20);
    Blue.setTextSize(20);
    ;
  }

  void draw() {
    background(94, 198, 105);
    fill(216, 0, 0);
    rect(0, 600, 1200, 600);//Carpet
    Maid.draw();
    Maid.setText(Dialogue);
    if (pressyellowbutton)
      Yellow.draw() ;
    if (pressbluebutton)
      Blue.draw();
    if (pressgreenbutton)
      Green.draw();
    fill(234, 66, 19);
    rect(0, 0, 250, 600);
    noFill();
    fill(255, 55, 0);
    rect(5, 450, 240, 150);//Chimney
    noFill();
    line(0, 10, 250, 10);
    line(0, 40, 250, 40);
    line(0, 70, 250, 70);
    line(0, 100, 250, 100);
    line(0, 130, 250, 130);
    line(0, 160, 250, 160);
    line(0, 190, 250, 190);
    line(0, 220, 250, 220);
    line(0, 250, 250, 250);
    line(0, 280, 250, 280);
    line(0, 310, 250, 310);
    line(0, 340, 250, 340);
    line(0, 370, 250, 370);
    line(0, 400, 250, 400);
    line(0, 430, 250, 430);//Bricks
    fill(75, 30, 12);
    rect(40, 540, 100, 30);
    rect(80, 570, 100, 30);
    rect(25, 570, 100, 30);
    noFill();
    fill(242, 39, 17);
    triangle(40, 540, 75, 540, 55, 470);
    triangle(55, 540, 90, 540, 75, 470);
    triangle(70, 540, 105, 540, 85, 470);
    triangle(90, 540, 120, 540, 105, 470);
    triangle(105, 540, 140, 540, 125, 470);
    noFill();
    fill(242, 102, 7);
    triangle(40, 540, 70, 540, 55, 490);
    triangle(60, 540, 90, 540, 75, 490);
    triangle(70, 540, 100, 540, 85, 490);
    triangle(90, 540, 120, 540, 105, 490);
    triangle(110, 540, 140, 540, 125, 490);
    noFill();
    fill(244, 245, 17);
    triangle(40, 540, 70, 540, 55, 510);
    triangle(60, 540, 90, 540, 75, 510);
    triangle(70, 540, 100, 540, 85, 510);
    triangle(90, 540, 120, 540, 105, 510);
    triangle(110, 540, 140, 540, 125, 510);
    noFill();//Fireplace
    fill(22, 108, 25);
    rect(300, 350, 500, 220);
    noFill();
    fill(100, 44, 21);
    rect(300, 570, 30, 30);
    rect(770, 570, 30, 30);
    line(365, 500, 740, 500);//Sofa
    noFill();
    line(365, 430, 365, 570);
    fill(48, 206, 52);
    line(300, 430, 365, 430);//ArmRest 1
    line(740, 430, 740, 570);
    line(740, 430, 800, 430);//ArmRest 2
    fill(255, 255, 255);
    rect(400, 410, 80, 50);
    rect(400, 450, 80, 50);//Shirt
    rect(400, 430, 90, 50);
    fill(216, 0, 0);
    ellipse(420, 450, 7, 7);
    ellipse(430, 445, 7, 7);
    ellipse(450, 460, 7, 7);
    noFill();
    fill(0, 0, 0);
    rect(900, 150, 190, 190);
    line(900, 250, 1090, 250);
    line(1000, 150, 1000, 340);//Window
    fill(93, 37, 9);
    ellipse(840, 320, 60, 60);
    fill(255, 255, 255);
    ellipse(840, 330, 60, 60);//Maid Head
    line(840, 360, 885, 480);//Left Arm
    line(840, 360, 785, 480);//Right Arm
    line(820, 480, 820, 600);//Left Leg
    line(850, 480, 850, 600);//Right Leg
    fill(0, 0, 0);
    triangle(840, 360, 805, 480, 875, 480);//Maid Body
    fill(0, 0, 0);
    ellipse(825, 320, 10, 10); //Eye 1
    ellipse(855, 320, 10, 10); //Eye 2
    ellipse(840, 330, 1, 1);//Nose
    line(824, 315, 820, 310);
    line(825, 315, 825, 310);
    line(855, 315, 851, 310);
    line(855, 315, 855, 310);//Lashes
    line(835, 343, 842, 343);//Mouth
    fill(137, 54, 12);
    rect(865, 470, 30, 10);//Duster Handle
    fill(124, 107, 97);
    rect(850, 470, 30, 2);
    rect(850, 474, 30, 2);
    rect(850, 478, 30, 2);//Dusters
    fill(235, 252, 0);
    /* ellipse(950,200,5,5); //CHANGE
     ellipse(985,195,5,5);//CHANGE
     ellipse(1050,214,5,5);//CHANGE
     ellipse(1080,182,5,5);//CHANGE
     ellipse(1032,160,5,5);//CHANGE
     ellipse(948,227,5,5);//Stars//CHANGE
     */    //CHANGE
    randomSeed(frameCount / 25);//CHANGE

    for (int i = 0; i < 6; i ++)//CHANGE
    {

      float windowLeft = 900;//CHANGE
      float windowTop = 150;//CHANGE
      float windowRight = 1090;//CHANGE
      float windowBottom = 240;//CHANGE
      float windowWidth = windowRight - windowLeft;//CHANGE
      float windowHeight = windowBottom - windowTop;//CHANGE
      float starRadius = 5;//CHANGE
      float x = windowLeft + starRadius + random(windowWidth - starRadius * 2);//CHANGE
      float y = windowTop + starRadius + random(windowHeight -starRadius * 2);//CHANGE
      ellipse(x, y, starRadius, starRadius); //CHANGE
    }
    { 
      fill(237, 255, 0);
      ellipse(20, 670, 35, 35);//Exit to Entrance Hall
      noFill();
      fill(3, 25, 255);
      ellipse(570, 670, 35, 35);//Exit to Study
      noFill();
      fill(22, 255, 30);
      ellipse(1150, 670, 35, 35);
    }//Exit to Dining Room
  }

  void mousePressed() {
    if (mouseX >= 550 && mouseX <= 820) {
      if (mouseY >= 150 && mouseY <= 240) { 
        if (MaidDialogueIndex < MaidDialogue.length - 1) 
          MaidDialogueIndex +=1;
        Dialogue = MaidDialogue[MaidDialogueIndex];
      }
    }
    {
      if ( get(mouseX, mouseY) == blueColor) {
        pressbluebutton = ! pressbluebutton;
        if( pressbluebutton == false )
        goToRoom(study_room);//ROOM CHANGE
      }

      if ( get(mouseX, mouseY) == yellowColor) {
        pressyellowbutton = ! pressyellowbutton;
        if( pressyellowbutton == false )
        goToRoom(entrance_room);//ROOM CHANGE
      }



      if ( get(mouseX, mouseY) == greenColor) {
        pressgreenbutton = ! pressgreenbutton;
        if( pressgreenbutton == false )
        goToRoom(dining_room);//ROOM CHANGE
      }
    }
  }
}