class Agent {

  int xpos=800;
  int ypos=500;
  float anfangswinkel;
  float winkel;
  int d=30;

  Agent(float anfWinkel) {
    anfangswinkel = anfWinkel;
  }
  void rumkreisen() {
    fill(255);
    float x=300*cos(radians(anfangswinkel + winkel)) + width/2;
    float y=300*sin(radians(anfangswinkel + winkel)) + height/2;
    ellipse(xpos, ypos, d, d);
    winkel=winkel+1;
  }
}
