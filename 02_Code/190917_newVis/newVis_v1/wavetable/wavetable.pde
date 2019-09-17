import queasycam.*;
Table tabelle;

String[] eeg1, eeg2, eeg3, eeg4, alpha1, alpha2, alpha3, alpha4, beta1, beta2, beta3, beta4 ;
int x;
float xPos=100;
int test;
float lastSum;
color htg;
boolean augenZu;
float groesse;
QueasyCam cam;
float phase = 0;
float zoff = 0;
int grenze=13;

// tabelle zum aufnehmen
Table csv_muse;
int csv_counter;

//NetAddress myRemoteLocation;

//MUSE
Table muse_tabelle;



int cols, rows;
int scl = 40;
int w = 2000;
int h = 1600;

float flying = 0;

float[][] terrain;

void setup() {
  /*oscP5 = new OscP5(this, 5000);
  myRemoteLocation = new NetAddress("192.168.2.108", 5000);*/
cam = new QueasyCam(this);

  cam.speed = 3;              // default is 3
  cam.sensitivity = 0.2;      // default is 2



  muse_tabelle = loadTable("muse_data_katja.csv", "header");

  // erstmal nur die roh-eeg daten.

  eeg1 =muse_tabelle.getStringColumn("RAW_TP9");
  size(1920, 1080, P3D);
  cols = 100;
  rows = eeg1.length/cols;
  terrain = new float[cols][rows];
}


void draw() {
  
  flying -= 0.1;

  float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      if(int(eeg1[x+y*cols])>355471)
      {
        
        terrain[x][y] = int(eeg1[x+y*cols])/1000;
        
      }
     else{
      terrain[x][y] = int(eeg1[x+y*cols]);
     }
      
      xoff += 0.2;
    }
    yoff += 0.2;
  }



  background(25);
  stroke(255);
  strokeWeight(0.5);
  //noFill();


  translate(width/2, height/2+50);
  rotateX(PI/3);
  translate(-w/2, -h/2);
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      //rect(x*scl, y*scl, scl, scl);
    }
    endShape();
  }
}
