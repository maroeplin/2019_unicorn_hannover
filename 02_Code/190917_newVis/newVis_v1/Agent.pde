class Agent {

  int xpos=800;
  int ypos=500;
  float anfangswinkel;
  float winkel;
  int d=430;
  float x, y;

  Agent(float anfWinkel) {
    anfangswinkel = anfWinkel;
  }
  void rumkreisen() {
    fill(255);
    x=d*cos(radians( anfangswinkel+ winkel)) + width/2;
    y=d*sin(radians( anfangswinkel+ winkel)) + height/2;
    winkel=winkel+0.1;

    //if ( blink) {
    //  if (d>=4) {
    //    d=d-4;
    //  } else {
    //    d=0;
    //  }
    //}

    //if ( !blink) {
    //  if (d<=430) {
    //    d=d+4;
    //  } else {
    //    d=430;
    //  }
    //}
  }
}
