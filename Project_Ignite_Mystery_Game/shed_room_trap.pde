import java.awt.*;
import java.util.*;

class shed_room_trap extends Room {
  private shed_room superRoom;
  
  public void setSuperRoom(shed_room superRoom){
    this.superRoom=superRoom;
  }
  
  public void setup(){
  }
  
  public void draw(){
    background(0);
  }
}