// number of particles
final static int N = 400;
 
// colors (some of them taken from http://www.colourlovers.com/pattern/5526827/bleak
final static color[] cols = { 
  #FFFFFF, #e134eb, #00e4e8, #00f6fa, #ba009e, #25f4f7
};
 
// collection of all particles
ArrayList<Particle> particles = new ArrayList<Particle>(N);

float time = 0.0;


class Particle {
  // position
  float x, y;
  // velocity
  float dx, dy;
  // id
  int id;
  // life length
  float age;
  // some random color
  color c = cols[(int)random(cols.length)];
  float r;
  // mood factor
  float mood;
 
  void reset() {
    // distribute initial point on the ring, more near the outer edge, distorted
    float angle = random(TWO_PI);
     r = (1.0*randomGaussian() + (width/2-100)*(1.0-pow(random(1.0), 7.0)))/4;
    //float r = (1.0*randomGaussian() + (width/2-100)*(1.0-pow(random(1.0), 7.0)))/3;
    x = cos(angle)*r+ noise(frameCount*0.007)*100;
    y = sin(angle)*r+ noise(frameCount*0.007)*100;
    // set random age
    age = (int)random(100, 1000);
    calcMood();
  }
 
  void draw() {
    noStroke();
    //println("D AAA "+ agent_green.d);
    if(agent_grey.d <=agent_grey.maxD/2){
    fill(c,map(agent_grey.d,0,agent_grey.maxD/2,50,0));
    } if (agent_grey.d >agent_grey.maxD/2) {
    fill(c,map(agent_grey.d,agent_grey.maxD/2,agent_grey.maxD,0,130));
    }
   
    ellipse(x, y,2,2);
  
  }
 
  // update position with externally calculated speed
  // check also age
  void update() {
    if(mousePressed){
    reset();
    }
    if(--age < 0) {
      reset();
    } else {
      
      //x -= random(dx,-dx/0.4);
      //y -= random(dy,-dy/0.4);
       x += dx;
      y += dy;
      calcMood();
    }
  }
 
  Particle(int i) {
    id = i;
    reset();
  }
  
  // compare moods
  float moodSimilarity(Particle p) {
    return 1.0-abs(p.mood-this.mood);
  }
  
  // calculate current mood
  private void calcMood() {
    mood = sin(noise(x/10.0,y/10.0,time)*TWO_PI); 
  }
 }
