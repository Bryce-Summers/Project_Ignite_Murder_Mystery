class instruction_room extends Room {
  String instructions = "You have just witnessed a murder, and it is up to you to figure out who the murderer is. You must go through the various rooms by clicking on the arrows to look for clues that will help you find out who the murderer is. Use your mouse to click on the clues and talk to some of the suspects. Good Luck.";
  String click = "click anywhere";

  void setup () {
    background (137, 4, 22);
  }

  void draw () {
    background(0);
    textSize (42);
    fill (255);
    text (instructions, 100, 100, 1000, 700); 

    textSize (30);
    fill (255);
    text (click, 400, 700, 400, 90);
  }

  void mousePressed () {
    goToRoom(living_room);
  }
}