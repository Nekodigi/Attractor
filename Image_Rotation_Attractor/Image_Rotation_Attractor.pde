//mesh good can deform without inverse formula,but not good when move a lot.

PImage img;
MeshDeform meshDeform;
// radius of impact
float radius = 100;//500
// strength: positive for attraction, negative for repulsion
float strength = 10;  //400
// parameter that influences the form of the function
float ramp = 0.5;    //// 0.01 - 0.99

void setup(){
  //fullScreen(P3D);
  size(500, 500, P3D);
  img = loadImage("FevCat.png");
  img.resize(400, 400);//reduce resolution for high speed processing
  meshDeform = new MeshDeform(img, new PVector((width-height)/2, 0), new PVector(width-(width-height)/2, height));
  
}

void keyPressed(){
  if(key == 'r'){
    meshDeform.resetCoord();
  }
}

void draw(){
  background(255);
  PVector[][] target = meshDeform.ctrPoss;
  if(mousePressed){
    for(int i=0; i<target[0].length; i++){
      for(int j=0; j<target.length; j++){
        attract(new PVector(mouseX, mouseY), target[i][j]);
      }
    }
  }
  noStroke();
  meshDeform.show();
}
