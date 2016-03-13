//this amazing room programmed by James Wang
/**
 *@author James Wang
 **/
//last modified 14 February 2016

class shed_room extends Room {
  Room currentSubRoom=new shed_room_main();

  Room mainRoom=new shed_room_main();
  public shed_room() {
    currentSubRoom=mainRoom;
  }

  void setup() {
  };

  void draw() {
    currentSubRoom.draw();
  }

  void mouseClicked() {
    currentSubRoom.mouseClicked();
  }

  public void setCurrentSubRoom(Room subRoom) {
    this.currentSubRoom=subRoom;
  }
}