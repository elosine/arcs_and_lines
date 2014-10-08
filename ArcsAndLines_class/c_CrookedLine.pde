class CrookedLine {
  int x1, y1, x2, y2, numpts;
  float w;
  PVector start, dir, end, pp1;
  PVector[] pts;
  float[] segs;
  PGraphics b;


  CrookedLine(PGraphics argb, int ax1, int ay1, int ax2, int ay2, int anumpts, float aw) {
    b = argb;
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
    b.noFill();
    b.pushMatrix();
    b.translate(locx, locy);
    b.rotate(radians(deg));
    b.beginShape();
    b.curveVertex(start.x, start.y);
    b.curveVertex(start.x, start.y);
    for (int i=0; i<pts.length; i++) {
      b.curveVertex(pts[i].x, pts[i].y);
    }
    b.curveVertex(end.x, end.y);
    b.curveVertex(end.x, end.y);
    b.endShape();

    b.popMatrix();
  }
}

