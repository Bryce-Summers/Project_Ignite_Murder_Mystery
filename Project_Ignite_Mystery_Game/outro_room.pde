//this amazing room programmed by ____


class outro_room extends Room {
  //please put variables here
  outro_room_objects objects=new outro_room_objects();
  GUI_Dialogue_Box dialogueBox;
  GUI_Dialogue_Box confirm;
  int[] confirmBoundingBox=new int[]{1000, 700, width, height};
  private String suspectClicked="Who is the murderer?";

  int roomProgression=0;
  void setup() {
    dialogueBox=new GUI_Dialogue_Box(0, 700, width, 100);
    confirm=new GUI_Dialogue_Box(1000, 700, 200, 100);
    confirm.setText("J'accuse!");
    confirm.setBackgroundColor(color(255, 0, 0));
    confirm.setTextColor(color(255, 255, 255));
  }

  public void mousePressed() {
    if (roomProgression==0) {
      if (checkObjectClicked(objects.creepoBoundingBox)) {
        //println("creepo clicked");
        suspectClicked="Creepo";
      } else if (checkObjectClicked(objects.chefBoundingBox)) {
        //println("chef clicked");
        suspectClicked="The chef";
      } else if (checkObjectClicked(objects.maidBoundingBox)) {
        suspectClicked="The maid";
      } else if (checkObjectClicked(objects.butlerBoundingBox)) {
        suspectClicked="The butler";
      } else if (checkObjectClicked(objects.advisorBoundingBox)) {
        suspectClicked="The advisor";
      } else if (checkObjectClicked(objects.wifeBoundingBox)) {
        suspectClicked="The wife";
      } else if (roomProgression==0) {
        print("inside");
        roomProgression++;
        endGame();
      } else {
        suspectClicked="Who is the murderer?";
      }
    } else if (checkObjectClicked(confirmBoundingBox)) { 
      print("here");
      if (roomProgression==1) {
        reset();
        //goToRoom(start_menu_room);
      } else if (roomProgression==2) {
        if (checkObjectClicked(confirmBoundingBox)) {
          dialogueBox.setTextSize(32);
          suspectClicked="The wife was subsequently taken to jail and arrested for her crimes.\nShe is now in prison. \n The Maid is happily married to the advisor. \n The Butler has gone on a much needed vacation. \n The Chef has gone to therapy for his anger issues. \n Creepo now owns a multi-millionaire kitchen knife business. \n The Advisor now works for Creepo and handles his finances. \n You were awarded by the police force. \nYou now work as a highly paid detective";
          roomProgression++;
        }
      } else if (roomProgression==3) {
        roomProgression++;
      } else if (roomProgression==4) {
        reset();
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

  private void endGame() {
    dialogueBox=new GUI_Dialogue_Box(0, 0, width, height);
    dialogueBox.setTextSize(64);
    dialogueBox.setTextColor(color(255, 255, 255));
    if (suspectClicked.equals("The wife")) {
      dialogueBox.setBackgroundColor(color(0, 255, 0));
      suspectClicked="Huzzah! You didn't lose.";
      confirm.setBackgroundColor(color(0, 255, 0));
      confirm.setText("Continue");
      roomProgression++;
    } else {
      dialogueBox.setBackgroundColor(color(0, 0, 0));
      suspectClicked="Nope";
      confirm.setBackgroundColor(color(0, 0, 0));
      confirm.setText("Play again?");
    }
  }

  void draw() {
    background(255);
    objects.drawCreepo();
    objects.drawButler();
    objects.drawChef();
    objects.drawMaid();
    objects.drawWife();
    objects.drawAdvisor();
    dialogueBox.setText(suspectClicked);
    dialogueBox.draw();
    if (!suspectClicked.equals("Who is the murderer?")) {
      confirm.draw();
    }
    if (roomProgression==4) {
      drawCredits();
    }
  }
  void drawCredits() {    
    String credits = "Created by:";
    String creditsA = " -James Wang";
    String credits1 = " -Bronwyn Thomas";
    String credits2 = " -Amallia Rascoe";
    String credits3 = " -Varsha Venugopal";
    String credits4 = " -Tyler Augenstein";
    String credits5 = " -Brendan Marsili"; 
    String thank_you = "And a huge thank you to our advisors Bryce Summers, Sara Adkins, and Grant Schwabacher!";

    background(0);
    confirm.setBackgroundColor(color(0));
    confirm.draw();
    textSize (40);
    fill (255);
    text (credits, 250, 0, 700, 50); 
    text (creditsA, 250, 70, 700, 50); 
    text (credits1, 250, 170, 700, 50); 
    text (credits2, 250, 270, 700, 50); 
    text (credits3, 250, 370, 700, 50); 
    text (credits4, 250, 470, 700, 50);
    text (credits5, 250, 570, 700, 50); 
    text (thank_you, 250, 650, 700, 140);
  }
}