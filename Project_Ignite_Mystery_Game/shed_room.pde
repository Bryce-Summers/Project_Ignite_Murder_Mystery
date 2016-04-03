//this amazing room programmed by James Wang
/**
 *@author James Wang
 **/
//last modified 14 February 2016

class shed_room extends Room {
  shed_room_main mainRoom=new shed_room_main();
  shed_room_trap trapRoom=new shed_room_trap();
  Room currentSubRoom=mainRoom;

  {
    mainRoom.setup();
    trapRoom.setup();
    mainRoom.setSuperRoom(this);
    trapRoom.setSuperRoom(this);
  }
  public shed_room() {
    currentSubRoom=mainRoom;
  }

  void setup() {
  };

  void draw() {
    currentSubRoom.draw();
  }

  void mousePressed() {
    currentSubRoom.mousePressed();
  }

  public void setCurrentSubRoom(char room) {
    switch(room) {
      case('t'):
      this.currentSubRoom=trapRoom;
      break;
      
      case('m'):
      this.currentSubRoom=mainRoom;
      break;
    }
  }
}