int redValue;
int greenValue;
int blueValue;
int alphaValue;
color random;
int frame = 0;

void setup(){
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(0);
}

void draw(){
  frame++;
  println(frame);
  
  if (frame % 300 == 1) background(0);
  
  redValue = int(random(256));
  greenValue = int(random(256));
  blueValue = int(random(256));
  alphaValue = 10 + int(random(91));
  
  random = color (redValue, greenValue, blueValue, alphaValue);
  
  float gaussian = randomGaussian();
  //println(gaussian);
  
  float standardDeviation = 500;
  float mean = 0;
  float x = standardDeviation * gaussian + mean;
  float y = random(-360, 360);
  
  float gaussian2 = randomGaussian();
  float standardDeviation2 = 30;
  float mean2 = 10;
  float scale = standardDeviation2 * gaussian2 + mean2;
  
  fill(random);
  noStroke();
  circle(x, y, scale);
}
