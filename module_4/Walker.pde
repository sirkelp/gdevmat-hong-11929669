public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();

  public float velocityLimit, scale;
  
  public Walker(){
    velocityLimit = 10;
  }
  
  public void update(PVector direction) {   
    direction.normalize();
    this.acceleration = direction;
    this.velocity.add(this.acceleration.mult(0.2));
    this.velocity.limit(velocityLimit);
    this.position.add(velocity);   
  }
  
  public void render() {
    fill(200, 50, 50);
    noStroke();
    circle(position.x, position.y, scale);
  }
  
  public void checkEdges() {
     if (this.position.x > Window.right) {
      this. position.x = Window.left; 
     }
     else if (this.position.x < Window.left) {
      this.position.x = Window.right; 
     }
     
     if (this.position.y > Window.top) {
      this. position.y = Window.bottom; 
     }
     else if (this.position.y < Window.bottom) {
      this.position.y = Window.top; 
     }
   }
   
   void randomPos(){
     position.x = int(random(-500, 500));
     position.y = int(random(-320, 320));
     scale = int(random(10, 30));
   }
}
