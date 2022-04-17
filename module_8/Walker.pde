public class Walker 
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 10;
  public float scale; 
  public float mass;
  
  float r, g, b, a;
  color randomColor;
  
  public float gravitationalConstant = 1;
  
  public Walker() {
    //position.x = 0;
    
    r = int(random(256));
    g = int(random(256));
    b = int(random(256));
    a = 100;
    
    randomColor = color(r, g, b, a);
  }
  
  //Newton's Second Law of Motion
  public void applyForce(PVector force) {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f); // force accumulation
  }
  
  //Newton's Third Law of Motion
  public void bounceEdge() {
    if (this.position.x <= Window.left) {
      this.position.x = Window.left;
      this.velocity.x *= -1;
    }
    if (this.position.x >= Window.right) {
      this.position.x = Window.right;
      this.velocity.x *= -1;
    }
    if (this.position.y >= Window.top) {
      this.position.y = Window.top;
      this.velocity.y *= -1;
    }
    if (this.position.y <= Window.bottom) {
      this.position.y = Window.bottom;
      this.velocity.y *= -1;
    }
  }
  
  public void update() {
    this.velocity.add(this.acceleration); //velocity accumulation
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0);
  }
  
  public void render() {
    fill(randomColor);
    noStroke();
    circle(position.x, position.y, scale); 
  }
  
  public PVector calculateAttraction(Walker walker) {
   PVector force = PVector.sub(this.position, walker.position);
   float distance = force.mag();
   force.normalize();
   
   distance = constrain(distance, 5, 25);
   
   float strength = (this.gravitationalConstant * this.mass * walker.mass) / (distance * distance);
   force.mult(strength);
   return force;
   
  }
}
