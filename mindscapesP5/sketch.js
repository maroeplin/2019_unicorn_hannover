let tabelle;
let eeg1, eeg2, eeg3, eeg4, eeg5, eeg6, eeg7, eeg8;
let x=1;
let xPos = 100;
let test;
let lastSum;
let htg;
let augenZu;
let groesse;

let phase = 0;
let zoff = 0;
let grenze = 13;
let noiseMax;
let r,ix,y;

function preload() {
  tabelle = loadTable(
    'UnicornRecorder_vk20190907_222509.csv',
    'csv',
    'header');
}

function setup() {
  createCanvas(windowWidth, windowHeight);
  eeg1 = tabelle.getColumn('EEG 1'); //
  eeg2 = tabelle.getColumn("EEG 2");
  eeg3 = tabelle.getColumn("EEG 3"); //
  eeg4 = tabelle.getColumn("EEG 4");
  eeg5 = tabelle.getColumn("EEG 5"); //
  eeg6 = tabelle.getColumn("EEG 6");
  eeg7 = tabelle.getColumn("EEG 7"); //
  eeg8 = tabelle.getColumn("EEG 8");
  print(eeg3[1]);
  htg=color(0,0,0);
}


function draw() {
  
translate(windowWidth / 2, windowHeight / 3);
  
strokeWeight(0);
fill(255, 0, 0);

  
var schlucht = 0; //map(sin(xPos),-1,1,0,width);
  
groesse = xPos * 0.9;

x = x + 1;
  

xPos = map(x, 0, 8000, 0, windowWidth);
  
  
   print(x);

if (x > 10) {
 
lastSum=dist(float(eeg8[x]), 0, float(eeg8[x-1]), 0) + dist(float(eeg8[x-1]), 0, float(eeg8[x-2]), 0) +  dist(float(eeg8[x-2]), 0, float(eeg8[x-3]), 0) +  dist(float(eeg8[x-3]), 0, float(eeg8[x-4]), 0) +  dist(float(eeg8[x-4]), 0, float(eeg8[x-5]), 0)  +  dist(float(eeg8[x-5]), 0, float(eeg8[x-6]), 0) +  dist(float(eeg8[x-6]), 0, float(eeg8[x-7]), 0) +  dist(float(eeg8[x-7]), 0, float(eeg8[x-8]), 0) ;


 //print(lastSum);

  if (lastSum < grenze) {
    htg = color(10,200,100);
    test = test - 1;

    stroke(htg, 40);
    strokeWeight(0.5);
    
    noFill();
    beginShape();

    noiseMax = 0.3;
    //curveVertex(0, 0);


     r = map(eeg1[x], -30, 30, 0, groesse);
     ix = map(r * cos(radians(360 / 8) * 1), -1, 1, 0, 2);
     y = map(r * sin(radians(360 / 8) * 1), -1, 1, 0, 2);
    curveVertex(ix + schlucht, y);

    r = map(eeg2[x], -30, 30, 0, groesse);
    ix = map(r * cos(radians(360 / 8) * 2), -1, 1, 0, 2);
    y = map(r * sin(radians(360 / 8) * 2), -1, 1, 0, 2);
    curveVertex(ix + schlucht, y);

    r = map(eeg3[x], -30, 30, 0, groesse);
    ix = map(r * cos(radians(360 / 8) * 3), -1, 1, 0, 2);
    y = map(r * sin(radians(360 / 8) * 3), -1, 1, 0, 2);
    curveVertex(ix + schlucht, y);

    r = map(eeg4[x], -30, 30, 0, groesse);
    ix = map(r * cos(radians(360 / 8) * 4), -1, 1, 0, 2);
    y = map(r * sin(radians(360 / 8) * 4), -1, 1, 0, 2);
    curveVertex(ix + schlucht, y);

    r = map(eeg5[x], -30, 30, 0, groesse);
    ix = map(r * cos(radians(360 / 8) * 5), -1, 1, 0, 2);
    y = map(r * sin(radians(360 / 8) * 5), -1, 1, 0, 2);
    curveVertex(ix + schlucht, y);

    r = map(eeg6[x], -30, 30, 0, groesse);
    ix = map(r * cos(radians(360 / 8) * 6), -1, 1, 0, 2);
    y = map(r * sin(radians(360 / 8) * 6), -1, 1, 0, 2);
    curveVertex(ix + schlucht, y);

    r = map(eeg7[x], -30, 30, 0, groesse);
    ix = map(r * cos(radians(360 / 8) * 7), -1, 1, 0, 2);
    y = map(r * sin(radians(360 / 8) * 7), -1, 1, 0, 2);
    curveVertex(ix + schlucht, y);

    r = map(eeg8[x], -30, 30, 0, groesse);
    ix = map(r * cos(radians(360 / 8) * 8), -1, 1, 0, 2);
    y = map(r * sin(radians(360 / 8) * 8), -1, 1, 0, 2);
    curveVertex(ix + schlucht, y);

    //curveVertex(0, 0);
    endShape(CLOSE);
    
  } else {
    //htg = color(145,145,145);
    test = test + 1;

    push();
    translate(50 + xPos / 2, 50 + xPos / 2);
    stroke(30, 40);
    strokeWeight(1);
    //fill(htg,40);
    noFill();
    beginShape();
    
    noiseMax = 0.3;

     r = map(eeg1[x], -30, 30, 0, groesse);
     ix = map(r * cos(radians(360 / 8) * 1), -1, 1, 0, 2);
     y = map(r * sin(radians(360 / 8) * 1), -1, 1, 0, 2);
    vertex(ix + schlucht, y);

    r = map(eeg2[x], -30, 30, 0, groesse);
    ix = map(r * cos(radians(360 / 8) * 2), -1, 1, 0, 2);
    y = map(r * sin(radians(360 / 8) * 2), -1, 1, 0, 2);
    vertex(ix + schlucht, y);

    r = map(eeg3[x], -30, 30, 0, groesse);
    ix = map(r * cos(radians(360 / 8) * 3), -1, 1, 0, 2);
    y = map(r * sin(radians(360 / 8) * 3), -1, 1, 0, 2);
    vertex(ix + schlucht, y);

    r = map(eeg4[x], -30, 30, 0, groesse);
    ix = map(r * cos(radians(360 / 8) * 4), -1, 1, 0, 2);
    y = map(r * sin(radians(360 / 8) * 4), -1, 1, 0, 2);
    vertex(ix + schlucht, y);

    r = map(eeg5[x], -30, 30, 0, groesse);
    ix = map(r * cos(radians(360 / 8) * 5), -1, 1, 0, 2);
    y = map(r * sin(radians(360 / 8) * 5), -1, 1, 0, 2);
    vertex(ix + schlucht, y);

    r = map(eeg6[x], -30, 30, 0, groesse);
    ix = map(r * cos(radians(360 / 8) * 6), -1, 1, 0, 2);
    y = map(r * sin(radians(360 / 8) * 6), -1, 1, 0, 2);
    vertex(ix + schlucht, y);

    r = map(eeg7[x], -30, 30, 0, groesse);
    ix = map(r * cos(radians(360 / 8) * 7), -1, 1, 0, 2);
    y = map(r * sin(radians(360 / 8) * 7), -1, 1, 0, 2);
    vertex(ix + schlucht, y);

    r = map(eeg8[x], -30, 30, 0, groesse);
    ix = map(r * cos(radians(360 / 8) * 8), -1, 1, 0, 2);
    y = map(r * sin(radians(360 / 8) * 8), -1, 1, 0, 2);
    vertex(ix + schlucht, y);


    endShape(CLOSE);

    pop();
  }
}


stroke(30, 40);

noFill();

fill(100, 100, 100);

phase += 0.003;
zoff += 0.01;

//ellipse(x, 800 + eeg8[x], 3, 3);
}

