color red = color(255, 0, 0);
color black = color(0);
color white = color(255);

void setup(){
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos(){
   float x = mouseX - Window.windowWidth / 2;
   float y = -(mouseY - Window.windowHeight / 2);
   return new PVector(x, y);
}

void draw() {
   background(130);
   
   PVector mouse = mousePos();
   
   mouse.normalize().mult(300);
   
   strokeWeight(11);
   stroke(red);
   line(0, 0, mouse.x, mouse.y);
   line(0, 0, -mouse.x, -mouse.y);
   
   strokeWeight(5);
   stroke(white);
   line(0, 0, mouse.x, mouse.y);
   line(0, 0, -mouse.x, -mouse.y);
   
   strokeWeight(12);
   stroke(black);
   line(0, 0, mouse.x/5, mouse.y/5);
   line(0, 0, -mouse.x/5, -mouse.y/5);
   
   println(mouse.mag());
}
