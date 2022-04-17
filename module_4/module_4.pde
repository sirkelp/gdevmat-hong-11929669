Walker myWalker = new Walker();
Walker[] walkers = new Walker[100];

PVector mousePos(){
   float x = mouseX - Window.w;
   float y = -(mouseY - Window.h);
   return new PVector(x, y);
}

void initializeValues(){
  for (int i = 0; i < 100; i++) {
    walkers[i] = new Walker();
    walkers[i].randomPos();
  }
}

void setup() {
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  initializeValues();
}

void draw() {
  background(80); 
  
  myWalker.position = mousePos();
  
  for (int i = 0; i < 100; i++) {
    PVector direction = PVector.sub(myWalker.position, walkers[i].position);
    walkers[i].update(direction);
    walkers[i].render();
  }
}
