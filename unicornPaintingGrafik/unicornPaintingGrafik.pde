// y * 5x

// x = 5t
// y = 3t + 3

static final int Tentakel = 100;
float t;  //zero by default
float offset;

void setup() {
  background(20);
  size(500, 500);
}

void draw() {
  float shift = 0;
  shift=sin(t)*(-2)*100;
 //background(20);
  stroke(shift,t,shift+random(0,55),10);
  strokeWeight(5);
  
  translate(width/2, height/2);
  
  
  
  for (int i = 0; i < Tentakel; i++) {
    
     line(x1(t + i) + offset, y1(t + i), x2(t + i), y2(t + i)); 
  }
  
  t++;
 
}

  float x1(float t) {
     return sin(t / 10) * 100 + sin(t / 5) * 20;
  }

  float y1(float t) {
    return cos(t / 10) * 100 *random(1,t)*1.5;
  }

  float x2(float t) {
     return sin(t / 10) * 200*random(1,t) + sin(t) * 2;
  }
  
  float y2(float t) {
    return cos(t / 20) * 200 * noise(t * cos(t / 12) + 20);
    
  }
