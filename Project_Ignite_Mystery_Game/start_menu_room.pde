public class start_menu_room extends Room {
  Button titleButton;
  Button playButton;

  public void setup() {
    titleButton=new Button(100,150,1100,250,color(100,100,100),"THE MOST AWESOME MURDER (MYSTERY) EVER!");
    playButton=new Button(550, 350, 650, 450, color(100, 0, 0), "Play");
  }

  public void draw() {
    titleButton.draw();
    playButton.draw();
  }

  public void mousePressed() {
    if (playButton.isClicked()) {
      goToRoom(entrance_room);
    }
  }

  private class Button {
    int left;
    int top;
    int right;
    int bottom;
    int wide;
    int high;
    color colour;
    String string;
    public final int DEFAULT_TEXT_SIZE=32;
    public Button() {
    }

    public Button(int left, int top, int right, int bottom) {
      this.left=left;
      this.top=top;
      this.right=right;
      this.bottom=bottom;
      this.wide=right-left;
      this.high=bottom-top;
    }

    public Button(int left, int top, int right, int bottom, color colour, String string) {
      this(left, top, right, bottom);
      this.colour=colour;
      this.string=string;
    }

    public boolean isClicked() {
      return mouseX>=left&&mouseY>=top&&mouseX<=right&&mouseY<=bottom;
    }

    public void draw() {
      fill(colour);
      //stroke(255);
      textSize(DEFAULT_TEXT_SIZE);
      textAlign(CENTER,CENTER);
      rect(left, top, wide, high);
      fill(255);
      text(string, left+wide/2, top+high/2);
    }
  }
}