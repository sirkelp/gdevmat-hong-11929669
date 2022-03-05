class walker {
  float x;
  float y;
  int redValue;
  int greenValue;
  int blueValue;
  int alphaValue;
  color random;
  
   void render() {
     redValue = int(random(256));
     greenValue = int(random(256));
     blueValue = int(random(256));
     alphaValue = 50 + int(random(51));
     
     random = color(redValue, greenValue, blueValue, alphaValue);
     
     fill(random);
     noStroke();
     circle(x, y, 30);
   }
   
   void randomWalk(){
    int rng = int(random(8)); //generates random value exclusively of the last number
    
    if (rng == 0) {
      y += 10; //up
    }
    else if (rng == 1) {
      y -= 10; //down
    }
    else if (rng == 2) {
     x += 10; //right
    }
    else if (rng == 3) {
     x -= 10; //left
    }
    else if (rng == 4) {
      y += 5;
      x += 5; //up - right
    }
    else if (rng == 5) {
      y += 5;
      x -= 5; //up - left
    }
    else if (rng == 6) {
      y -= 5;
      x += 5; //down - right
    }
    else if (rng == 7) {
      y -= 5;
      x -= 5; //down - left
    }
   }
   
   void randomWalkBiased(){
    int rng = int(random(10)); //generates random value exclusively of the last number

    if (rng == 0) {
      y += 10; //up
    }
    else if (rng == 1) {
      y -= 10; //down
    }
    else if (rng == 2 || rng == 8 || rng == 9) {
     x += 10; //right
    }
    else if (rng == 3) {
     x -= 10; //left
    }
    else if (rng == 4) {
      y += 5;
      x += 5; //up - right
    }
    else if (rng == 5) {
      y += 5;
      x -= 5; //up - left
    }
    else if (rng == 6) {
      y -= 5;
      x += 5; //down - right
    }
    else if (rng == 7) {
      y -= 5;
      x -= 5; //down - left
    }
   }
}
