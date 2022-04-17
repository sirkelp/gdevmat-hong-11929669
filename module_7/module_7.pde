Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
Walker[] objects = new Walker[10];

void initializeValues(){
  for (int i = 0; i < 10; i++) {    
    objects[i] = new Walker();
    
    objects[i].position.y = 100;
    objects[i].position.x = 2 * (Window.w / 10) * (i - (10 / 2));
    
    objects[i].mass = 10 - i;
    objects[i].scale = objects[i].mass * 15;
  }
}

void setup() {
 size(1280, 720, P3D);
 camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
 
 initializeValues();
 
}


void draw() {
  background(255);
  
  ocean.render();
  
  for (Walker w : objects) {  
    float c = 0.1f;
    float normal = 1;
    float frictionMagnitude = c * normal;
    PVector friction = w.velocity.copy();
    friction.mult(-1).normalize().mult(frictionMagnitude);
    w.applyForce(friction);
    
    PVector wind = new PVector(0.1, 0);
    PVector gravity = new PVector(0, -0.15f * w.mass);
     w.render();
     w.update();
     w.applyForce(wind);
     w.applyForce(gravity);
     w.bounceEdge();
     
     if (ocean.isCollidingWith(w)) {
       PVector dragForce = ocean.calculateDragForce(w);
       w.applyForce(dragForce);
     }
  }
}
