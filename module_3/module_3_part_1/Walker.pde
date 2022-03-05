public class Walker {
  PVector position = new PVector();
  PVector speed = new PVector(5, 8);
  float scale = 50;
  float redValue, greenValue, blueValue, alphaValue;
  color random;  
  
  void moveAndBounce(){
      
    // flushes the screen with white background
    background(255);
    
    redValue = int(random(256));
    greenValue = int(random(256));
    blueValue = int(random(256));
    alphaValue = 255;
     
    random = color(redValue, greenValue, blueValue, alphaValue);
    noStroke();   
  
    // add speed to current position
    position.add(speed);
  
    // conditions for bouncing
    if (position.x > Window.right || position.x < Window.left) {
      speed.x *= -1;
      fill(random);
    }
    if (position.y > Window.top || position.y < Window.bottom) {
      speed.y *= -1;
      fill(random);
    }
    
    circle(position.x, position.y, scale);
  }
}
