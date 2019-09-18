//class Agent {

//  float xpos;
//  float ypos;
//  float anfangswinkel;
//  float winkel;
//  int maxD=width/3;
//  int d=width/3;
//  int d2=width/3;
//  //float x, y;
//  boolean whichAgent;
//  float x_noise;
//  float y_noise;

//  Agent(float anfWinkel, boolean agent) {
//    anfangswinkel = anfWinkel;
//    d=500;
//    whichAgent =agent;
//  }
//  void rumkreisen() {
//    println(d);
//    fill(255);
//   //  x_noise = noise(frameCount*0.007)*100;
//   //y_noise = noise(1+frameCount*0.007)*100;
//  println(x_noise);
//    xpos=((d+x_noise)*cos(radians( anfangswinkel+ winkel)) + width/2 );
//    ypos=((d+y_noise)*sin(radians( anfangswinkel+ winkel)) + height/2);
//  }

//  void aktivePos() {

//    // AGENT GREY
//    if (whichAgent) {

//      winkel=winkel+0.05;
//      println("WHO " + whichAgent);

//      if (blink) {

//        if (d>=5) {
//          d=d-5;
//           x_noise = noise(frameCount*0.007)*100;
//   y_noise = noise(1+frameCount*0.007)*100;
//        } else {
//          d=0;
//          x_noise=0;
//          y_noise=0;
//        }
//      } else {

//        if (d<=500) {
//          d=d+10;
//        } else {
//          d=500;
//        }
//      }

//      //if (d>=10) {
//      //  d=d-10;
//      //} else {
//      //  d=0;
//      //}
//    }

//    //if (!blink && whichAgent) {
//    //  winkel=winkel+0.25;
//    //  if (d<=maxD) {
//    //    d=d+10;
//    //  } else {
//    //    d=maxD;
//    //  }
//    //}

//    //// AGENT GREEN
//    if (!whichAgent) {

//      winkel=winkel+0.05;
      
//       if (!blink) {

//        if (d>=5) {
//          d=d-5;
//           x_noise = noise(frameCount*0.007)*100;
//   y_noise = noise(1+frameCount*0.007)*100;
//        } else {
//          d=0;
//           x_noise = 0;
//   y_noise = 0;
//        }
//      } else {

//        if (d<=500) {
//          d=d+10;
//        } else {
//          d=500;
//        }
//      }

//    }

//    //if (blink && !whichAgent) {

//    //  winkel=winkel+0.05;
//    //  if (d<=maxD) {
//    //    d=d+10;
//    //  } else {
//    //    d=maxD;
//    //  }
//    //}

//    if (!whichAgent) {
//      pushMatrix();
//      translate(agent_grey.xpos, agent_grey.ypos);
//      //rotateY(radians(90));

//      // translate(mouseX,mouseY);
//      for (Particle p : particles) {

//        // love/hate vector
//        float lovex = 0.0;
//        float lovey = 0.0;

//        for (Particle o : particles) {
//          // do not compare with yourself
//          if (p.id != o.id) {
//            // calculate vector to get distance and direction
//            PVector v = new PVector(o.x-p.x, o.y-p.y);
//            float distance = v.mag();
//            float angle = v.heading();

//            // love!
//            float love = 1.0 / distance;
//            // or hate...
//            if (distance<2.0) love = -love;

//            // mood factor
//            love *= p.moodSimilarity(o);
//            // not too fast!
//            love *= 0.3;

//            // update love vector
//            lovex += love * cos(angle);
//            lovey += love * sin(angle);
//          } 

//          // calculated love vector will be our speed in resultant direction
//          p.dx = lovex;
//          p.dy = lovey;
//        }
//      }

//      // update and draw
//      for (Particle p : particles) {
//        p.update();
//        p.draw();
//      }

//      time += 0.0005;

//      popMatrix();
//    }

//    if (whichAgent) {
//      htg=color(145);

//      pushMatrix();
//      translate(this.xpos, this.ypos);
//      //rotateY(radians(90));
//      //rotate(radians(map(float(beta1[x]), 0, 1, 0, 360)));
//      stroke(htg, 40);
//      strokeWeight(1);
//      //fill(htg,40);
//      noFill();
//      beginShape();
//      //float noiseMax = map(mouseX, 0, width, 1, 5);
//      float noiseMax = 0.3;
//      curveVertex(0, 0);


//      float r = map(int(mapEeg1), 0, 100, 0, groesse);
//      float ix = map(r * cos(radians(360/8)*1), -1, 1, 0, 2);
//      float y = map(r * sin(radians(360/8)*1), -1, 1, 0, 2);
//      vertex(ix, y);

//      r = map(int(mapBeta), 0, 100, 0, groesse);
//      ix = map(r * cos(radians(360/8)*2), -1, 1, 0, 2);
//      y = map(r * sin(radians(360/8)*2), -1, 1, 0, 2);
//      vertex(ix, y);

//      r = map(int(mapEeg2), 0, 100, 0, groesse);
//      ix = map(r * cos(radians(360/8)*3), -1, 1, 0, 2);
//      y = map(r * sin(radians(360/8)*3), -1, 1, 0, 2);
//      vertex(ix, y);

//      r = map(int(mapBeta), 0, 100, 0, groesse);
//      ix = map(r * cos(radians(360/8)*4), -1, 1, 0, 2);
//      y = map(r * sin(radians(360/8)*4), -1, 1, 0, 2);
//      vertex(ix, y);

//      r = map(int(mapEeg3), 0, 100, 0, groesse);
//      ix = map(r * cos(radians(360/8)*5), -1, 1, 0, 2);
//      y = map(r * sin(radians(360/8)*5), -1, 1, 0, 2);
//      vertex(ix, y);

//      r = map(int(mapBeta), 0, 100, 0, groesse);
//      ix = map(r * cos(radians(360/8)*6), -1, 1, 0, 2);
//      y = map(r * sin(radians(360/8)*6), -1, 1, 0, 2);
//      vertex(ix, y);


//      r = map(int(mapEeg4), 0, 100, 0, groesse);
//      ix = map(r * cos(radians(360/8)*7), -1, 1, 0, 2);
//      y = map(r * sin(radians(360/8)*7), -1, 1, 0, 2);
//      vertex(ix, y);

//      r = map(int(mapBeta), 0, 100, 0, groesse);
//      ix = map(r * cos(radians(360/8)*8), -1, 1, 0, 2);
//      y = map(r * sin(radians(360/8)*8), -1, 1, 0, 2);
//      vertex(ix, y);


//      endShape(CLOSE);

//      popMatrix();
//    }
//  }
//}

class Agent {

  float xpos;
  float ypos;
  float anfangswinkel;
  float winkel;
  int maxD=500;
  int d=width/3;
  int d2=width/3;
  //float x, y;
  boolean whichAgent;
  float x_noise;
  float y_noise;

  Agent(float anfWinkel, boolean agent) {
    anfangswinkel = anfWinkel;
    d=500;
    whichAgent =agent;
  }
  void rumkreisen() {
    //println(d);
    fill(255);
    //  x_noise = noise(frameCount*0.007)*100;
    //y_noise = noise(1+frameCount*0.007)*100;
    //println(x_noise);
    xpos=((d+x_noise)*cos(radians( anfangswinkel+ winkel)) + width/2 );
    ypos=((d+y_noise)*sin(radians( anfangswinkel+ winkel)) + height/2);
  }

  void aktivePos() {

    // AGENT GREY
    if (whichAgent) {

      winkel=winkel+0.35;
      //println("WHO " + whichAgent);

      if (blink) {

        if (d>=5) {
          d=d-5;
          print(d);
          x_noise = noise(frameCount*0.007)*100;
          y_noise = noise(1+frameCount*0.007)*100;
        } else {
          d=0;
          x_noise=noise(1+frameCount*0.007)*1;
          ;
          y_noise=noise(1+frameCount*0.007)*1;
          ;
        }
      } else {

        if (d<=500) {
          d=d+5;
        } else {
          d=500;
        }
      }
    }



    //// AGENT GREEN
    if (!whichAgent) {

      winkel=winkel+0.05;

      if (!blink) {

        if (d>=5) {
          d=d-5;
          x_noise = noise(frameCount*0.007)*100;
          y_noise = noise(1+frameCount*0.007)*100;
        } else {
          d=0;
          x_noise=noise(1+frameCount*0.007)*1;;
          y_noise=noise(1+frameCount*0.007)*1;;
        }
      } else {

        if (d<=500) {
          d=d+5;
        } else {
          d=500;
        }
      }
    }

    //if (blink && !whichAgent) {

    //  winkel=winkel+0.05;
    //  if (d<=maxD) {
    //    d=d+10;
    //  } else {
    //    d=maxD;
    //  }
    //}

    if (!whichAgent) {
      //pushMatrix();
      //translate(agent_grey.xpos, agent_grey.ypos);
      ////rotateY(radians(90));

      //// translate(mouseX,mouseY);
      //for (Particle p : particles) {

      //  // love/hate vector
      //  float lovex = 0.0;
      //  float lovey = 0.0;

      //  for (Particle o : particles) {
      //    // do not compare with yourself
      //    if (p.id != o.id) {
      //      // calculate vector to get distance and direction
      //      PVector v = new PVector(o.x-p.x, o.y-p.y);
      //      float distance = v.mag();
      //      float angle = v.heading();

      //      // love!
      //      float love = 1.0 / distance;
      //      // or hate...
      //      if (distance<2.0) love = -love;

      //      // mood factor
      //      love *= p.moodSimilarity(o);
      //      // not too fast!
      //      love *= 0.9;

      //      // update love vector
      //      lovex += love * cos(angle);
      //      lovey += love * sin(angle);
      //    } 

      //    // calculated love vector will be our speed in resultant direction
      //    p.dx = lovex;
      //    p.dy = lovey;
      //  }
      //}

      //// update and draw
      //for (Particle p : particles) {
      //  p.update();
      //  p.draw();
      //}

      //time += 0.0005;

      //popMatrix();
      
      htg=color(#00e4e8);

      pushMatrix();
      translate(this.xpos, this.ypos);
      //rotateY(radians(90));
      //rotate(radians(map(float(beta1[x]), 0, 1, 0, 360)));
      stroke(htg, 40);
      strokeWeight(1);
      //fill(htg,40);
      noFill();
      beginShape();
      //float noiseMax = map(mouseX, 0, width, 1, 5);
      float noiseMax = 0.3;
      curveVertex(0, 0);

      strokeWeight(2.5);
      float r = map(int(mapEeg1), 50, 100, 0, groesse)*noise(2+frameCount*0.007)*2;
      float ix = map(r * cos(radians(360/8)*1), -1, 1, 0, 2);
      float y = map(r * sin(radians(360/8)*1), -1, 1, 0, 2);
      vertex(ix, y);

      r = map(int(mapBeta), 0, 100, 0, groesse) *noise(2+frameCount*0.007)*2;
      ix = map(r * cos(radians(360/8)*2), -1, 1, 0, 2);
      y = map(r * sin(radians(360/8)*2), -1, 1, 0, 2);
      vertex(ix, y);

      r = map(int(mapEeg2), 50, 100, 0, groesse)*noise(4+frameCount*0.007)*2;
      ix = map(r * cos(radians(360/8)*3), -1, 1, 0, 2);
      y = map(r * sin(radians(360/8)*3), -1, 1, 0, 2);
      vertex(ix, y);

      r = map(int(mapBeta), 50, 100, 0, groesse) *noise(5+frameCount*0.007)*2;
      ix = map(r * cos(radians(360/8)*4), -1, 1, 0, 2);
      y = map(r * sin(radians(360/8)*4), -1, 1, 0, 2);
      vertex(ix, y);

      r = map(int(mapEeg3), 50, 100, 0, groesse)*noise(2+frameCount*0.007)*2;
      ix = map(r * cos(radians(360/8)*5), -1, 1, 0, 2);
      y = map(r * sin(radians(360/8)*5), -1, 1, 0, 2);
      vertex(ix, y);

      r = map(int(mapBeta), 0, 100, 0, groesse)*noise(3+frameCount*0.007)*2;
      ix = map(r * cos(radians(360/8)*6), -1, 1, 0, 2);
      y = map(r * sin(radians(360/8)*6), -1, 1, 0, 2);
      vertex(ix, y);


      r = map(int(mapEeg4), 0, 100, 0, groesse)*noise(2+frameCount*0.006)*2;
      ix = map(r * cos(radians(360/8)*7), -1, 1, 0, 2);
      y = map(r * sin(radians(360/8)*7), -1, 1, 0, 2);
      vertex(ix, y);

      r = map(int(mapBeta), 0, 100, 0, groesse)*noise(+frameCount*0.007)*2;
      ix = map(r * cos(radians(360/8)*8), -1, 1, 0, 2);
      y = map(r * sin(radians(360/8)*8), -1, 1, 0, 2);
      vertex(ix, y);


      endShape(CLOSE);

      popMatrix();
    }

    if (whichAgent) {
      htg=color(#ed42a0);

      pushMatrix();
      translate(this.xpos, this.ypos);
      //rotateY(radians(90));
      //rotate(radians(map(float(beta1[x]), 0, 1, 0, 360)));
      stroke(htg, 40);
      strokeWeight(1);
      //fill(htg,40);
      noFill();
      beginShape();
      //float noiseMax = map(mouseX, 0, width, 1, 5);
      float noiseMax = 0.3;
      curveVertex(0, 0);

      strokeWeight(0.5);
      float r = map(int(mapEeg1), 50, 100, 0, groesse)*noise(2+frameCount*0.007)*2;
      float ix = map(r * cos(radians(360/8)*1), -1, 1, 0, 2);
      float y = map(r * sin(radians(360/8)*1), -1, 1, 0, 2);
      curveVertex(ix, y);

      r = map(int(mapBeta), 0, 100, 0, groesse) *noise(2+frameCount*0.007)*4;
      ix = map(r * cos(radians(360/8)*2), -1, 1, 0, 2);
      y = map(r * sin(radians(360/8)*2), -1, 1, 0, 2);
      curveVertex(ix, y);

      r = map(int(mapEeg2), 50, 100, 0, groesse)*noise(3+frameCount*0.007)*2;
      ix = map(r * cos(radians(360/8)*3), -1, 1, 0, 2);
      y = map(r * sin(radians(360/8)*3), -1, 1, 0, 2);
      curveVertex(ix, y);

      r = map(int(mapBeta), 50, 100, 0, groesse) *noise(5+frameCount*0.017)*2;
      ix = map(r * cos(radians(360/8)*4), -1, 1, 0, 2);
      y = map(r * sin(radians(360/8)*4), -1, 1, 0, 2);
      curveVertex(ix, y);

      r = map(int(mapEeg3), 50, 100, 0, groesse)*noise(5+frameCount*0.005)*2;
      ix = map(r * cos(radians(360/8)*5), -1, 1, 0, 2);
      y = map(r * sin(radians(360/8)*5), -1, 1, 0, 2);
      curveVertex(ix, y);

      r = map(int(mapBeta), 0, 100, 0, groesse)*noise(3+frameCount*0.007)*2;
      ix = map(r * cos(radians(360/8)*6), -1, 1, 0, 2);
      y = map(r * sin(radians(360/8)*6), -1, 1, 0, 2);
      curveVertex(ix, y);


      r = map(int(mapEeg4), 0, 100, 0, groesse)*noise(3+frameCount*0.005)*2;
      ix = map(r * cos(radians(360/8)*7), -1, 1, 0, 2);
      y = map(r * sin(radians(360/8)*7), -1, 1, 0, 2);
      curveVertex(ix, y);

      r = map(int(mapBeta), 0, 100, 0, groesse)*noise(+frameCount*0.007)*2;
      ix = map(r * cos(radians(360/8)*8), -1, 1, 0, 2);
      y = map(r * sin(radians(360/8)*8), -1, 1, 0, 2);
      curveVertex(ix, y);


      endShape(CLOSE);

      popMatrix();
    }
  }
}
