class GUI_Button {
}

class GUI_Dialogue_Box {
  int x;
  int y;
  int xlength;
  int ylength;
  String text;
  color backgroundColor;
  //constructor
  GUI_Dialogue_Box(int x_in, int y_in, int xlength_in, int ylength_in) {
    x = x_in;
    y = y_in;
    xlength = xlength_in;
    ylength = ylength_in;
    backgroundColor = 255;
    text = "Dialogue Box";
  }

  void draw() {
    fill(255); //dialogue box color
    rect(x, y, xlength, ylength); 
    fill(86, 126, 224);
    textAlign(CENTER, CENTER);
    textSize(25);
    text(text, x + xlength/2, y + ylength/2);
  }

  void setText(String text_in) {
    text = text_in;
  }
}

class GUI_Text_Input_Box {
}