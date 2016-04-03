class GUI_Button {
}

class GUI_Dialogue_Box {
  int x;
  int y;
  int xlength;
  int ylength;
  String text;
  color backgroundColor;
  color textColor;
  int textSize;
  //constructor
  GUI_Dialogue_Box(int x_in, int y_in, int xlength_in, int ylength_in) {
    x = x_in;
    y = y_in;
    xlength = xlength_in;
    ylength = ylength_in;
    backgroundColor = 255;
    textColor=color(86, 126, 224);
    textSize=25;
    text = "Dialogue Box";
  }

  void draw() {
    fill(255); //dialogue box color
    rect(x, y, xlength, ylength); 
    fill(textColor);
    textAlign(CENTER, CENTER);
    textSize(textSize);
    text(text, x + xlength/2, y + ylength/2);
  }
  
  public void setTextColor(color textColor){
    this.textColor=textColor;
  }
  
  public void setTextSize(int textSize){
    this.textSize=textSize;
  }

  void setText(String text_in) {
    text = text_in;
  }
}

class GUI_Text_Input_Box {
}