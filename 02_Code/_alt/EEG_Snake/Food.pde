class Food {
  int xpos=800;
  int ypos=500;
  int d=30;

  void place() {
    fill(0);
    ellipse(xpos, ypos, d, d);
  }

  void glow() {
    pushStyle();
    noFill();
    stroke(255);
    ellipse(xpos, ypos, d*4, d*4);
    popStyle();
  }

  void new_position() {
    pushStyle();
    fill(255);
    ellipse(xpos, ypos, d*4, d*4);
   
      xpos=int(random(300, width-300));
      ypos=int(random(300, height-300));
      
    
    popStyle();

    
  }
}
