// IMPORT VON MUSE DATEN UND SPEICHERN VON DIESEN DATEN ALS VARIABLEN
import oscP5.*;
import netP5.*;
OscP5 oscP5;

PVector gyro = new PVector();
PVector acc = new PVector();
boolean  jaw=false;

void oscEvent(OscMessage theOscMessage) {

  Object[] obj = theOscMessage.arguments();


//  // /muse/eeg

//  if (theOscMessage.addrPattern().equals("/muse/eeg")) {

//    float raw_1 = parseFloat(obj[0].toString()); // x
//    float raw_2 = parseFloat(obj[1].toString()); // y
//    float raw_3 = parseFloat(obj[2].toString()); // z
//    float raw_4 = parseFloat(obj[3].toString()); // z


//    //import

//    csv_muse.setFloat(csv_counter, "RAW_TP9", raw_1);
//    csv_muse.setFloat(csv_counter, "RAW_AF7", raw_2);
//    csv_muse.setFloat(csv_counter, "RAW_AF8", raw_3);
//    csv_muse.setFloat(csv_counter, "RAW_TP10", raw_4);
//  }



//if (theOscMessage.addrPattern().equals("/muse/elements/delta_absolute")) {

//    float d_1 = parseFloat(obj[0].toString()); // x
//    float d_2 = parseFloat(obj[1].toString()); // y
//    float d_3 = parseFloat(obj[2].toString()); // z
//    float d_4 = parseFloat(obj[3].toString()); // z

//    //import

//    csv_muse.setFloat(csv_counter, "Delta_TP9", d_1);
//    csv_muse.setFloat(csv_counter, "Delta_AF7", d_2);
//    csv_muse.setFloat(csv_counter, "Delta_AF8", d_3);
//    csv_muse.setFloat(csv_counter, "Delta_TP10", d_4);
//  }
  
//  if (theOscMessage.addrPattern().equals("/muse/elements/theta_absolute")) {

//    float d_1 = parseFloat(obj[0].toString()); // x
//    float d_2 = parseFloat(obj[1].toString()); // y
//    float d_3 = parseFloat(obj[2].toString()); // z
//    float d_4 = parseFloat(obj[3].toString()); // z

//    //import

//    csv_muse.setFloat(csv_counter, "Delta_TP9", d_1);
//    csv_muse.setFloat(csv_counter, "Delta_AF7", d_2);
//    csv_muse.setFloat(csv_counter, "Delta_AF8", d_3);
//    csv_muse.setFloat(csv_counter, "Delta_TP10", d_4);
//  }
  
//  if (theOscMessage.addrPattern().equals("/muse/elements/alpha_absolute")) {

//    float a_1 = parseFloat(obj[0].toString()); // x
//    float a_2 = parseFloat(obj[1].toString()); // y
//    float a_3 = parseFloat(obj[2].toString()); // z
//    float a_4 = parseFloat(obj[3].toString()); // z

//    //import

//    csv_muse.setFloat(csv_counter, "Alpha_TP9", a_1);
//    csv_muse.setFloat(csv_counter, "Alpha_AF7", a_2);
//    csv_muse.setFloat(csv_counter, "Alpha_AF8", a_3);
//    csv_muse.setFloat(csv_counter, "Alpha_TP10", a_4);
//  }
  
//  if (theOscMessage.addrPattern().equals("/muse/elements/beta_absolute")) {

//    float b_1 = parseFloat(obj[0].toString()); // x
//    float b_2 = parseFloat(obj[1].toString()); // y
//    float b_3 = parseFloat(obj[2].toString()); // z
//    float b_4 = parseFloat(obj[3].toString()); // z

//    //import

//    csv_muse.setFloat(csv_counter, "Beta_TP9", b_1);
//    csv_muse.setFloat(csv_counter, "Beta_AF7", b_2);
//    csv_muse.setFloat(csv_counter, "Beta_AF8", b_3);
//    csv_muse.setFloat(csv_counter, "Beta_TP10", b_4);
//  }
  
//    if (theOscMessage.addrPattern().equals("/muse/elements/gamma_absolute")) {

//    float g_1 = parseFloat(obj[0].toString()); // x
//    float g_2 = parseFloat(obj[1].toString()); // y
//    float g_3 = parseFloat(obj[2].toString()); // z
//    float g_4 = parseFloat(obj[3].toString()); // z

//    //import

//    csv_muse.setFloat(csv_counter, "Gamma_TP9", g_1);
//    csv_muse.setFloat(csv_counter, "Gamma_AF7", g_2);
//    csv_muse.setFloat(csv_counter, "Gamma_AF8", g_3);
//    csv_muse.setFloat(csv_counter, "Gamma_TP10", g_4);
//  }
  


//  //Gyroscope  
//  if (theOscMessage.addrPattern().equals("/muse/gyro")) {

//    float gyro_x = parseFloat(obj[0].toString()); // x
//    float gyro_y = parseFloat(obj[1].toString()); // y
//    float gyro_z = parseFloat(obj[2].toString()); // z

//    gyro = new PVector(gyro_x, gyro_y, gyro_z);

//    csv_muse.setFloat(csv_counter, "Gyro_X", gyro_x);
//    csv_muse.setFloat(csv_counter, "Gyro_Y", gyro_y);
//    csv_muse.setFloat(csv_counter, "Gyro_Z", gyro_z);
//  }

//  //Accelerometer  
//  if (theOscMessage.addrPattern().equals("/muse/acc")) {

//    float acc_x = parseFloat(obj[0].toString()); // x
//    float acc_y = parseFloat(obj[1].toString()); // y
//    float acc_z = parseFloat(obj[2].toString()); // z
//    acc = new PVector(acc_x, acc_y, acc_z);
//    println(acc_z);
//    //import

//    csv_muse.setFloat(csv_counter, "Accelerometer_X", acc_x);
//    csv_muse.setFloat(csv_counter, "Accelerometer_Y", acc_y);
//    csv_muse.setFloat(csv_counter, "Accelerometer_Z", acc_z);
//  }

//  if (theOscMessage.addrPattern().equals("/muse/elements/blink")) {

//    //bc= color(random(0, 255), random(0, 255), random(0, 255));
//  } 

//  if (theOscMessage.addrPattern().equals("/muse/elements/jaw_clench")) {
//  } 


  //  if (theOscMessage.addrPattern().equals("/Marker/1")) {

  //    i = parseInt(obj[0].toString()); // x
  //}
}
