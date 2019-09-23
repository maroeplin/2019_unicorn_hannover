//MUSE DATA
let muse_tabelle;
let eeg1, eeg2, eeg3, eeg4, alpha1, alpha2, alpha3, alpha4, beta1, beta2, beta3, beta4, delta1, delta2, delta3, delta4, theta1, theta2, theta3, theta4, gamma1, gamma2, gamma3, gamma4, elements;
let mapEeg1, mapEeg2, mapEeg3, mapEeg4, mapBeta;
let r,ix,y;

let x; //FRAMEZAEHLER
let lastSum; // SUMME LETZTER EEG-WERTE

// AGENT INFO
let i_am_cyan;
let agent_magenta;
let agent_cyan;
let agent_color;
let agent_size;

let blink;

function preload() {
    import_csv();
}

function setup() {

  createCanvas(windowWidth, windowHeight * 0.9);
  background(20, 20, 20);

  blink=true;
  i_am_cyan=true;
  agent_magenta = new Agent(0, !i_am_cyan);
  agent_cyan = new Agent(180, i_am_cyan);
  agent_size = windowHeight / 5;


}


function draw() {
  //COUNTER
  x = x + 1;

  //HINTERGRUND
  noStroke();
  fill(0, 0);
  rect(0, 0, windowWidth, windowHeight);

    print(eeg1[x]);
  // Werte aus der Tabelle auf passende Größen mappen
  if (int(eeg1[x]) <= 1500) { // mit der if-Abfrage werden die Ausreißer ausgefiltert
    mapEeg1 = map(float(eeg1[x]), 500, 1000, 0, 1000);

  }
  if (int(eeg2[x]) <= 1500) {
    mapEeg2 = map(float(eeg2[x]), 500, 1000, 0, 1000);
  }
  if (int(eeg3[x]) <= 1500) {
    mapEeg3 = map(float(eeg3[x]), 500, 1000, 100, 1000);
  }
  if (int(eeg4[x]) <= 1500) {
    mapEeg4 = map(float(eeg4[x]), 500, 1000, 100, 1000);
  }
  mapBeta = map(float(beta1[x]), 0, 1, 100, 800);

  //FORMEN ZEICHNEN
  agent_cyan.rumkreisen();
  agent_cyan.aktivePos();
  agent_magenta.rumkreisen();
  agent_magenta.aktivePos();

  // Geblinzelt?
  //if (elements[x].equals("/muse/elements/blink")) {
  //  blink = !blink;
  //}


  // AM ENDE DER CSV-TABELLE AUFHÖREN
  if (x > 24000) {
    reset();
  }
}

// SKETCH ZURÜCKSETZEN
function reset() {
  background(20, 20, 20);
  x = 0;
  agent_cyan.anfangswinkel = 180;
  agent_magenta.anfangswinkel = 0;
}

function keyPressed() {

  if (key == 'b') {
    blink = !blink;
  }
}


function import_csv() {
  muse_tabelle = loadTable('muse_data_katja.csv', 'csv','header');

  eeg1 = muse_tabelle.getColumn("RAW_TP9");
  eeg2 = muse_tabelle.getColumn("RAW_AF7");
  eeg3 = muse_tabelle.getColumn("RAW_AF8");
  eeg4 = muse_tabelle.getColumn("RAW_TP10");

  alpha1 = muse_tabelle.getColumn("Alpha_TP9");
  alpha2 = muse_tabelle.getColumn("Alpha_AF7");
  alpha3 = muse_tabelle.getColumn("Alpha_AF8");
  alpha4 = muse_tabelle.getColumn("Alpha_TP10");

  beta1 = muse_tabelle.getColumn("Beta_TP9");
  beta2 = muse_tabelle.getColumn("Beta_AF7");
  beta3 = muse_tabelle.getColumn("Beta_AF8");
  beta4 = muse_tabelle.getColumn("Beta_TP10");

  delta1 = muse_tabelle.getColumn("Delta_TP9");
  delta2 = muse_tabelle.getColumn("Delta_AF7");
  delta3 = muse_tabelle.getColumn("Delta_AF8");
  delta4 = muse_tabelle.getColumn("Delta_TP10");

  theta1 = muse_tabelle.getColumn("Theta_TP9");
  theta2 = muse_tabelle.getColumn("Theta_AF7");
  theta3 = muse_tabelle.getColumn("Theta_AF8");
  theta4 = muse_tabelle.getColumn("Theta_TP10");


  gamma1 = muse_tabelle.getColumn("Gamma_TP9");
  gamma2 = muse_tabelle.getColumn("Gamma_AF7");
  gamma3 = muse_tabelle.getColumn("Gamma_AF8");
  gamma4 = muse_tabelle.getColumn("Gamma_TP10");

  elements = muse_tabelle.getColumn("Elements");
}


class Agent {

  constructor(anfWinkel, agent) {

    this.xpos = 0;
    this.ypos = 0;
    this.anfangswinkel = anfWinkel;
    this.winkel = 0;
    this.maxD = windowWidth / 4;
    this.d = windowWidth / 4;

    this.whichAgent = agent;
    this.x_noise = 0;
    this.y_noise = 0;
  }


  rumkreisen() {

    this.xpos = ((this.d + this.x_noise) * cos(radians(this.anfangswinkel + this.winkel)) + windowWidth / 2);
    this.ypos = ((this.d + this.y_noise) * sin(radians(this.anfangswinkel + this.winkel)) + windowHeight / 2);
  }

  aktivePos() {

    print(this.whichAgent);
    // AGENT GREY
    if (this.whichAgent) {

      this.winkel = this.winkel + 0.35;

      if (blink) {

        if (this.d >= 5) {
          this.d = this.d - 5;

          this.x_noise = noise(frameCount * 0.007) * 500;
          this.y_noise = noise(1 + frameCount * 0.007) * 500;
        } else {
          this.d = 0;
          this.x_noise = noise(1 + frameCount * 0.007) * 500;
          this.y_noise = noise(1 + frameCount * 0.007) * 500;
        }
      } else {

        if (this.d <= 500) {
          this.d = this.d + 5;
        } else {
          this.d = 500;
        }
      }
    }

    //// AGENT GREEN
    if (!this.whichAgent) {

      this.winkel = this.winkel + 0.05;

      if (!blink) {

        if (this.d >= 5) {
          this.d = this.d - 5;
          this.x_noise = noise(frameCount * 0.007) * 100;
          this.y_noise = noise(1 + frameCount * 0.007) * 100;
        } else {
          this.d = 0;
          this.x_noise = noise(1 + frameCount * 0.007) * 1;

          this.y_noise = noise(1 + frameCount * 0.007) * 1;

        }
      } else {

        if (this.d <= 500) {
          this.d = this.d + 5;
        } else {
          this.d = 500;
        }
      }
    }



    if (!this.whichAgent) {


      agent_color = color(0,228,232);

      push();
      translate(this.xpos, this.ypos);
      stroke(agent_color, 40);
      strokeWeight(1);
      noFill();
      beginShape();

      strokeWeight(2.5);
       r = map(int(mapEeg1), 50, 100, 0, agent_size) * noise(2 + frameCount * 0.007) * 2;
       ix = map(r * cos(radians(360 / 8) * 1), -1, 1, 0, 2);
       y = map(r * sin(radians(360 / 8) * 1), -1, 1, 0, 2);
      vertex(ix, y);

      r = map(int(mapBeta), 0, 100, 0, agent_size) * noise(2 + frameCount * 0.007) * 2;
      ix = map(r * cos(radians(360 / 8) * 2), -1, 1, 0, 2);
      y = map(r * sin(radians(360 / 8) * 2), -1, 1, 0, 2);
      vertex(ix, y);

      r = map(int(mapEeg2), 50, 100, 0, agent_size) * noise(4 + frameCount * 0.007) * 2;
      ix = map(r * cos(radians(360 / 8) * 3), -1, 1, 0, 2);
      y = map(r * sin(radians(360 / 8) * 3), -1, 1, 0, 2);
      vertex(ix, y);

      r = map(int(mapBeta), 50, 100, 0, agent_size) * noise(5 + frameCount * 0.007) * 2;
      ix = map(r * cos(radians(360 / 8) * 4), -1, 1, 0, 2);
      y = map(r * sin(radians(360 / 8) * 4), -1, 1, 0, 2);
      vertex(ix, y);

      r = map(int(mapEeg3), 50, 100, 0, agent_size) * noise(2 + frameCount * 0.007) * 2;
      ix = map(r * cos(radians(360 / 8) * 5), -1, 1, 0, 2);
      y = map(r * sin(radians(360 / 8) * 5), -1, 1, 0, 2);
      vertex(ix, y);

      r = map(int(mapBeta), 0, 100, 0, agent_size) * noise(3 + frameCount * 0.007) * 2;
      ix = map(r * cos(radians(360 / 8) * 6), -1, 1, 0, 2);
      y = map(r * sin(radians(360 / 8) * 6), -1, 1, 0, 2);
      vertex(ix, y);


      r = map(int(mapEeg4), 0, 100, 0, agent_size) * noise(2 + frameCount * 0.006) * 2;
      ix = map(r * cos(radians(360 / 8) * 7), -1, 1, 0, 2);
      y = map(r * sin(radians(360 / 8) * 7), -1, 1, 0, 2);
      vertex(ix, y);

      r = map(int(mapBeta), 0, 100, 0, agent_size) * noise(+frameCount * 0.007) * 2;
      ix = map(r * cos(radians(360 / 8) * 8), -1, 1, 0, 2);
      y = map(r * sin(radians(360 / 8) * 8), -1, 1, 0, 2);
      vertex(ix, y);


      endShape(CLOSE);

      pop();
    }

    if (this.whichAgent) {
      agent_color = color(93,26,117); //magenta

      push();
      translate(this.xpos, this.ypos);

      stroke(agent_color, 40);
      strokeWeight(1);
      noFill();
      beginShape();
      //  curveVertex(0, 0);


       r = map(int(mapEeg1), 50, 100, 0, agent_size) * noise(2 + frameCount * 0.007) * 2;
       ix = map(r * cos(radians(360 / 8) * 1), -1, 1, 0, 2);
       y = map(r * sin(radians(360 / 8) * 1), -1, 1, 0, 2);
      vertex(ix, y);

      r = map(int(mapBeta), 0, 100, 0, agent_size) * noise(2 + frameCount * 0.007) * 4;
      ix = map(r * cos(radians(360 / 8) * 2), -1, 1, 0, 2);
      y = map(r * sin(radians(360 / 8) * 2), -1, 1, 0, 2);
      vertex(ix, y);

      r = map(int(mapEeg2), 50, 100, 0, agent_size) * noise(3 + frameCount * 0.007) * 2;
      ix = map(r * cos(radians(360 / 8) * 3), -1, 1, 0, 2);
      y = map(r * sin(radians(360 / 8) * 3), -1, 1, 0, 2);
      vertex(ix, y);

      r = map(int(mapBeta), 50, 100, 0, agent_size) * noise(5 + frameCount * 0.017) * 2;
      ix = map(r * cos(radians(360 / 8) * 4), -1, 1, 0, 2);
      y = map(r * sin(radians(360 / 8) * 4), -1, 1, 0, 2);
      vertex(ix, y);

      r = map(int(mapEeg3), 50, 100, 0, agent_size) * noise(5 + frameCount * 0.005) * 2;
      ix = map(r * cos(radians(360 / 8) * 5), -1, 1, 0, 2);
      y = map(r * sin(radians(360 / 8) * 5), -1, 1, 0, 2);
      vertex(ix, y);

      r = map(int(mapBeta), 0, 100, 0, agent_size) * noise(3 + frameCount * 0.007) * 2;
      ix = map(r * cos(radians(360 / 8) * 6), -1, 1, 0, 2);
      y = map(r * sin(radians(360 / 8) * 6), -1, 1, 0, 2);
      vertex(ix, y);


      r = map(int(mapEeg4), 0, 100, 0, agent_size) * noise(3 + frameCount * 0.005) * 2;
      ix = map(r * cos(radians(360 / 8) * 7), -1, 1, 0, 2);
      y = map(r * sin(radians(360 / 8) * 7), -1, 1, 0, 2);
      vertex(ix, y);

      r = map(int(mapBeta), 0, 100, 0, agent_size) * noise(+frameCount * 0.007) * 2;
      ix = map(r * cos(radians(360 / 8) * 8), -1, 1, 0, 2);
      y = map(r * sin(radians(360 / 8) * 8), -1, 1, 0, 2);
      vertex(ix, y);

      endShape(CLOSE);
      fill(255);
    //  ellipse(ix, y, 20, 20);
      pop();
    }
  }
}
