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
  
  
  

}

function setup() {
  createCanvas(windowWidth, windowHeight);
  background(26, 26, 26);
smooth();
  loadTable1();
 
  htg=color(26,26,26);

 
}


function draw() {

  if (x>1200){
  x=0;
  }

x = x + 1;

  

  background(26, 26, 26);
  drawOriginEEG(eeg8,50);
  drawOriginEEG(eeg1,200);
  drawOriginEEG(eeg2,350);
  drawOriginEEG(eeg7,500);
}

function drawOriginEEG(eegNr,hoehe){

  push();
  translate(-x,hoehe);
 
  for(let i=x;i<(windowWidth)+x;i++){
    let eX1=i;
    let eY1=eegNr[x+i];
    let alpha=map(i,x,(windowWidth/2)+x,0,255);
    stroke(230,alpha);
    line(eX1,eY1,eX2,eY2);
   eX2=eX1;
   eY2=eY1;
  }
  eX2=0;
   eY2=0;
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
 background(26, 26, 26);
  
}

function windowResized() {
    resizeCanvas(windowWidth, windowHeight);
}
