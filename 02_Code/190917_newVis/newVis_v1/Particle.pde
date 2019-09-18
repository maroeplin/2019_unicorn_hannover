// number of particles
final static int N = 400;
 
// colors (some of them taken from http://www.colourlovers.com/pattern/5526827/bleak
final static color[] cols = { 
  #FF8A00, #FFD200, #749D9D, #FCF5B3, #B39500, #272429
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
  
  // mood factor
  float mood;
 
  void reset() {
    // distribute initial point on the ring, more near the outer edge, distorted
    float angle = random(TWO_PI);
    float r = (1.0*randomGaussian() + (width/2-100)*(1.0-pow(random(1.0), 7.0)))/5;
    //float r = (1.0*randomGaussian() + (width/2-100)*(1.0-pow(random(1.0), 7.0)))/3;
    x = cos(angle)*r;
    y = sin(angle)*r;
    // set random age
    age = (int)random(1000, 2000);
    calcMood();
  }
 
  void draw() {
    noStroke();
    fill(c,50);
    ellipse(x, y,2,2);
  }
 
  // update position with externally calculated speed
  // check also age
  void update() {
    if(--age < 400) {
      reset();
    } else {
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
