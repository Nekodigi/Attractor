float scale = 80;
int iter = 10000;
float alpha = 0.009;
float sigma = 0.05;
float mu = -0.801;
float x0=1, y0=1, x, y;

void setup(){
  fullScreen();
  colorMode(HSB, 360, 100, 100);
  background(0);
}

void draw(){
  translate(width/2, height/2);
  stroke(360);
  for(int i = 0; i < iter; i++){
    x = y0 + alpha*y0*(1-sigma*y0*y0)+g1(x0);
    y = -x0 + g1(x);
    x0 = x;
    y0 = y;
    point(x*scale, y*scale);
  }
}

float g1(float tx){
  return mu*x+2*(1-mu)*tx*tx/(1+tx*tx);
}