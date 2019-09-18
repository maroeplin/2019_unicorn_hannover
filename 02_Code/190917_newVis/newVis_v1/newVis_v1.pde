

Table tabelle;

String[] eeg1, eeg2, eeg3, eeg4, alpha1, alpha2, alpha3, alpha4, beta1, beta2, beta3, beta4, delta1, delta2, delta3, delta4, theta1, theta2, theta3, theta4, gamma1, gamma2, gamma3, gamma4, elements ;
int x;
float xPos=0;
int test;
float lastSum;
color htg;
boolean augenZu;
float groesse;

float phase = 0;
float zoff = 0;
int grenze=13;

// tabelle zum aufnehmen
Table csv_muse;
int csv_counter;

NetAddress myRemoteLocation;

//MUSE
Table muse_tabelle;


float mapEeg1 =0;
float mapEeg2 =0;
float mapEeg3 =0;
float mapEeg4 =0;

boolean blink;
Agent agent_green = new Agent(0);
Agent agent_grey = new Agent(180);


void setup() {
  fullScreen();
  background(20, 20, 20);

  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this, 5000);
  myRemoteLocation = new NetAddress("192.168.2.108", 5000);



  muse_tabelle = loadTable("muse_data_katja.csv", "header");

  // erstmal nur die roh-eeg daten.

  eeg1 =muse_tabelle.getStringColumn("RAW_TP9"); 
  eeg2 =muse_tabelle.getStringColumn("RAW_AF7");
  eeg3 =muse_tabelle.getStringColumn("RAW_AF8"); 
  eeg4 =muse_tabelle.getStringColumn("RAW_TP10");

  alpha1 =muse_tabelle.getStringColumn("Alpha_TP9"); 
  alpha2 =muse_tabelle.getStringColumn("Alpha_AF7");
  alpha3 =muse_tabelle.getStringColumn("Alpha_AF8"); 
  alpha4 =muse_tabelle.getStringColumn("Alpha_TP10");

  beta1 =muse_tabelle.getStringColumn("Beta_TP9"); 
  beta2 =muse_tabelle.getStringColumn("Beta_AF7");
  beta3 =muse_tabelle.getStringColumn("Beta_AF8"); 
  beta4 =muse_tabelle.getStringColumn("Beta_TP10");

  delta1 =muse_tabelle.getStringColumn("Delta_TP9"); 
  delta2 =muse_tabelle.getStringColumn("Delta_AF7");
  delta3 =muse_tabelle.getStringColumn("Delta_AF8"); 
  delta4 =muse_tabelle.getStringColumn("Delta_TP10");

  theta1 =muse_tabelle.getStringColumn("Theta_TP9"); 
  theta2 =muse_tabelle.getStringColumn("Theta_AF7");
  theta3 =muse_tabelle.getStringColumn("Theta_AF8"); 
  theta4 =muse_tabelle.getStringColumn("Theta_TP10");


  gamma1 =muse_tabelle.getStringColumn("Gamma_TP9"); 
  gamma2 =muse_tabelle.getStringColumn("Gamma_AF7");
  gamma3 =muse_tabelle.getStringColumn("Gamma_AF8"); 
  gamma4 =muse_tabelle.getStringColumn("Gamma_TP10");
  
  elements =muse_tabelle.getStringColumn("Elements");

  // als naechstes koennen wir aus der csv alle andere Werte importieren
}



void draw() { 
  //background(0);
  
  agent_grey.rumkreisen();
  agent_green.rumkreisen();
  if ( x >24000) {

    noLoop();
  }

  // Werte aus der Tabelle auf passende Größen mappen
  if (int(eeg1[x]) <= 1500) {
    mapEeg1=map(float(eeg1[x]), 500, 1000, 0, 1000);
  } 

  if (int(eeg2[x]) <= 1500) {
    mapEeg2=map(float(eeg2[x]), 500, 1000, 0, 1000);
  } 

  if (int(eeg3[x]) <= 1500) {
    mapEeg3=map(float(eeg3[x]), 500, 1000, 100, 1000);
  } 

  if (int(eeg4[x]) <= 1500) {
    mapEeg4=map(float(eeg4[x]), 500, 1000, 100, 1000);
  } 

  float mapBeta=map(float(beta1[x]), 0, 1, 100, 800);
  ellipse(xPos, mapBeta, 3, 3);

  //translate(width/2, height/3);
  strokeWeight(0);
  fill(255, 0, 0);


  float schlucht=0;//map(sin(xPos),-1,1,0,width);
  //groesse=map(xPos,0,width,0,800);
  groesse=30;
  //background(htg);
  x=x+1;
  //println(eeg1[x]);
  xPos=map(x, 0, 24000, 0, width);


// Geblinzelt?
if (elements[x].equals("/muse/elements/blink")){
  blink=!blink;
}
  if (x >10) {
    //for(int i=0; i<11; i++){
    //  lastSum=lastSum+dist(float(eeg8[x]),0,float(eeg8[i-1]),0)
    //}
    //lastSum=dist(float(eeg8[x]), 0, float(eeg8[x-1]), 0) + dist(float(eeg8[x-1]), 0, float(eeg8[x-2]), 0) +  dist(float(eeg8[x-2]), 0, float(eeg8[x-3]), 0) +  dist(float(eeg8[x-3]), 0, float(eeg8[x-4]), 0) +  dist(float(eeg8[x-4]), 0, float(eeg8[x-5]), 0)  +  dist(float(eeg8[x-5]), 0, float(eeg8[x-6]), 0) +  dist(float(eeg8[x-6]), 0, float(eeg8[x-7]), 0) +  dist(float(eeg8[x-7]), 0, float(eeg8[x-8]), 0) +  dist(float(eeg8[x-8]), 0, float(eeg8[x-9]), 0) +  dist(float(eeg8[x-9]), 0, float(eeg8[x-10]), 0);
    lastSum=dist(float(eeg1[x]), 0, float(eeg1[x-1]), 0) + dist(float(eeg1[x-1]), 0, float(eeg1[x-2]), 0) +  dist(float(eeg1[x-2]), 0, float(eeg1[x-3]), 0) +  dist(float(eeg1[x-3]), 0, float(eeg1[x-4]), 0) +  dist(float(eeg1[x-4]), 0, float(eeg1[x-5]), 0)  +  dist(float(eeg1[x-5]), 0, float(eeg1[x-6]), 0) +  dist(float(eeg1[x-6]), 0, float(eeg1[x-7]), 0) +  dist(float(eeg1[x-7]), 0, float(eeg1[x-8]), 0) ;

    //if (lastSum<grenze) {
      if (blink) {
        
        pushMatrix();
        
        translate(agent_green.x, agent_green.y);
        
      htg=color(10, 200, 100);
      test=test-1;

      stroke(htg, 40);
      strokeWeight(1);
      //fill(htg,40);
      noFill();
      beginShape();
      //float noiseMax = map(mouseX, 0, width, 1, 5);
      float noiseMax = 0.3;
      curveVertex(0, 0);
      //for (float a = 0; a < TWO_PI; a += radians(360/8)) {
      //  /*float xoff = map(float(eeg8[int(a)]), -30, 30, 0, noiseMax);
      //  float yoff = map(float(eeg8[int(a)])*(-1), -30, 30, 0, noiseMax);
      //  */
      //  float r = map(int(eeg7[x]), -30, 30, 0, xPos);
      //  float x = map(r * cos(a),-1,1,0,2);
      //  float y = map(r * sin(a),-1,1,0,2);
      //  curveVertex(x, y);
      //}

      float r = map(int(mapEeg1), 0, 1000, 0, groesse);
      float ix = map(r * cos(radians(360/4)*1), -1, 1, 0, 2);
      float y = map(r * sin(radians(360/4)*1), -1, 1, 0, 2);
      curveVertex(ix+schlucht, y);

      r = map(int(mapEeg2), 0, 1000, 0, groesse);
      ix = map(r * cos(radians(360/4)*2), -1, 1, 0, 2);
      y = map(r * sin(radians(360/4)*2), -1, 1, 0, 2);
      curveVertex(ix+schlucht, y);

      r = map(int(mapEeg3), -30, 30, 0, groesse);
      ix = map(r * cos(radians(360/4)*3), -1, 1, 0, 2);
      y = map(r * sin(radians(360/4)*3), -1, 1, 0, 2);
      curveVertex(ix+schlucht, y);

      r = map(int(mapEeg4), -30, 30, 0, groesse);
      ix = map(r * cos(radians(360/4)*4), -1, 1, 0, 2);
      y = map(r * sin(radians(360/4)*4), -1, 1, 0, 2);
      curveVertex(ix+schlucht, y);
      curveVertex(0, 0);
      endShape(CLOSE);
      
      popMatrix();
    } else {
      htg=color(145);
      test=test+1;

      pushMatrix();
      translate(agent_grey.x, agent_grey.y);
      rotate(radians(map(float(beta1[x]), 0, 1, 0, 360)));
      stroke(htg, 40);
      strokeWeight(1);
      //fill(htg,40);
      noFill();
      beginShape();
      //float noiseMax = map(mouseX, 0, width, 1, 5);
      float noiseMax = 0.3;
      curveVertex(0, 0);
      //for (float a = 0; a < TWO_PI; a += radians(360/8)) {
      //  /*float xoff = map(float(eeg8[int(a)]), -30, 30, 0, noiseMax);
      //  float yoff = map(float(eeg8[int(a)])*(-1), -30, 30, 0, noiseMax);
      //  */
      //  float r = map(int(eeg7[x]), -30, 30, 0, xPos);
      //  float x = map(r * cos(a),-1,1,0,2);
      //  float y = map(r * sin(a),-1,1,0,2);
      //  curveVertex(x, y);
      //}

      float r = map(int(mapEeg1), 0,100, 0, groesse);
      float ix = map(r * cos(radians(360/8)*1), -1, 1, 0, 2);
      float y = map(r * sin(radians(360/8)*1), -1, 1, 0, 2);
      vertex(ix+schlucht, y);

      r = map(int(mapBeta), 0,100, 0, groesse);
      ix = map(r * cos(radians(360/8)*2), -1, 1, 0, 2);
      y = map(r * sin(radians(360/8)*2), -1, 1, 0, 2);
      vertex(ix+schlucht, y);

      r = map(int(mapEeg2), 0,100, 0, groesse);
      ix = map(r * cos(radians(360/8)*3), -1, 1, 0, 2);
      y = map(r * sin(radians(360/8)*3), -1, 1, 0, 2);
      vertex(ix+schlucht, y);

      r = map(int(mapBeta), 0,100, 0, groesse);
      ix = map(r * cos(radians(360/8)*4), -1, 1, 0, 2);
      y = map(r * sin(radians(360/8)*4), -1, 1, 0, 2);
      vertex(ix+schlucht, y);

      r = map(int(mapEeg3), 0,100, 0, groesse);
      ix = map(r * cos(radians(360/8)*5), -1, 1, 0, 2);
      y = map(r * sin(radians(360/8)*5), -1, 1, 0, 2);
      vertex(ix+schlucht, y);

      r = map(int(mapBeta), 0,100, 0, groesse);
      ix = map(r * cos(radians(360/8)*6), -1, 1, 0, 2);
      y = map(r * sin(radians(360/8)*6), -1, 1, 0, 2);
      vertex(ix+schlucht, y);


      r = map(int(mapEeg4), 0,100, 0, groesse);
      ix = map(r * cos(radians(360/8)*7), -1, 1, 0, 2);
      y = map(r * sin(radians(360/8)*7), -1, 1, 0, 2);
      vertex(ix+schlucht, y);

      r = map(int(mapBeta), 0,100, 0, groesse);
      ix = map(r * cos(radians(360/8)*8), -1, 1, 0, 2);
      y = map(r * sin(radians(360/8)*8), -1, 1, 0, 2);
      vertex(ix+schlucht, y);


      endShape(CLOSE);

      popMatrix();
    }
  }

  //println(lastSum);
  stroke(htg, 40);
  //line(xPos, 0, xPos, height);
  noFill();
  //ellipse(width/2,height/2,xPos,xPos);

  // rotateX(0.5);
  // rotateY(-.5);
  fill(100, 100, 100);

  phase += 0.003;
  zoff += 0.01;


  //ellipse(xPos, 200+int(eeg2[x]), 3, 3);
  //ellipse(xPos, 300+int(eeg3[x]), 3, 3);
  //ellipse(x, 400+int(eeg4[x]), 3, 3);
  //ellipse(x, 500+int(eeg5[x]), 3, 3);
  //ellipse(x, 600+int(eeg6[x]), 3, 3);
  //ellipse(x, 700+int(eeg7[x]), 3, 3);
  //ellipse(x, 800+int(eeg8[x]), 3, 3);
}

void keyPressed() {

  if (key == 'l') {

    grenze = 13;
  } 
  if (key == 'm') {

    grenze = 203;
  }

  if (key == 's' || key == 'S') {

    saveTable(csv_muse, "data/marks.csv");
  }
}
