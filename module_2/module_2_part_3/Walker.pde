public class Walker {
  public float x , y, scale;
  public float tx = 0, ty = 10000, tScale = 0;
  float redValue, greenValue, blueValue, alphaValue;
  float tRed = 10, tGreen = 20, tBlue = 30;
  color random;
  
  void render(){
    redValue = map(noise(tRed), 0, 1, 0, 255);
    greenValue = map(noise(tGreen),0, 1, 0, 255);
    blueValue = map(noise(tBlue),0, 1, 0, 255);
    alphaValue = 255;
    
    tRed += 0.01f;
    tGreen += 0.01f;
    tBlue += 0.01f;
     
    random = color(redValue, greenValue, blueValue, alphaValue);
     
    fill(random);
    noStroke();   
  }
  
  void perlinWalk(){
    
   x = map(noise(tx), 0, 1, -640, 640);
   y = map(noise(ty), 0, 1, -360, 360);
   
   tx += 0.01f;
   ty += 0.01f;
   
   scale = map(noise(tScale), 0, 1, 5, 150);
  
   tScale += 0.005f;
   
   //circle function moved here so it no longer spawns a random circle at the middle
   circle(x, y, scale);
  }
}
