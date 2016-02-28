static class shed_room_objects {
  public static final int HIDDEN=0;
  public static final int SHOWING=1;
  public static final int CONCEALED=2;
  static int[][] roomEdges=new int[][]{
    new int[]{1}, 
    new int[]{2, 798, 232, 498}, 
    new int[]{232, 498, 232, 498}, 
    new int[]{233, 498, 902, 500}, 
    new int[]{902, 500, 1199, 796}, 
    new int[]{903, 500, 908, 175}, 
    new int[]{232, 499, 232, 187}, 
    new int[]{232, 187, 907, 180}, 
    new int[]{907, 180, 1199, 0}, 
    new int[]{233, 188, 6, 2}, 
  };

  static int[][] magicWand=new int[][]{
    new int[]{1}, 
    new int[]{267, 426, 267, 354}, 
    new int[]{268, 426, 268, 354}, 
    new int[]{269, 426, 269, 354}, 
  };

  static int[][] chair=new int[][]{
    new int[]{1}, 
    new int[]{251, 528, 252, 448}, 
    new int[]{252, 448, 310, 448}, 
    new int[]{311, 448, 310, 525}, 
    new int[]{267, 499, 267, 425}, 
    new int[]{329, 498, 330, 426}, 
    new int[]{253, 448, 267, 426}, 
    new int[]{311, 448, 330, 427}, 
    new int[]{330, 427, 267, 426}, 
    new int[]{267, 426, 267, 354}, 
    new int[]{266, 354, 331, 354}, 
    new int[]{331, 354, 329, 426}, 
  };

  static int[][] squashedChair=new int[][]{
    new int[]{0}, 
    new int[]{267, 498, 251, 528}, 
    new int[]{251, 528, 310, 526}, 
    new int[]{310, 526, 329, 497}, 
    new int[]{329, 497, 267, 498}, 
    new int[]{311, 526, 341, 573}, 
    new int[]{252, 529, 208, 571}, 
    new int[]{329, 497, 388, 528}, 
    new int[]{268, 499, 206, 537}, 
    new int[]{275, 497, 330, 448}, 
    new int[]{330, 448, 329, 496}, 
  };

  static int[][] table=new int[][]{
    new int[]{1}, 
    new int[]{496, 516, 470, 615}, 
    new int[]{470, 615, 547, 615}, 
    new int[]{547, 615, 567, 516}, 
    new int[]{497, 515, 566, 517}, 
    new int[]{471, 615, 471, 702}, 
    new int[]{546, 614, 545, 699}, 
    new int[]{566, 516, 564, 599}, 
  };

  static int[][] powder=new int[][]{
    new int[]{1}, 
    new int[]{504, 523, 504, 523}, 
    new int[]{519, 526, 519, 526}, 
    new int[]{519, 521, 519, 521}, 
    new int[]{519, 521, 517, 525}, 
    new int[]{517, 525, 513, 521}, 
    new int[]{513, 521, 512, 527}, 
    new int[]{512, 527, 512, 527}, 
    new int[]{509, 530, 509, 530}, 
    new int[]{516, 530, 516, 530}, 
    new int[]{507, 526, 507, 526}, 
    new int[]{508, 517, 508, 517}, 
    new int[]{521, 526, 521, 526}, 
    new int[]{510, 532, 510, 532}, 
    new int[]{515, 519, 515, 519}, 
    new int[]{510, 525, 509, 522}, 
    new int[]{509, 522, 507, 525}, 
    new int[]{512, 528, 516, 528}, 
    new int[]{514, 534, 514, 534}, 
    new int[]{506, 530, 506, 530}, 
    new int[]{511, 535, 511, 534}, 
    new int[]{511, 534, 510, 537}, 
    new int[]{507, 533, 507, 533}, 
    new int[]{516, 532, 519, 530}, 
    new int[]{520, 532, 519, 533}, 
    new int[]{508, 529, 511, 524}, 
    new int[]{514, 530, 509, 532}, 
  };

  static int[][] paper=new int[][]{
    new int[]{1}, 
    new int[]{496, 538, 525, 537}, 
    new int[]{525, 537, 532, 515}, 
    new int[]{496, 538, 503, 515}, 
    new int[]{502, 515, 532, 516}, 
  };

  static int[][] rug=new int[][]{
    new int[]{1}, 
    new int[]{51, 799, 218, 564}, 
    new int[]{218, 564, 421, 564}, 
    new int[]{421, 564, 295, 799}, 
    //right frills
    new int[]{422, 565, 439, 565}, //x increments -7, y increments 13
    new int[]{415, 578, 432, 578}, 

    //top frills
    new int[]{218, 563, 228, 551}, 
    new int[]{230, 563, 240, 551}, 
    new int[]{242, 563, 252, 551}, 
    new int[]{254, 563, 264, 551}, 
    new int[]{266, 563, 276, 551}, 
    new int[]{278, 563, 288, 551}, 
    new int[]{290, 563, 300, 551}, 
    new int[]{302, 563, 312, 551}, 
    new int[]{314, 563, 324, 551}, 
    new int[]{326, 563, 336, 551}, 
    new int[]{340, 563, 350, 551}, 
    new int[]{352, 563, 362, 551}, 
    new int[]{364, 563, 374, 551}, 
    new int[]{376, 563, 386, 551}, 
    new int[]{388, 563, 398, 551}, 
    new int[]{400, 563, 410, 551}, 
    new int[]{412, 563, 422, 551}, 
    new int[]{422, 563, 432, 551}, 
    new int[]{218, 563, 228, 551}, //x increments 12
    new int[]{230, 563, 240, 551}, 
    new int[]{242, 563, 252, 551}, 
    new int[]{254, 563, 264, 551}, 
    new int[]{266, 563, 276, 551}, 
    new int[]{278, 563, 288, 551}, 
    new int[]{290, 563, 300, 551}, 
    new int[]{302, 563, 312, 551}, 
    new int[]{314, 563, 324, 551}, 
    new int[]{326, 563, 336, 551}, 
    new int[]{340, 563, 350, 551}, 
    new int[]{352, 563, 362, 551}, 
    new int[]{364, 563, 374, 551}, 
    new int[]{376, 563, 386, 551}, 
    new int[]{388, 563, 398, 551}, 
    new int[]{400, 563, 410, 551}, 
    new int[]{412, 563, 422, 551}, 
    new int[]{422, 563, 432, 551}, 
    //left frills
    new int[]{218, 564, 203, 564}, 
    new int[]{211, 572, 196, 572}, 
  };

  static int[][] face_smile=new int[][]{
    new int[]{2}, 
    new int[]{730, 355, 825, 355}, 
    new int[]{825, 355, 775, 390}, 
    new int[]{730, 355, 775, 390}, 
  };

  static int[][][] room_lines=new int[][][]{roomEdges, magicWand, chair, squashedChair, table, powder, paper, rug, face_smile};

  static int[][] face_circles=new int[][]{
    new int[]{2}, 
    new int[]{775, 333, 900, 332}, 
    new int[]{800, 310, 832, 310}, 
    new int[]{750, 310, 782, 310}, 
  };

  static int[][][] room_circles=new int[][][]{face_circles};
}