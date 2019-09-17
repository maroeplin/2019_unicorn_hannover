

Table tabelle;

String[] eeg1, eeg2, eeg3, eeg4, eeg5, eeg6, eeg7, eeg8;
int x;
float xPos=100;
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


//MUSE
Table muse_tabelle;


void setup() {
  fullScreen();
  background(20, 20, 20);


  // eigene CSV aufnehmen

  csv_muse = new Table();
  csv_muse.addColumn("TimeStamp", Table.FLOAT);

  csv_muse.addColumn("Delta_TP9", Table.FLOAT);
  csv_muse.addColumn("Delta_AF7", Table.FLOAT);
  csv_muse.addColumn("Delta_AF8", Table.FLOAT);
  csv_muse.addColumn("Delta_TP10", Table.FLOAT);

  csv_muse.addColumn("Theta_TP9", Table.FLOAT);
  csv_muse.addColumn("Theta_AF7", Table.FLOAT);
  csv_muse.addColumn("Theta_AF8", Table.FLOAT);
  csv_muse.addColumn("Theta_TP10", Table.FLOAT);

  csv_muse.addColumn("Alpha_TP9", Table.FLOAT);
  csv_muse.addColumn("Alpha_AF7", Table.FLOAT);
  csv_muse.addColumn("Alpha_AF8", Table.FLOAT);
  csv_muse.addColumn("Alpha_TP10", Table.FLOAT);

  csv_muse.addColumn("Beta_TP9", Table.FLOAT);
  csv_muse.addColumn("Beta_AF7", Table.FLOAT);
  csv_muse.addColumn("Beta_AF8", Table.FLOAT);
  csv_muse.addColumn("Beta_TP10", Table.FLOAT);

  csv_muse.addColumn("Gamma_TP9", Table.FLOAT);
  csv_muse.addColumn("Gamma_AF7", Table.FLOAT);
  csv_muse.addColumn("Gamma_AF8", Table.FLOAT);
  csv_muse.addColumn("Gamma_TP10", Table.FLOAT);

  csv_muse.addColumn("RAW_TP9", Table.FLOAT);
  csv_muse.addColumn("RAW_AF7", Table.FLOAT);
  csv_muse.addColumn("RAW_AF8", Table.FLOAT);
  csv_muse.addColumn("RAW_TP10", Table.FLOAT);

  csv_muse.addColumn("AUX_RIGHT", Table.FLOAT);

  csv_muse.addColumn("Accelerometer_X", Table.FLOAT);
  csv_muse.addColumn("Accelerometer_Y", Table.FLOAT);
  csv_muse.addColumn("Accelerometer_Z", Table.FLOAT);

  csv_muse.addColumn("Gyro_X", Table.FLOAT);
  csv_muse.addColumn("Gyro_Y", Table.FLOAT);
  csv_muse.addColumn("Gyro_Z", Table.FLOAT);
  
  
    csv_muse.addColumn("HeadBandOn", Table.FLOAT);

  csv_muse.addColumn("HSI_TP9", Table.FLOAT);
  csv_muse.addColumn("HSI_AF7", Table.FLOAT);
  csv_muse.addColumn("HSI_AF8", Table.FLOAT);
  csv_muse.addColumn("HSI_TP10", Table.FLOAT);
  
  csv_muse.addColumn("Battery", Table.FLOAT);
  csv_muse.addColumn("Elements", Table.STRING);




  for (int i=0; i<60000; i++) {
    csv_muse.addRow(); 


    muse_tabelle = loadTable("export.csv", "header");

    // erstmal nur die roh-eeg daten.

    eeg1 =muse_tabelle.getStringColumn("RAW_TP9"); 
    eeg2 =muse_tabelle.getStringColumn("RAW_AF7");
    eeg3 =muse_tabelle.getStringColumn("RAW_AF8"); 
    eeg4 =muse_tabelle.getStringColumn("RAW_TP10");

    // als naechstes koennen wir aus der csv alle andere Werte importieren
  }



  void draw() { 

    translate(width/2, height/3);
    strokeWeight(0);
    fill(255, 0, 0);
    //ellipse(-width/3,-height/3,200,200);
    float schlucht=0;//map(sin(xPos),-1,1,0,width);
    groesse=xPos*0.9;
    //background(htg);
    x=x+1;
    //println(eeg1[x]);
    xPos=map(x, 0, 8000, 0, width);

    if (x >10) {
      //for(int i=0; i<11; i++){
      //  lastSum=lastSum+dist(float(eeg8[x]),0,float(eeg8[i-1]),0)
      //}
      //lastSum=dist(float(eeg8[x]), 0, float(eeg8[x-1]), 0) + dist(float(eeg8[x-1]), 0, float(eeg8[x-2]), 0) +  dist(float(eeg8[x-2]), 0, float(eeg8[x-3]), 0) +  dist(float(eeg8[x-3]), 0, float(eeg8[x-4]), 0) +  dist(float(eeg8[x-4]), 0, float(eeg8[x-5]), 0)  +  dist(float(eeg8[x-5]), 0, float(eeg8[x-6]), 0) +  dist(float(eeg8[x-6]), 0, float(eeg8[x-7]), 0) +  dist(float(eeg8[x-7]), 0, float(eeg8[x-8]), 0) +  dist(float(eeg8[x-8]), 0, float(eeg8[x-9]), 0) +  dist(float(eeg8[x-9]), 0, float(eeg8[x-10]), 0);
      lastSum=dist(float(eeg1[x]), 0, float(eeg1[x-1]), 0) + dist(float(eeg1[x-1]), 0, float(eeg1[x-2]), 0) +  dist(float(eeg1[x-2]), 0, float(eeg1[x-3]), 0) +  dist(float(eeg1[x-3]), 0, float(eeg1[x-4]), 0) +  dist(float(eeg1[x-4]), 0, float(eeg1[x-5]), 0)  +  dist(float(eeg1[x-5]), 0, float(eeg1[x-6]), 0) +  dist(float(eeg1[x-6]), 0, float(eeg1[x-7]), 0) +  dist(float(eeg1[x-7]), 0, float(eeg1[x-8]), 0) ;

      if (lastSum<grenze) {
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

        float r = map(int(eeg1[x]), -30, 30, 0, groesse);
        float ix = map(r * cos(radians(360/8)*1), -1, 1, 0, 2);
        float y = map(r * sin(radians(360/8)*1), -1, 1, 0, 2);
        curveVertex(ix+schlucht, y);

        r = map(int(eeg2[x]), -30, 30, 0, groesse);
        ix = map(r * cos(radians(360/8)*2), -1, 1, 0, 2);
        y = map(r * sin(radians(360/8)*2), -1, 1, 0, 2);
        curveVertex(ix+schlucht, y);

        r = map(int(eeg3[x]), -30, 30, 0, groesse);
        ix = map(r * cos(radians(360/8)*3), -1, 1, 0, 2);
        y = map(r * sin(radians(360/8)*3), -1, 1, 0, 2);
        curveVertex(ix+schlucht, y);

        r = map(int(eeg4[x]), -30, 30, 0, groesse);
        ix = map(r * cos(radians(360/8)*4), -1, 1, 0, 2);
        y = map(r * sin(radians(360/8)*4), -1, 1, 0, 2);
        curveVertex(ix+schlucht, y);



        curveVertex(0, 0);
        endShape(CLOSE);
      } else {
        htg=color(145);
        test=test+1;

        pushMatrix();
        translate(50+xPos/2, 50+xPos/2);
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

        float r = map(int(eeg1[x]), -30, 30, 0, groesse);
        float ix = map(r * cos(radians(360/8)*1), -1, 1, 0, 2);
        float y = map(r * sin(radians(360/8)*1), -1, 1, 0, 2);
        vertex(ix+schlucht, y);

        r = map(int(eeg2[x]), -30, 30, 0, groesse);
        ix = map(r * cos(radians(360/8)*2), -1, 1, 0, 2);
        y = map(r * sin(radians(360/8)*2), -1, 1, 0, 2);
        vertex(ix+schlucht, y);

        r = map(int(eeg3[x]), -30, 30, 0, groesse);
        ix = map(r * cos(radians(360/8)*3), -1, 1, 0, 2);
        y = map(r * sin(radians(360/8)*3), -1, 1, 0, 2);
        vertex(ix+schlucht, y);

        r = map(int(eeg4[x]), -30, 30, 0, groesse);
        ix = map(r * cos(radians(360/8)*4), -1, 1, 0, 2);
        y = map(r * sin(radians(360/8)*4), -1, 1, 0, 2);
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



    ellipse(xPos, 100+int(eeg1[x]), 3, 3);
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
  }
