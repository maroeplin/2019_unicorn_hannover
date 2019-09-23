let tabelle,tabelle2,tabelle3;
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

let eX2=0;
  let eY2=0;

//let button1,button2,button3;

function preload() {
  tabelle = loadTable(
    'UnicornRecorder_vk20190907_222509.csv',
    'csv',
    'header');
  
  tabelle2 = loadTable(
    'UnicornRecorder_20190908_072555.csv',
    'csv',
    'header');
  

}

function setup() {
  createCanvas(windowWidth, windowHeight*0.9);
  background(20, 20, 20);
  var button=createButton("EEG 1");
  var button2=createButton("EEG 2");
  loadTable1();
 
  htg=color(0,0,0);
  button.mousePressed(loadTable1);
  button2.mousePressed(loadTable2);
}


function draw() {
  push();
translate(windowWidth / 2, windowHeight*0.9 / 3);
  
strokeWeight(0);
fill(255, 0, 0);

  
var schlucht = 0; //map(sin(xPos),-1,1,0,width);
  
groesse = xPos * 0.9;

x = x + 1;
  

xPos = map(x, 0, 8000, 30, windowWidth);
  
  
   

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
    stroke(145, 40);
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
pop();
  
  //Buttons
//  noStroke();
  //fill(10,200,100);
  //rect(20,50,160,45);
  //rect(20,120,160,45);

  
drawOriginEEG();
}


function mouseClicked(){
  if(20 <= mouseX &&   mouseX<=180 && 50<=mouseY && mouseY<=95){
    //loadTable1();
  }
  
    if(20 <= mouseX &&   mouseX<=180 && 120<=mouseY && mouseY<=165){

   // loadTable2();
      
  }
}


function drawOriginEEG(){
  
    // EEG Graph
   fill(220);
  noStroke();
  rect(0,windowHeight*0.9-150,windowWidth,windowHeight*0.9);
  push();
  translate(-x,200);
 
  
  for(let i=x;i<(windowWidth/2)+x;i++){
    let eX1=i;
    let eY1=windowHeight*0.9-270 -eeg8[x+i];
  //ellipse(x, 50 + eeg8[x], 3, 3);
  stroke(20);
  line(eX1,eY1,eX2,eY2);
   eX2=eX1;
   eY2=eY1;
  
  }
  eX2=0;
   eY2=0;
  //translate(500-x,0);
  
  pop();

}


function loadTable1(){
  
  eeg1 = tabelle.getColumn('EEG 1'); //
  eeg2 = tabelle.getColumn("EEG 2");
  eeg3 = tabelle.getColumn("EEG 3"); //
  eeg4 = tabelle.getColumn("EEG 4");
  eeg5 = tabelle.getColumn("EEG 5"); //
  eeg6 = tabelle.getColumn("EEG 6");
  eeg7 = tabelle.getColumn("EEG 7"); //
  eeg8 = tabelle.getColumn("EEG 8");
  x=10;
 background(20, 20, 20);
  
}

function loadTable2(){
  eeg1 = tabelle2.getColumn('EEG 1'); //
  eeg2 = tabelle2.getColumn("EEG 2");
  eeg3 = tabelle2.getColumn("EEG 3"); //
  eeg4 = tabelle2.getColumn("EEG 4");
  eeg5 = tabelle2.getColumn("EEG 5"); //
  eeg6 = tabelle2.getColumn("EEG 6");
  eeg7 = tabelle2.getColumn("EEG 7"); //
  eeg8 = tabelle2.getColumn("EEG 8");
  x=10;
  background(20, 20, 20);
}

function loadTable3(){
  eeg1 = tabelle3.getColumn('EEG 1'); //
  eeg2 = tabelle3.getColumn("EEG 2");
  eeg3 = tabelle3.getColumn("EEG 3"); //
  eeg4 = tabelle3.getColumn("EEG 4");
  eeg5 = tabelle3.getColumn("EEG 5"); //
  eeg6 = tabelle3.getColumn("EEG 6");
  eeg7 = tabelle3.getColumn("EEG 7"); //
  eeg8 = tabelle3.getColumn("EEG 8");
}






//MUSE DATA
let muse_tabelle;
let eeg1, eeg2, eeg3, eeg4, alpha1, alpha2, alpha3, alpha4, beta1, beta2, beta3, beta4, delta1, delta2, delta3, delta4, theta1, theta2, theta3, theta4, gamma1, gamma2, gamma3, gamma4, elements ;
let mapEeg1, mapEeg2, mapEeg3, mapEeg4, mapBeta;

let x; //FRAMEZAEHLER 
let lastSum; // SUMME LETZTER EEG-WERTE

// AGENT INFO
let i_am_cyan;
let agent_magenta = new Agent(0, !i_am_cyan);
let agent_cyan = new Agent(180, i_am_cyan);
let agent_color;
let agent_size=height/5;

let blink=false;


function setup() {

  createCanvas(windowWidth, windowHeight*0.9);
  background(20, 20, 20);
  noCursor();

  import_csv();

}


function draw() { 
  //COUNTER
  x=x+1;

  //HINTERGRUND
  noStroke();
  fill(0, 0);
  rect(0, 0, width, height);

  //FORMEN ZEICHNEN
  agent_cyan.rumkreisen();
  agent_cyan.aktivePos();
  agent_magenta.rumkreisen();
  agent_magenta.aktivePos();

  // Werte aus der Tabelle auf passende Größen mappen
  if (int(eeg1[x]) <= 1500) { // mit der if-Abfrage werden die Ausreißer ausgefiltert
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
  mapBeta=map(float(beta1[x]), 0, 1, 100, 800);

  // Geblinzelt?
  if (elements[x].equals("/muse/elements/blink")) {
    blink=!blink;
  }


  // AM ENDE DER CSV-TABELLE AUFHÖREN
  if ( x >24000) {
    reset();
  }
}

// SKETCH ZURÜCKSETZEN
function reset() {
  background(20, 20, 20);
  x=0;
  agent_cyan.anfangswinkel=180;
  agent_magenta.anfangswinkel=0;
}

function keyPressed() {

  if (key == 'b') {
    blink=!blink;
  }
}