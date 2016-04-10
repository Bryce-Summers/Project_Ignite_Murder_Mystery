//this amazing room programmed by ____


class outro_room extends Room {
  //please put variables here
  outro_room_objects objects=new outro_room_objects();
  GUI_Dialogue_Box dialogueBox;
  GUI_Dialogue_Box confirm;
  int[] confirmBoundingBox=new int[]{1000, 700, width, height};
  private String suspectClicked="Who is the murderer?";
  void setup() {
    dialogueBox=new GUI_Dialogue_Box(0, 700, width, 100);
    confirm=new GUI_Dialogue_Box(1000, 700, 200, 100);
    confirm.setText("J'accuse!");
    confirm.setBackgroundColor(color(255, 0, 0));
    confirm.setTextColor(color(255, 255, 255));
  }

  public void mousePressed() {
    if (!(suspectClicked.equals("Nope")||suspectClicked.equals("Huzzah! You didn't lose."))) {
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
      } else if (checkObjectClicked(confirmBoundingBox)) {
        endGame();
      } else {
        suspectClicked="Who is the murderer?";
      }
    } else {
      if (checkObjectClicked(confirmBoundingBox)) {
        goToRoom(intro_room);
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
    confirm.setText("Play again?");
    if (suspectClicked.equals("Wife")) {
      dialogueBox.setBackgroundColor(color(0, 255, 0));
      suspectClicked="Huzzah! You didn't lose.";
      confirm.setBackgroundColor(color(0, 255, 0));
    } else {
      dialogueBox.setBackgroundColor(color(0, 0, 0));
      suspectClicked="Nope";
      confirm.setBackgroundColor(color(0, 0, 0));
    }
  }

  void draw() {
    background(255);
    objects.drawCreepo();
    objects.drawButler();
    objects.drawChef();
    objects.drawMaid();
    dialogueBox.setText(suspectClicked);
    dialogueBox.draw();
    if (!suspectClicked.equals("Who is the murderer?")) {
      confirm.draw();
    }
  }
}