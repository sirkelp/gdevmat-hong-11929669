Walker walker = new Walker();
Walker[] objects = new Walker[8];

void initializeValues(){
  for (int i = 0; i < 8; i++) {    
    objects[i] = new Walker();
    objects[i].position.x = -500;
    objects[i].position.y = 2 * (Window.h / 8) * (i - (8 / 2));
    objects[i].mass = 10 - i;
    objects[i].scale = objects[i].mass * 15;
  }
}

PVector calculateFriction(float mew, float norm, PVector velocity) {
    //Friction = -1 * mew * N * v
      PVector friction;
      float m = mew;
      float n = norm;
      float frictionMagnitude = m * n;
      friction = velocity;
      friction.mult(-1);
      friction.normalize();
      friction.mult(frictionMagnitude);
    return friction;
}

void setup()
{
   size(1280, 720, P3D);
   camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

   initializeValues();  
}

void draw() 
{
   background(255);
   noStroke();

  for (Walker w : objects) { 
    
    if (mousePressed == true){
      w.position.x = -500;
      w.applyForce(calculateFriction(0.1f, 1, w.velocity.copy()));
    }
    
    strokeWeight(5);
    color black = color(0, 0, 0, 0);
    stroke(black);
    line(0, -400, 0, 400);
    w.applyForce(calculateFriction(0.1f, 1, w.velocity.copy()));
 
    PVector acceleration = new PVector(0.2, 0);
    w.render();
    w.update();
    //w.applyForce(wind);
    w.applyForce(acceleration);
     
    if (w.position.x >= 0) {
       w.applyForce(calculateFriction(0.4f, 1, w.velocity.copy()));
    }    
  }
}
