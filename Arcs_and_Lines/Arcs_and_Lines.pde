//look up chalk, chalkboard texture
//make catalog of shapes 1-20
//not-straight function
//make catalog
//// if j>i(i, j)
//MAKE LESS EXPENSIVE, CALCULATE ALL COMBINATIONS, THEN DRAW

int lnwt = 3;
CrookedLine [] cls, clsd;
int cellsz = 65;
int numcrklns = 7;
int crklnct = 0;
PVector []dpts;
PVector []dptsd;
int celct = 0;
int [][] combos;



void setup() {
  size(1280, 720);
  smooth();
  cls = new CrookedLine[numcrklns];
  clsd = new CrookedLine[numcrklns];
  for (int i=0; i<cls.length; i++) {
    cls[i] = new CrookedLine(0, 0, 0, cellsz, ceil(random(4)), 14);
    clsd[i] = new CrookedLine(0, 0, cellsz, cellsz, ceil(random(4)), 14);
  }
  dpts = dashed(0, 0, 0, cellsz, 14);
  dptsd = dashed(0, 0, cellsz, cellsz, 16);
  combos = new int[190][2];
  for (int i=0; i<20; i++) {
    for (int j=0; j<20; j++) {
      if (j>i) {
        combos[celct][0] = i+1;
        combos[celct][1] = j+1;
        println(combos.length);
        celct++;
      }
    }
  }
}

void draw() {
  background(0);
  for(int i=0;i<combos.length;i++){
  arcsAndLines(5+((i%19)*cellsz), 5+(cellsz*floor(i/19.0)), cellsz, 0, combos[i][0], combos[i][1]);
 // arcsAndLines(70, 5, cellsz, 0, combos[1][0], combos[1][1]);
  }
}

void arcsAndLines(int x, int y, int sz, int bb, int s1, int s2) {
  noFill();

  //Bounding box
  if (bb==1) {
    stroke(255, 165, 0);
    strokeWeight(1);
    rectMode(CORNER);
    rect(x, y, sz, sz);
    ellipse(x+(sz/2), y, 3, 3);
    ellipse(x+(sz/2), y+sz, 3, 3);
    ellipse(x, y+(sz/2), 3, 3);
    ellipse(x+sz, y+(sz/2), 3, 3);
  }

  //Shape 1
  switch(s1) {

  case 1:
    stroke(255);
    strokeWeight(lnwt);
    ellipseMode(CENTER);
    arc(x, y+sz, sz*2, sz*2, -HALF_PI, 0);
    break;

  case 2:
    stroke(255);
    strokeWeight(lnwt);
    ellipseMode(CENTER);
    arc(x, y, sz*2, sz*2, 0, HALF_PI);
    break;

  case 3:
    stroke(255);
    strokeWeight(lnwt);
    ellipseMode(CENTER);
    arc(x+sz, y, sz*2, sz*2, HALF_PI, PI);
    break;

  case 4:
    stroke(255);
    strokeWeight(lnwt);
    ellipseMode(CENTER);
    arc(x+sz, y+sz, sz*2, sz*2, -PI, -HALF_PI);
    break;

  case 5:
    stroke(255);
    strokeWeight(lnwt);
    ellipseMode(CENTER);
    arc(x-(sz/2.66667), y+(sz/2), sz*2, sz*2, -0.16667*PI, 0.16667*PI);
    break;

  case 6:
    stroke(255);
    strokeWeight(lnwt);
    ellipseMode(CENTER);
    arc(x+(sz/2), y-(sz/2.66667), sz*2, sz*2, HALF_PI - (0.16667*PI), HALF_PI + (0.16667*PI) );
    break;

  case 7:
    stroke(255);
    strokeWeight(lnwt);
    ellipseMode(CENTER);
    arc( x+sz+(sz/2.66667), y+(sz/2), sz*2, sz*2, PI - (0.16667*PI), PI + (0.16667*PI) );
    break;

  case 8:
    stroke(255);
    strokeWeight(lnwt);
    ellipseMode(CENTER);
    arc( x+(sz/2), y+sz+(sz/2.66667), sz*2, sz*2, -HALF_PI - (0.16667*PI), -HALF_PI + (0.16667*PI) );
    break;

  case 9:
    stroke(255);
    strokeWeight(lnwt);
    line( x+(sz/2), y, x+(sz/2), y+sz );
    break;

  case 10:
    stroke(255);
    strokeWeight(lnwt);
    line( x, y+(sz/2), x+sz, y+(sz/2) );
    break;

  case 11:
    stroke(255);
    strokeWeight(lnwt);
    line( x+sz, y, x, y+sz );
    break;

  case 12:
    stroke(255);
    strokeWeight(lnwt);
    line( x, y, x+sz, y+sz );
    break;

  case 13:
    stroke(255);
    strokeWeight(lnwt);
    cls[0].drw(x+(sz/2), y, 0); //find a way to make this variable
    break;

  case 14:
    stroke(255);
    strokeWeight(lnwt);
    cls[1].drw(x, y+(sz/2.0), -90.0); //find a way to make this variable
    break;

  case 15:
    stroke(255);
    strokeWeight(lnwt);
    clsd[0].drw(x+sz, y, 90.0); //find a way to make this variable
    break;

  case 16:
    stroke(255);
    strokeWeight(lnwt);
    clsd[3].drw(x, y, 0.0); //find a way to make this variable
    break;

  case 17:
    stroke(255);
    strokeWeight(lnwt);
    pushMatrix();
    translate(x+(sz/2), y);
    for (int i=0; i<dpts.length-1; i+=2) {
      line(dpts[i].x, dpts[i].y, dpts[i+1].x, dpts[i+1].y);
    }
    popMatrix();
    break;

  case 18:
    stroke(255);
    strokeWeight(lnwt);
    pushMatrix();
    translate(x+sz, y+sz/2);
    rotate(radians(90));
    for (int i=0; i<dpts.length-1; i+=2) {
      line(dpts[i].x, dpts[i].y, dpts[i+1].x, dpts[i+1].y);
    }
    popMatrix();
    break;

  case 19:
    stroke(255);
    strokeWeight(lnwt);
    pushMatrix();
    translate(x+sz, y);
    rotate(radians(90));
    for (int i=0; i<dptsd.length-1; i+=2) {
      line(dptsd[i].x, dptsd[i].y, dptsd[i+1].x, dptsd[i+1].y);
    }
    popMatrix();
    break;

  case 20:
    stroke(255);
    strokeWeight(lnwt);
    pushMatrix();
    translate(x+sz, y);
    rotate(radians(90));
    for (int i=0; i<dptsd.length-1; i+=2) {
      line(dptsd[i].x, dptsd[i].y, dptsd[i+1].x, dptsd[i+1].y);
    }
    popMatrix();
    break;
  }

  //Shape 2
  switch(s2) {

  case 1:
    stroke(255);
    strokeWeight(lnwt);
    ellipseMode(CENTER);
    arc(x, y+sz, sz*2, sz*2, -HALF_PI, 0);
    break;

  case 2:
    stroke(255);
    strokeWeight(lnwt);
    ellipseMode(CENTER);
    arc(x, y, sz*2, sz*2, 0, HALF_PI);
    break;

  case 3:
    stroke(255);
    strokeWeight(lnwt);
    ellipseMode(CENTER);
    arc(x+sz, y, sz*2, sz*2, HALF_PI, PI);
    break;

  case 4:
    stroke(255);
    strokeWeight(lnwt);
    ellipseMode(CENTER);
    arc(x+sz, y+sz, sz*2, sz*2, -PI, -HALF_PI);
    break;

  case 5:
    stroke(255);
    strokeWeight(lnwt);
    ellipseMode(CENTER);
    arc(x-(sz/2.66667), y+(sz/2), sz*2, sz*2, -0.16667*PI, 0.16667*PI);
    break;

  case 6:
    stroke(255);
    strokeWeight(lnwt);
    ellipseMode(CENTER);
    arc(x+(sz/2), y-(sz/2.66667), sz*2, sz*2, HALF_PI - (0.16667*PI), HALF_PI + (0.16667*PI) );
    break;

  case 7:
    stroke(255);
    strokeWeight(lnwt);
    ellipseMode(CENTER);
    arc( x+sz+(sz/2.66667), y+(sz/2), sz*2, sz*2, PI - (0.16667*PI), PI + (0.16667*PI) );
    break;

  case 8:
    stroke(255);
    strokeWeight(lnwt);
    ellipseMode(CENTER);
    arc( x+(sz/2), y+sz+(sz/2.66667), sz*2, sz*2, -HALF_PI - (0.16667*PI), -HALF_PI + (0.16667*PI) );
    break;

  case 9:
    stroke(255);
    strokeWeight(lnwt);
    line( x+(sz/2), y, x+(sz/2), y+sz );
    break;

  case 10:
    stroke(255);
    strokeWeight(lnwt);
    line( x, y+(sz/2), x+sz, y+(sz/2) );
    break;

  case 11:
    stroke(255);
    strokeWeight(lnwt);
    line( x+sz, y, x, y+sz );
    break;

  case 12:
    stroke(255);
    strokeWeight(lnwt);
    line( x, y, x+sz, y+sz );
    break;

  case 13:
    stroke(255);
    strokeWeight(lnwt);
    cls[0].drw(x+(sz/2), y, 0); //find a way to make this variable
    break;

  case 14:
    stroke(255);
    strokeWeight(lnwt);
    cls[1].drw(x, y+(sz/2.0), -90.0); //find a way to make this variable
    break;

  case 15:
    stroke(255);
    strokeWeight(lnwt);
    clsd[0].drw(x+sz, y, 90.0); //find a way to make this variable
    break;

  case 16:
    stroke(255);
    strokeWeight(lnwt);
    clsd[3].drw(x, y, 0.0); //find a way to make this variable
    break;

  case 17:
    stroke(255);
    strokeWeight(lnwt);
    pushMatrix();
    translate(x+(sz/2), y);
    for (int i=0; i<dpts.length-1; i+=2) {
      line(dpts[i].x, dpts[i].y, dpts[i+1].x, dpts[i+1].y);
    }
    popMatrix();
    break;

  case 18:
    stroke(255);
    strokeWeight(lnwt);
    pushMatrix();
    translate(x+sz, y+sz/2);
    rotate(radians(90));
    for (int i=0; i<dpts.length-1; i+=2) {
      line(dpts[i].x, dpts[i].y, dpts[i+1].x, dpts[i+1].y);
    }
    popMatrix();
    break;

  case 19:
    stroke(255);
    strokeWeight(lnwt);
    pushMatrix();
    translate(x+sz, y);
    rotate(radians(90));
    for (int i=0; i<dptsd.length-1; i+=2) {
      line(dptsd[i].x, dptsd[i].y, dptsd[i+1].x, dptsd[i+1].y);
    }
    popMatrix();
    break;

  case 20:
    stroke(255);
    strokeWeight(lnwt);
    pushMatrix();
    translate(x+sz, y);
    rotate(radians(90));
    for (int i=0; i<dptsd.length-1; i+=2) {
      line(dptsd[i].x, dptsd[i].y, dptsd[i+1].x, dptsd[i+1].y);
    }
    popMatrix();
    break;
  }
}


//COMMENT THIS

PVector[] dashed(int x1, int y1, int x2, int y2, int steps) {

  PVector[] pts = new PVector[steps];

  for (int i = 0; i < steps; i++) {
    float x = lerp(x1, x2, i/float(steps)) ;
    float y = lerp(y1, y2, i/float(steps));
    pts[i] = new PVector(x, y);
  }
  return pts;
}


class CrookedLine {
  int x1, y1, x2, y2, numpts;
  float w;
  PVector start, dir, end, pp1;
  PVector[] pts;
  float[] segs;


  CrookedLine(int ax1, int ay1, int ax2, int ay2, int anumpts, float aw) {

    x1 = ax1;
    y1 = ay1;
    x2 = ax2;
    y2 = ay2;
    numpts = anumpts;
    w = aw;

    start = new PVector(x1, y1);
    dir = new PVector(x2, y2);
    end = PVector.add(start, dir);
    pts= new PVector[numpts];

    pp1 = new PVector(dir.y, -dir.x);
    pp1.normalize();
    pp1.mult(w/2.0);

    segs = new float[numpts];
    for (int i=0; i<segs.length; i++) {
      segs[i] = random(0.10, 0.9);
    }
    segs = sort(segs);

    for (int i=0; i<numpts; i++) {
      pts[i] = PVector.add( start, PVector.mult( dir, segs[i] ));
      pts[i] = PVector.add( pts[i], PVector.mult( pp1, random(-1.0, 1.0) ) );
    }
  }

  void drw(float locx, float locy, float deg) {
    noFill();
    pushMatrix();
    translate(locx, locy);
    rotate(radians(deg));
    beginShape();
    curveVertex(start.x, start.y);
    curveVertex(start.x, start.y);
    for (int i=0; i<pts.length; i++) {
      curveVertex(pts[i].x, pts[i].y);
    }
    curveVertex(end.x, end.y);
    curveVertex(end.x, end.y);
    endShape();

    popMatrix();
  }
}

