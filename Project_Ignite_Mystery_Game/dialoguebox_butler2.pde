class DialogueBox3
{
  int x;
  int y;
  int xlength;
  int ylength;
  String text;
  color backgroundColor;
  //constructor
  DialogueBox3(int x_in, int y_in, int xlength_in, int ylength_in)
  {
    x = x_in;
    y = y_in;
    xlength = xlength_in;
    ylength = ylength_in;
    backgroundColor = 255;
    text = "I can't remember ever seeing that woman cry.";
  }
  void draw3()
  {
    fill(0,200); //dialogue box color
    rect(x, y, xlength, ylength); 
    fill(#55FFE1);
    textAlign(CENTER, CENTER);
    textSize(25);
    text(text, x + xlength/2, y + ylength/2);
    
  }
  
  void setText(String text_in)
  {
  text = text_in;
  
  }
}