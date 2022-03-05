public class Walker 
{
   public PVector position;
   public float scale = 50;
   float redValue, greenValue, blueValue, alphaValue;
   float tRed = 10, tGreen = 20, tBlue = 30;
   color random;
   
   Walker(){
      position = new PVector(); 
   }
   
   Walker(float x, float y)
   {
      position = new PVector(x, y);
   }
   
   Walker(float x, float y, float scale)
   {
      position = new PVector(x, y);
      this.scale = scale;
   }
   
   Walker(PVector position)
   {
      this.position = position; 
   }
   
   Walker(PVector position, float scale)
   {
      this.position = position; 
      this.scale = scale;
   }
   
    
   public void regularRender(){
      fill(255);
      circle(position.x, position.y, scale * 1.5); 
   }
   
   public void randomFillRender(){
      fill(random);
      noStroke();
      circle(position.x, position.y, scale); 
   }
      
   void gaussian(){
      //regular random color
      //redValue = int(random(256));
      //greenValue = int(random(256));
      //blueValue = int(random(256));
      //alphaValue = 40 + int(random(91));
      
      //random = color (redValue, greenValue, blueValue, alphaValue);
      
      //perlin random color
      float randomVal = int(random(256)), randomVal2 = int(random(256)), randomVal3 = int(random(256)),
            randomVal4 = int(random(256)), randomVal5 = int(random(256)), randomVal6 = int(random(256));
      
      redValue = map(noise(tRed), randomVal, randomVal2, 0, 255);
      greenValue = map(noise(tGreen),randomVal3, randomVal4, 0, 255);
      blueValue = map(noise(tBlue),randomVal5, randomVal6, 0, 255);
      alphaValue = 100;
      
      tRed += 0.01f;
      tGreen += 0.01f;
      tBlue += 0.01f;
       
      random = color(redValue, greenValue, blueValue, alphaValue);

      float gaussian = randomGaussian();
      float gaussian2 = randomGaussian();

      float standardDeviation = 500;
      float mean = 0;
      float x = standardDeviation * gaussian + mean;
      float y = random(-360, 360);

      float standardDeviation2 = 20;
      float mean2 = 15;
      float scale = standardDeviation2 * gaussian2 + mean2;
      
      position.x = x;
      position.y = y;
      this.scale = scale;
   }
   
   void whiteHole(){
     position.x = int(random(-500, 500));
     position.y = int(random(-320, 320));
     scale = 50;
   }
}
