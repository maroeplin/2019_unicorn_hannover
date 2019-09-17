// IMPORT VON MUSE DATEN UND SPEICHERN VON DIESEN DATEN ALS VARIABLEN


boolean  jaw=false;

void oscEvent(OscMessage theOscMessage) {

  Object[] obj = theOscMessage.arguments();

  //Gyroscope  
  if (theOscMessage.addrPattern().equals("/muse/gyro")) {

    float gyro_x = parseFloat(obj[0].toString()); // x
    float gyro_y = parseFloat(obj[1].toString()); // y
    float gyro_z = parseFloat(obj[2].toString()); // z

    gyro = new PVector(gyro_x, gyro_y, gyro_z);
  }

  //Accelerometer  
  if (theOscMessage.addrPattern().equals("/muse/acc")) {

    float acc_x = parseFloat(obj[0].toString()); // x
    float acc_y = parseFloat(obj[1].toString()); // y
    float acc_z = parseFloat(obj[2].toString()); // z
    acc = new PVector(acc_x, acc_y, acc_z);
  }

  if (theOscMessage.addrPattern().equals("/muse/elements/blink")) {

   // println("BLINKKKK");

    //bc= color(random(0, 255), random(0, 255), random(0, 255));
  } 

  if (theOscMessage.addrPattern().equals("/muse/elements/jaw_clench") && dist(snack.xpos, snack.ypos, x, y) <= 50) {
     snack.new_position();
     score=score+1;
  } 


  //  if (theOscMessage.addrPattern().equals("/Marker/1")) {

  //    i = parseInt(obj[0].toString()); // x
  //} 

  if (theOscMessage.addrPattern().equals("/Marker/2")) {

    i = parseInt(obj[0].toString()); // x
  } 

  if (theOscMessage.addrPattern().equals("/Marker/3")) {

    i = parseInt(obj[0].toString()); // x
  }
}