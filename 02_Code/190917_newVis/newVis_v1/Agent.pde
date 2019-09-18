class Agent {

  int xpos=800;
  int ypos=500;
  float anfangswinkel;
  float winkel;
  int maxD=width/3;
  int d=width/3;
  ;
  float x, y;
  boolean whichAgent;

  Agent(float anfWinkel, boolean agent) {
    anfangswinkel = anfWinkel;
    whichAgent =agent;
  }
  void rumkreisen() {
    fill(255);
    x=d*cos(radians( anfangswinkel+ winkel)) + width/2;
    y=d*sin(radians( anfangswinkel+ winkel)) + height/2;
    winkel=winkel+0.05;

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

  void aktivePos() {
    
    // AGENT GREY
    if (blink && whichAgent) {

      if (d>=10) {
        d=d-10;
      } else {
        d=0;
      }
    }

    if (blink && !whichAgent) {

      if (d>=maxD) {
        d=d+10;
      } else {
        d=maxD;
      }
    }
    
        // AGENT GREEN
    if (!blink && whichAgent) {

        if (d>=maxD) {
        d=d+10;
      } else {
        d=maxD;
      }
    
    }

    if (!blink && !whichAgent) {
  
        if (d>=10) {
        d=d-10;
      } else {
        d=0;
      }
      
    
    }
    
  }
}
