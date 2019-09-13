

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




void setup() {
  fullScreen();
  background(20, 20, 20);
  tabelle = loadTable("UnicornRecorder_vk20190907_222509.csv", "header");
  //println(tabelle.getString(1, "EEG 1"));
  eeg1 =tabelle.getStringColumn("EEG 1"); //
  eeg2 =tabelle.getStringColumn("EEG 2");
  eeg3 =tabelle.getStringColumn("EEG 3"); //
  eeg4 =tabelle.getStringColumn("EEG 4");
  eeg5 =tabelle.getStringColumn("EEG 5"); //
  eeg6 =tabelle.getStringColumn("EEG 6");
  eeg7 =tabelle.getStringColumn("EEG 7"); //
  eeg8 =tabelle.getStringColumn("EEG 8");
  //printArray(wortarten);
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
    lastSum=dist(float(eeg8[x]), 0, float(eeg8[x-1]), 0) + dist(float(eeg8[x-1]), 0, float(eeg8[x-2]), 0) +  dist(float(eeg8[x-2]), 0, float(eeg8[x-3]), 0) +  dist(float(eeg8[x-3]), 0, float(eeg8[x-4]), 0) +  dist(float(eeg8[x-4]), 0, float(eeg8[x-5]), 0)  +  dist(float(eeg8[x-5]), 0, float(eeg8[x-6]), 0) +  dist(float(eeg8[x-6]), 0, float(eeg8[x-7]), 0) +  dist(float(eeg8[x-7]), 0, float(eeg8[x-8]), 0) ;

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

      r = map(int(eeg5[x]), -30, 30, 0, groesse);
      ix = map(r * cos(radians(360/8)*5), -1, 1, 0, 2);
      y = map(r * sin(radians(360/8)*5), -1, 1, 0, 2);
      curveVertex(ix+schlucht, y);

      r = map(int(eeg6[x]), -30, 30, 0, groesse);
      ix = map(r * cos(radians(360/8)*6), -1, 1, 0, 2);
      y = map(r * sin(radians(360/8)*6), -1, 1, 0, 2);
      curveVertex(ix+schlucht, y);

      r = map(int(eeg7[x]), -30, 30, 0, groesse);
      ix = map(r * cos(radians(360/8)*7), -1, 1, 0, 2);
      y = map(r * sin(radians(360/8)*7), -1, 1, 0, 2);
      curveVertex(ix+schlucht, y);

      r = map(int(eeg8[x]), -30, 30, 0, groesse);
      ix = map(r * cos(radians(360/8)*8), -1, 1, 0, 2);
      y = map(r * sin(radians(360/8)*8), -1, 1, 0, 2);
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

      r = map(int(eeg5[x]), -30, 30, 0, groesse);
      ix = map(r * cos(radians(360/8)*5), -1, 1, 0, 2);
      y = map(r * sin(radians(360/8)*5), -1, 1, 0, 2);
      vertex(ix+schlucht, y);

      r = map(int(eeg6[x]), -30, 30, 0, groesse);
      ix = map(r * cos(radians(360/8)*6), -1, 1, 0, 2);
      y = map(r * sin(radians(360/8)*6), -1, 1, 0, 2);
      vertex(ix+schlucht, y);

      r = map(int(eeg7[x]), -30, 30, 0, groesse);
      ix = map(r * cos(radians(360/8)*7), -1, 1, 0, 2);
      y = map(r * sin(radians(360/8)*7), -1, 1, 0, 2);
      vertex(ix+schlucht, y);

      r = map(int(eeg8[x]), -30, 30, 0, groesse);
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



  //ellipse(xPos, 100+int(eeg1[x]), 3, 3);
  //ellipse(xPos, 200+int(eeg2[x]), 3, 3);
  //ellipse(xPos, 300+int(eeg3[x]), 3, 3);
  //ellipse(x, 400+int(eeg4[x]), 3, 3);
  //ellipse(x, 500+int(eeg5[x]), 3, 3);
  //ellipse(x, 600+int(eeg6[x]), 3, 3);
  //ellipse(x, 700+int(eeg7[x]), 3, 3);
  ellipse(x, 800+int(eeg8[x]), 3, 3);
}

void keyPressed() {

  if(key == 'l') {

    grenze = 13;

  } if(key == 'm') {

    grenze = 203;

  }

}
