//this amazing room programmed by James Wang
/**
 *@author James Wang
 **/
//last modified 14 February 2016

class shed_room extends Room {
  Room currentRoom;

  Room mainRoom=new shed_room_main();
  public shed_room() {
    currentRoom=mainRoom;
  }

  void setup() {
  };

  void draw() {
    currentRoom.draw();
  }