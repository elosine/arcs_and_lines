PVector[] dashed(int x1, int y1, int x2, int y2, int steps) {

  PVector[] pts = new PVector[steps+2];
  pts[0] = new PVector(x1, y1);
  pts[pts.length-1] = new PVector(x2, y2);

  for (int i = 1; i <= steps; i++) {
    float x = lerp(x1, x2, i/float(steps)) ;
    float y = lerp(y1, y2, i/float(steps));
    pts[i] = new PVector(x, y);
  }
  return pts;
}
