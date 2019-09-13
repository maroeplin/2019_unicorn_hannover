

Table tabelle;

String[] eeg1, eeg2, eeg3, eeg4, eeg5, eeg6, eeg7, eeg8;
int x=0;
float xPos=100;
int test;
float lastSum;
color htg;
boolean augenZu;
float groesse;

float phase = 0;
float zoff = 0;
int grenze=13;

float eX2;
float eY2, eY2_2, eY2_3, eY2_4, eY2_5, eY2_6, eY2_7, eY2_8;


void setup() {
  fullScreen();
  background(204);
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

  eX2=0;
  eY2=float(eeg1[x]);
  eY2_2=float(eeg2[x]);
  eY2_3=float(eeg3[x]);
  eY2_4=float(eeg4[x]);
  eY2_5=float(eeg5[x]);
  eY2_6=float(eeg6[x]);
  eY2_7=float(eeg7[x]);
  eY2_8=float(eeg8[x]);
}



void draw() { 

  x=x+1;
  stroke(20);
  strokeWeight(1);
int a=60;

  float eX1=x;
  float eY1=float(eeg1[x])+100+a;
  float eY1_2=float(eeg2[x])+200+a*2;
  float eY1_3=float(eeg3[x])+300+a*3;
  float eY1_4=float(eeg4[x])+400+a*4;
  float eY1_5=float(eeg5[x])+500+a*5;
  float eY1_6=float(eeg6[x])+600+a*6;
  float eY1_7=float(eeg7[x])+700+a*7;
  float eY1_8=float(eeg8[x])+800+a*8;

  //ellipse(x, 50 + eeg8[x], 3, 3);

  line(eX1, eY1, eX2, eY2);
  line(eX1, eY1_2, eX2, eY2_2);
  line(eX1, eY1_3, eX2, eY2_3);
  line(eX1, eY1_4, eX2, eY2_4);
  line(eX1, eY1_5, eX2, eY2_5);
  line(eX1, eY1_6, eX2, eY2_6);
  line(eX1, eY1_7, eX2, eY2_7);
  line(eX1, eY1_8, eX2, eY2_8);



  eX2=eX1;

  eY2=eY1;
  eY2_2=eY1_2;
  eY2_3=eY1_3;
  eY2_4=eY1_4;
  eY2_5=eY1_5;
  eY2_6=eY1_6;
  eY2_7=eY1_7;
  eY2_8=eY1_8;


  //}
  //eX2=0;
  // eY2=0;
  //translate(500-x,0);
}

void keyPressed() {

  if (key == 'l') {

    grenze = 13;
  } 
  if (key == 'm') {

    saveFrame();
  }
}
