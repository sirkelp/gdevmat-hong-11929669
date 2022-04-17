Walker[] objects = new Walker[10];

PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector(0, -0.4);

void initializeValues(){
  for (int i = 0; i < 10; i++) {
    objects[i] = new Walker();
    objects[i].mass = 1 + i;
    objects[i].scale = objects[i].mass * 15;
  }
}

void setup()
{
   size(1280, 720, P3D);
   camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
   
   initializeValues(); 
}

void draw() 
{
   background(80);
    
   for (int i = 0; i < 10; i++) {
    objects[i].render();
    objects[i].update();
    objects[i].applyForce(wind);
    objects[i].applyForce(gravity);
    objects[i].bounceEdge();
  }
}
