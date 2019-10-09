/**
 * oscP5sendreceive by andreas schlegel
 * example shows how to send and receive osc messages.
 * oscP5 website at http://www.sojamo.de/oscP5
 */

import oscP5.*;
import netP5.*;
import processing.video.*;

OscP5 oscP5;
NetAddress myRemoteLocation;
color bc= color(170, 170, 170);

int j;

PVector gyro = new PVector();
PVector acc = new PVector();
float b, i;
float circle_y=1000;
float circle_x;
float circle_easing = 0.03;
float x, y;

float old_x;
float old_y;
float old_size;
int score;
PFont myFont;
Food snack = new Food();
Capture cam;

void setup() {
  fullScreen();
  frameRate(25);
  //background(0);

  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this, 5000);
  myRemoteLocation = new NetAddress("192.168.2.108", 5000);
  x=width/2;
  y=height;
  myFont=createFont("Roboto-Regular", 100);
  
  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();     
  }      
}


void draw() {
  fill(bc, 70);
  rect(0, 0, width, height);


  snake();
  snack.place();

  if (dist(snack.xpos, snack.ypos, x, y) <= 50) {
    //snack.new_position();
    snack.glow();

    //if(jaw==true){
    //  snack.new_position();
    //  score=score+1;
    //}
  }
 
  textSize(70);
  fill(255);
  textFont(myFont);
  text(score, 200, 200);
  
  if (cam.available() == true) {
    cam.read();
  }
  pushMatrix();
  
  //scale(0.3);
  translate(  width/6, height/5);
 scale(-1,1);
 scale(0.3);
  image(cam, 0,0);
  filter(GRAY);
  popMatrix();
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);
}

void snake() {

  fill(255);
  //circle_y=circle_y-1;
  circle_y= + map(acc.x, -0.2, 0.2, 0, height);
  circle_x=map(acc.y, -0.5, 0.5, 0, width);
  float circle_size=map(gyro.y, -50, 50, 10, 90);

  float targetX = circle_x;
  float dx = targetX - x;
  x += dx * circle_easing;

  float targetY = circle_y;
  float dy = targetY - y;
  y += dy * circle_easing;

  for (int i = 0; i <= 6; i++) {
    float l_y = lerp(old_y, y, i/6.0);
    float l_x = lerp( old_x, x, i/6.0);
    float l_size = lerp( old_size, circle_size, i/6.0);
    ellipse(l_x, l_y, l_size, l_size);
  }

  old_x=x;
  old_y=y;
  old_size=circle_size;
}
