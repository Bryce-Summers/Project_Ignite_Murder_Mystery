//this amazing room programmed by ____


class kitchen_room extends Room {
  int xcord;
  int x;
  int y;
  GUI_Dialogue_Box Chef;
  GUI_Dialogue_Box Red;
  GUI_Dialogue_Box Green;
  GUI_Dialogue_Box Blue;
  String Dialogue = "WHO'S THERE?!";
  String []ChefDialogue = {"WHO'S THERE?!", "Oh it's just you", "What do you want?", "I'm Busy", "Ze Murder?", "You think I \n killed Him?", "HA!", "What would give \n you that idea?", "My anger issues?", "I DO NOT HAVE \n ANGER ISSUES", "...", "Look. All I know is \n He was greedy", "How much I get \n payed?", "Penny a day", "Trust me.", "If it was up to me.", "I would have \n killed him", "...", "That makes me sound \n really guilty", "But I didn't do it.", "What?", "The blood on \n my shirt?", "That's just meat from \n Meal I made", "You think it's his?", "Look take a sample", "I don't care", "Leave me alone"};
  int ChefDialogueIndex= 0;
  boolean pressbluebutton = true;
  boolean pressredbutton = true;
  boolean pressgreenbutton = true;
  int blueColor;
  int redColor;
  int greenColor;

  void setup() {
    size(1200, 800);
    background(0, 0, 0);
    stroke(50);
    frameRate(150);
    Chef = new GUI_Dialogue_Box(550, 150, 270, 90);
    blueColor = color(3, 25, 255);
    redColor = color(255, 3, 7);
    greenColor = color(22, 255, 30);

    Red = new GUI_Dialogue_Box(95, 638, 200, 30);
    Blue = new GUI_Dialogue_Box(560, 638, 200, 30);
    Green = new GUI_Dialogue_Box(895, 638, 200, 30);
    Red.setText("Go To Shed?");
    Blue.setText("Go to Study?");
    Green.setText("Go to Dining Room?");
    Red.setTextSize(20);
    Green.setTextSize(20);
    Blue.setTextSize(20);
  }

  void draw() {
    background(255, 255, 255);
    Chef.draw();
    Chef.setText(Dialogue);
    if (pressredbutton)
      Red.draw() ;
    if (pressbluebutton)
      Blue.draw();
    if (pressgreenbutton)
      Green.draw();
    noFill();
    quad(9, 150, 310, 118, 310, 550, 9, 630); //Whole Fridge
    quad(9, 150, 310, 118, 310, 230, 9, 278); //Freezer
    quad(-10, 86, 270, 54, 310, 118, 9, 150); // Fridge Top
    quad(-10, 86, 9, 150, 9, 278, -10, 214); //Freezer Side
    quad(-10, 590, 9, 630, 9, 278, -10, 214); //Fridge Side
    fill(0, 0, 0);
    rect(290, 190, 10, 30); //Freezer Handle
    rect(290, 250, 10, 30);//Fridge Handle
    noFill();


    //sink
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
    noFill();
    line(310, 480, 520, 430);//Floor
    fill(255, 0, 0);
    ellipse(890, 250, 5, 5);
    ellipse(885, 260, 6, 4);
    ellipse(885, 250, 7, 5);//Blood

    fill(222, 185, 83);
    rect(500, 400, 800, 200);//Counter Front
    quad(600, 300, 1200, 300, 1200, 400, 500, 400);//Counter Top
    noFill();

    noFill();
    line(880, 210, 880, 300);
    line(918, 210, 918, 300);//Chef Arms
    line(870, 160, 915, 160);//Chef Mouth
    //Chef Hat
    fill(139, 83, 30);
    quad(800, 320, 900, 320, 900, 380, 800, 380);//Cutting Board
    noFill();
    fill(247, 109, 22);
    triangle(810, 345, 880, 360, 880, 330);
    noFill();
    line(870, 358, 870, 333);
    line(860, 356, 860, 335);
    line(850, 354, 850, 337);
    line(840, 352, 840, 339);
    line(830, 350, 830, 341);
    line(820, 347, 820, 343);//Vegetable

    quad(0, 0, 0, 0, 0, 0, 0, 0);//Apron
    fill(255, 3, 7);
    ellipse(20, 670, 35, 35);//Exit to Shed
    noFill();
    fill(3, 25, 255);
    ellipse(570, 670, 35, 35);//Exit to Study
    noFill();
    fill(22, 255, 30);
    ellipse(1150, 670, 35, 35);//Exit to Dining Room
  }

  void mousePressed() {
    if (mouseX >= 550 && mouseX <= 820) {
      if (mouseY >= 150 && mouseY <= 240) { 
        if (ChefDialogueIndex < ChefDialogue.length - 1) 
          ChefDialogueIndex +=1;
        Dialogue = ChefDialogue[ChefDialogueIndex];
      }
    }
    {
      if ( get(mouseX, mouseY) == blueColor) {
        pressbluebutton = ! pressbluebutton;
        if ( pressbluebutton == false )
          goToRoom(study_room);//ROOM CHANGE
      }

      if ( get(mouseX, mouseY) == redColor) {
        pressredbutton = ! pressredbutton;
        if ( pressredbutton == false )
          goToRoom(shed_room);//ROOM CHANGE
      }



      if ( get(mouseX, mouseY) == greenColor) {
        pressgreenbutton = ! pressgreenbutton;
        if ( pressgreenbutton == false )
          goToRoom(dining_room);//ROOM CHANGE
      }
    }
  }
}