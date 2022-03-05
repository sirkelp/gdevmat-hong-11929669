Walker me = new Walker();
Walker[] walkers = new Walker[100];
int frame = 0;

PVector mousePos(){
   float x = mouseX - Window.windowWidth;
   float y = -(mouseY - Window.windowHeight);
   return new PVector(x, y);
}

void initializeValues(){
  for (int i = 0; i < 100; i++) {
    walkers[i] = new Walker();
    walkers[i].gaussian();
  }
  
  me.whiteHole();
}

void setup() {
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  background(0);
  initializeValues();
}

void draw() {   
  ///////Follow Mouse//////////////////////
  //PVector mouse = mousePos();
  //Walker me = new Walker(mouse.x, mouse.y, 50);
  
  frame++;
  println(frame);
  
  background(0);
  
  for (int i = 0; i < 100; i++) {
    walkers[i].randomFillRender();
    PVector direction = PVector.sub(me.position, walkers[i].position);
    walkers[i].position.add(direction.normalize().mult(10));
    
    if(frame % 300 == 1) {
      initializeValues();
    }
  }
  
  me.regularRender();
}
