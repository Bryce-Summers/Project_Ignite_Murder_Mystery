//this amazing room programmed by ____


class living_room extends Room {
  int xcord;
  int x;
  int y;

  GUI_Dialogue_Box toDiningRoom;
  GUI_Dialogue_Box toEntranceRoom;
  GUI_Dialogue_Box toStudyRoom;
  int[] toDiningRoomBounds=new int[]{0, height-100, 300, height};
  int[] toEntranceRoomBounds=new int[]{300, height-100, 600, height};
  int[] toStudyRoomBounds=new int[]{600, height-100, 900, height};
  void setup() {
    background(0, 0, 0);
    stroke(50);
    frameRate(150);

    toDiningRoom=new GUI_Dialogue_Box(0, height-100, 300, 100);
    toDiningRoom.setText("Go to the dining room");
    toEntranceRoom=new GUI_Dialogue_Box(300,height-100, 300, 100);
    toEntranceRoom.setText("Go to the entrance hall");
    toStudyRoom=new GUI_Dialogue_Box (600, height-100, 300, 100);
    toStudyRoom.setText("Go to the study");
  }

  void mousePressed() {
    if(checkObjectClicked(toDiningRoomBounds)){
      goToRoom(dining_room);
    } else if(checkObjectClicked(toEntranceRoomBounds)){
      goToRoom(entrance_room);
    } else if(checkObjectClicked(toStudyRoomBounds)){
      goToRoom(study_room);
    }
  }

  void draw() {
    background(255, 255, 255);
    fill(234, 66, 19);
    rect(0, 0, 250, 600);
    noFill();
    fill(255, 55, 0);
    rect(5, 450, 240, 150);//Chimney
    noFill();
    line(5, 10, 250, 10);
    line(5, 40, 250, 40);
    line(5, 70, 250, 70);
    line(5, 100, 250, 100);
    line(5, 130, 250, 130);
    line(5, 160, 250, 160);
    line(5, 190, 250, 190);
    line(5, 220, 250, 220);
    line(5, 250, 250, 250);
    line(5, 280, 250, 280);
    line(5, 310, 250, 310);
    line(5, 340, 250, 340);
    line(5, 370, 250, 370);
    line(5, 400, 250, 400);
    line(5, 430, 250, 430);//Bricks
    //Bricks 2
    fill(75, 30, 12);
    rect(40, 540, 100, 30);
    rect(80, 570, 100, 30);
    rect(25, 570, 100, 30);
    noFill();
    fill(242, 39, 17);
    triangle(40, 540, 75, 540, 55, 470);
    triangle(55, 540, 90, 540, 75, 470);
    triangle(70, 540, 105, 540, 85, 470);
    triangle(90, 540, 120, 540, 105, 470);
    triangle(105, 540, 140, 540, 125, 470);
    noFill();
    fill(242, 102, 7);
    triangle(40, 540, 70, 540, 55, 490);
    triangle(60, 540, 90, 540, 75, 490);
    triangle(70, 540, 100, 540, 85, 490);
    triangle(90, 540, 120, 540, 105, 490);
    triangle(110, 540, 140, 540, 125, 490);
    noFill();
    fill(244, 245, 17);
    triangle(40, 540, 70, 540, 55, 510);
    triangle(60, 540, 90, 540, 75, 510);
    triangle(70, 540, 100, 540, 85, 510);
    triangle(90, 540, 120, 540, 105, 510);
    triangle(110, 540, 140, 540, 125, 510);
    noFill();//Fireplace
    fill(22, 108, 25);
    rect(300, 350, 500, 220);
    noFill();
    fill(100, 44, 21);
    rect(300, 570, 30, 30);
    rect(770, 570, 30, 30);
    line(365, 500, 740, 500);//Sofa
    noFill();
    line(365, 430, 365, 570);
    fill(48, 206, 52);
    line(300, 430, 365, 430);//ArmRest 1
    line(740, 430, 740, 570);
    line(740, 430, 800, 430);//ArmRest 2
    fill(216, 0, 0);
    rect(0, 600, 1200, 600);//Carpet
    noFill();
    rect(900, 150, 190, 190);
    line(900, 250, 1090, 250);
    line(1000, 150, 1000, 340);//Window
    ellipse(840, 330, 60, 60);//Maid Head
    line(840, 360, 885, 480);//Left Arm
    line(840, 360, 785, 480);//Right Arm
    line(820, 480, 820, 600);//Left Leg
    line(850, 480, 850, 600);//Right Leg
    fill(255, 255, 255);
    triangle(840, 360, 805, 480, 875, 480);//Maid Body
    fill(255, 255, 255);
    ellipse(825, 320, 10, 10); //Eye 1
    ellipse(855, 320, 10, 10); //Eye 2
    ellipse(840, 330, 1, 1);
    
    toDiningRoom.draw();
    toEntranceRoom.draw();
    toStudyRoom.draw();
  }
}