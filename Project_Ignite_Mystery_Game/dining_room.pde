//this amazing room programmed by ____

class dining_room extends Room {
  GUI_Dialogue_Box dialogue;

  boolean visible_hole = false;

  PImage blood;
  PImage img;
  PImage turkey;
  PImage hole;

  void setup() {

    img = loadImage ("japanese_floor_mat.png");
    turkey = loadImage ("TurkeyTopdown.jpg");
    hole = loadImage ("hole.jpg");
    blood = loadImage ("blood.jpg");

    /*floor_mat = loadImage("japanese_floor_mat.png");
     */


    dialogue = new GUI_Dialogue_Box(50, 50, 310, 100
      );

    dialogue.setText("look for clues");
  };


  void draw() {   
    background(255, 255, 255);

    beginShape();
    texture(img);
    vertex(370, 135, 0, 0);
    vertex(460, 135, img.width, 0);
    vertex(435, 210, 0, img.height);
    vertex(340, 210, img.width, img.height);
    endShape();

    beginShape();
    texture(img);
    vertex(320, 285, 0, 0);
    vertex(410, 285, img.width, 0);
    vertex(385, 360, 0, img.height);
    vertex(290, 360, img.width, img.height);
    endShape();

    beginShape();
    texture(img);
    vertex(270, 435, 0, 0);
    vertex(360, 435, img.width, 0);
    vertex(335, 510, 0, img.height);
    vertex(240, 510, img.width, img.height);
    endShape();

    beginShape();
    texture(img);
    vertex(220, 585, 0, 0);
    vertex(310, 585, img.width, 0);
    vertex(285, 660, 0, img.height);
    vertex(190, 660, img.width, img.height);
    endShape();

    beginShape();
    texture(img);
    vertex(745, 135, 0, 0);
    vertex(835, 135, img.width, 0);
    vertex(860, 210, 0, img.height);
    vertex(770, 210, img.width, img.height);
    endShape();

    beginShape();
    texture(img);
    vertex(795, 285, 0, 0);
    vertex(885, 285, img.width, 0);
    vertex(910, 360, 0, img.height); 
    vertex(820, 360, img.width, img.height);
    endShape();

    beginShape();
    texture(img);
    vertex(845, 435, 0, 0);
    vertex(935, 435, img.width, 0);
    vertex(960, 510, 0, img.height);
    vertex(870, 510, img.width, img.height);
    endShape();

    beginShape();
    texture(img);
    vertex(895, 585, 0, 0);
    vertex(985, 585, img.width, 0);
    vertex(1010, 660, 0, img.height);
    vertex(920, 660, img.width, img.height);
    endShape();



    fill(227, 224, 224);


    quad(500, 100, 700, 100, 900, 700, 300, 700);

    beginShape();
    texture(turkey);
    vertex(500, 300, 0, turkey.height);
    vertex(500, 400, 0, 0);
    vertex(600, 400, turkey.width, 0);
    vertex(600, 300, turkey.width, turkey.height);
    endShape();

    fill(255, 255, 255);
    quad(555, 15, 630, 15, 645, 90, 540, 90);

    beginShape();
    texture(blood);
    vertex(555, 15, 0, blood.height);
    vertex(630, 15, 0, 0);
    vertex(645, 90, blood.width, 0);
    vertex(540, 90, blood.width, blood.height);
    endShape();

    fill(85, 49, 49);
    rect(0, 200, 25, 400); /*this rectangel will be used as the button to send the player to the living room*/

    fill(205, 232, 37);
    ellipse(30, 500, 15, 15);

    fill(8, 113, 19);
    rect(1175, 200, 25, 400); /*this rectangel will be used as the button to send the player to the kitchen*/

    if (mouseX > 100 && mouseX < 150 && mouseY > 200 && mouseY < 250) {
      visible_hole = true;
    }

    if (visible_hole) {

      beginShape();
      texture(hole);
      vertex(100, 250, 0, hole.height);
      vertex(100, 200, 0, 0);
      vertex(150, 200, hole.width, 0);
      vertex(150, 250, hole.width, hole.height);
      endShape();

      dialogue.setText("You have discovered the \n secret tunnel to the shed");
    };
    /*this rectangel will be used as the buton to send the player to the secret area*/


    fill(255, 255, 118);


    arc(580, 200, 75, 75, QUARTER_PI, QUARTER_PI + HALF_PI);
    arc(580, 200, 75, 75, QUARTER_PI + HALF_PI, PI + HALF_PI + QUARTER_PI);

    if (mouseX < 25 && mouseY > 200 && mouseY < 600)
    {
      dialogue.setText("Click to go to living room");

    }

    dialogue.draw();

    if (1175 < mouseX && mouseX < 1200 && mouseY > 200 && mouseY < 600) {
      dialogue.setText("click to go to the kitchen");
    }
    dialogue.draw();
  };

  void mousePressed() {
    if (mouseX > 100 && mouseX < 150 && mouseY > 200 && mouseY < 250) {
      goToRoom(bed_room);
    }
    if (mouseX < 25 && mouseY > 200 && mouseY < 600) {
      rect(20, 100, 100, 100);
      goToRoom(living_room);
    }/*This rectangle is a placeholder for the transition to the living room*/
    if (mouseX > 1175 && mouseX < 1200 && mouseY > 200 && mouseY < 600) {
      rect(200, 100, 100, 100);
      goToRoom(kitchen_room);
    }/*this rectangle is another placeholder for the transition to the kitchen */
    if (mouseX > 100 && mouseX < 120 && mouseY > 200 && mouseY < 250) {
      rect(300, 50, 90, 10);
      goToRoom(shed_room);
    }/*this rectangle is a placeholder for transition to shed*/
  }
}