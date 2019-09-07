Table tabelle;
String[] eeg1, eeg2, eeg3, eeg4, eeg5, eeg6, eeg7, eeg8;
int x;
float xPos;
float farbshift;

void setup() {
    background(20);
fullScreen();

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
  x=x+1;
  println(eeg1[x]);
  xPos=map(x,0,15000,0,width);
  farbshift=map(int(eeg1[x]),-30,30,100,255);
  strokeWeight(farbshift/10);
  noFill();
  stroke(farbshift/3, farbshift,farbshift, 100);
  
  //ellipse(sin(xPos)*500+width/2, height/2+tan(farbshift), 3*int(eeg1[x]+30), 3*int(eeg1[x]+30));
  line(sin(xPos)*1000+width/2, height/2+tan(farbshift)*10, 3*int(eeg1[x]+30)+width/2, 3*int(eeg1[x]+30)+height/2);
  stroke(farbshift, farbshift/3, farbshift, 100);
  line(sin(xPos)*1000+width/2+3*int(eeg2[x]), height/2+tan(farbshift)*int(eeg2[x]), 3*int(eeg2[x]+30)+width/2, farbshift/10*int(eeg2[x]+30)+height/2);
}
