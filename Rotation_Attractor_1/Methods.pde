void baseAgentIncrease(){
  for(int i = 0; i < (int)random(0, baseIncreaseRate); i++){
    Agent agent = new Agent();
    agent.x = width/2;
    agent.y = height/2;
    agent.speed = new PVector(random(-baseAgentSpeed, baseAgentSpeed), random(-baseAgentSpeed, baseAgentSpeed));
    agent.type = 0;
    agent.size = 15;
    agent.mass = random(0.5, 2);
    agents.add(agent);
  }
}

Agent baseAgentDraw(Agent agent){
  float angle = map(noise(agent.x*flowFieldScale, agent.y*flowFieldScale, zoff), 0, 1, 0,8*PI);
  agent.speed.add(new PVector(cos(angle)*flowFieldPow, sin(angle)*flowFieldPow));
  agent.speed.mult(speedDecay);
  agent.x += agent.speed.x/agent.mass;
  agent.y += agent.speed.y/agent.mass;
  for(Agent Tagent: sagents){
      switch(Tagent.type){
        case 0:
        
          float distance = dist(agent.x, agent.y, Tagent.x, Tagent.y);
          PVector diff = new PVector(Tagent.x - agent.x, Tagent.y - agent.y);
            diff.normalize();
          if(distance < Tagent.maxRange && distance > Tagent.minRange){
            agent.speed.add(diff.mult(0.2).rotate(PI/8));  
            
          }
          else if(distance < Tagent.minRange){
            Tagent.size += 0.00001;
            agent.speed.add(diff.mult(0.5).rotate(PI/2));  
            agent.speed.mult(0.96);
          }
          else if(distance < Tagent.maxRange){
             agent.speed.mult(1/speedDecay);
          }
      }
    }
    //tint(300, 190, 100, 10+agent.speed.mag()*0.1);
    //image(sakuraI, agent.x, agent.y, agent.size*(1+agent.speed.mag()*0.01), agent.size*(1+agent.speed.mag()*0.01));
    fill(150+agent.speed.mag()*4, 190, 100, 10+agent.speed.mag()*0.1);
  rect(agent.x, agent.y, agent.size*(1+agent.speed.mag()*0.01), agent.size*(1+agent.speed.mag()*0.01));
  return agent;
}

Agent createBlackHole(float x, float y){
  Agent agent = new Agent();
  agent.x = x;
  agent.y = y;
  agent.type = 0;
  agent.speed = new PVector();
  agent.size = 10;
  agent.minRange = 400;
  agent.maxRange = 1000;
  agent.maxSize = 100;
  return agent;
}