color white = color(255, 255, 255);
color red = color(255, 0, 0);
color green = color (0, 255, 0);
color blue = color (0, 0, 255);
color yellow = color (255, 255, 0);
color purple = color (230, 0, 250);

int time = 0;

void setup(){
  size(1280, 720, P3D); //sets window size to 1280 x 720 / P3D gives 3D functionality
  camera(0, 0, -(height / 2.0) / tan(PI * 30.0 / 180.0), 0, 0, 0, 0, -1, 0); //sets the camera to the middle to fix the coordinates
}

void draw(){
  background(0); //sets bg color
  
  //circle(0, 0, 15); //Circle function (x, y, extent)
  
  //strokeWeight(2); //Line thickness for the below line
  //color white = color (255, 255, 255);  //declaration of variable
  //fill(white); //fills color
  //stroke(white); //stroke color
  //line (-75, -75, 75, 75); //Line function (x1, y1, x2, y2)
  
  drawCartesianPlane();
  drawLinearFunction();
  drawQuadraticFunction();
  //drawCircle();
  drawSineWave();
  
}

void drawCartesianPlane() {
  strokeWeight(1);
  //color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  line (300, 0, -300, 0); 
  line (0, -300, 0, 300);
  
  for (int i = -300; i <= 300; i += 10) {
   line(i, -2, i, 2);
   line(-2, i, 2, i); 
  }
}  

void drawLinearFunction(){
  /*
    f(x) = x + 2
    Let x be 4, then y = 6 (4, 6)
    Let x be -5, then y = -3 (-5, -3)
  */
  
  fill(purple);
  noStroke();
  
  for (int x = -200; x <= 200; x++) {
    //circle(x, x + 2, 5); //example from video
    circle(-5 * x, x + 30, 5);
  }
 }
 
void drawQuadraticFunction(){
 /*
   f(x) = x^2 + 2x - 5
   Let x be 2, then y = 3
   Let x be -1, then y = -6
 */
  
  fill(yellow);
  stroke(yellow);
  
  for (float x = -300; x <= 300; x += 0.1f) {
    //circle(x * 10, (float)Math.pow(x, 2) + (x * 2) - 5, 5); //example from video
    circle(x * 10, (float)Math.pow(x, 2) - (x * 15) - 3, 5);
  }
  
}

void drawCircle(){
  fill(blue);
  stroke(blue);
  float radius = 50;
  
  for (int x =0; x <= 360; x++) {
   circle((float)Math.cos(x) * radius, (float)Math.sin(x) * radius, 5); 
  }
}

void drawSineWave(){
  fill(red);
  stroke(red);
  float frequency = 10;
  float amplitude = 50;
  
  for (float x = -30; x <= 30; x += 0.1f) {
   circle((x + time) * frequency, (float)Math.sin(x + time) * amplitude, 5); 
  }
}

void mousePressed(){
  time++;
}
