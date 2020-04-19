float scale = 10;
float a = 10;
float b = 28;
float c = 8.0 / 3.0;
float dt = 0.01;

float x = 0.01, y, z;

ArrayList<Point> points = new ArrayList<Point>();

void setup(){
  size(600, 600, P3D);
  colorMode(HSB, 360, 100, 100, 100);
}

void draw(){
  background(360);
  float dx = a*(y-x);
  float dy = x*(b-z)-y;
  float dz = x*y-c*z;
  x += dx*dt;
  y += dy*dt;
  z += dz*dt;
  Point pt = new Point(new PVector(x, y, z), color(sin((float)frameCount/10000)*255, 100, 100));
  points.add(pt);
  translate(width/2, height/2, 0);
  rotateX((float)-mouseY/100);
  rotateY((float)-mouseX/100);
  noFill();
  beginShape();
  for (Point p : points){
    stroke(p.col);
    vertex(p.pos.x*scale, p.pos.y*scale, p.pos.z*scale);
  }
  endShape();
}