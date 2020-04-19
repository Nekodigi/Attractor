ArrayList<Agent> agents = new ArrayList<Agent>();
ArrayList<Agent> Nagents = new ArrayList<Agent>();
ArrayList<Agent> sagents = new ArrayList<Agent>();
ArrayList<Agent> Nsagents = new ArrayList<Agent>();
int baseIncreaseRate = 3000;
int baseAgentSpeed = 4;
float flowFieldPow = 0.001;
float flowFieldScale = 0.001;
float speedDecay = 1;
float zoff = 0;

PImage boubleI;
PImage sakuraI;

void setup(){
  fullScreen();
  //size(1000, 1000);
  colorMode(HSB, 360, 100, 100, 100);
  background(360);
  boubleI = loadImage("ca177c09eb82f45c6d42ce00c2f48450.png");
  sakuraI = loadImage("Sakura1.png");
}

void mousePressed(){
  Nsagents.add(createBlackHole(mouseX,mouseY));
  if(key == 'a'){
    Nagents.add(createBlackHole(mouseX,mouseY));
  }
}

void draw(){
  if(frameCount%60==0){
     //Nsagents.add(createBlackHole(mouseX,mouseY));
  }
  
  if(frameCount%100==0){
     Nsagents.add(createBlackHole(random(0, width), random(0, height)));
  }
  zoff+=0.001;
  fill(360, 10);
  rect(0, 0, width, height);
  baseAgentIncrease();
  Nagents = new ArrayList<Agent>();
  Nsagents = new ArrayList<Agent>();
  for(Agent agent: agents){
    noStroke();
    fill(0);
    agent = baseAgentDraw(agent);
    if(agent.x > 0 && agent.x < width && agent.y > 0 && agent.y < height){
      Nagents.add(agent);
    }
  }
  for(Agent agent: sagents){
    noStroke();
    fill(0);
    switch(agent.type){
      case 0:
      float angle = map(noise(agent.x*flowFieldScale, agent.y*flowFieldScale, zoff), 0, 1, 0,8*PI);
      agent.speed.add(new PVector(cos(angle)*0.01, sin(angle)*0.01));
      agent.x += agent.speed.x;
      agent.y += agent.speed.y;
      tint(360);
        image(boubleI, agent.x-agent.size/2, agent.y-agent.size/2, agent.size, agent.size);
        break;
      case 1:
        break;
      
    }
    if(agent.x > 0 && agent.x < width && agent.y > 0 && agent.y < height && agent.size < agent.maxSize){
      Nsagents.add(agent);
    }
  }
  sagents = null;
  sagents = Nsagents;
  agents = null;
  agents = Nagents;
}