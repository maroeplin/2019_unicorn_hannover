Table tabelle;
String[] eeg1, eeg2, eeg3, eeg4, eeg5, eeg6, eeg7, eeg8;
int x;
float xPos;

void setup() {
    
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
  
  
  ellipse(xPos, 100+int(eeg1[x]), 3, 3);
  ellipse(xPos, 200+int(eeg2[x]), 3, 3);
  ellipse(xPos, 300+int(eeg3[x]), 3, 3);
  ellipse(x, 400+int(eeg4[x]), 3, 3);
  ellipse(x, 500+int(eeg5[x]), 3, 3);
  ellipse(x, 600+int(eeg6[x]), 3, 3);
  ellipse(x, 700+int(eeg7[x]), 3, 3);
  ellipse(x, 800+int(eeg8[x]), 3, 3);
}
