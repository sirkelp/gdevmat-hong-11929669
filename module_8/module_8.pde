Walker[] bigMatter = new Walker[5];
Walker[] smallMatter = new Walker[5];

void initializeBigMatter(){
  for (int i = 0; i < 5; i++) {  
    float randomX = random(-Window.w, Window.w);
    float randomY = random(-Window.h, Window.h);
    bigMatter[i] = new Walker();
    bigMatter[i].position = new PVector(randomX, randomY);    
    
    bigMatter[i].mass = random(int(20));
    bigMatter[i].scale = bigMatter[i].mass * 15;
  }
}

void initializeSmallMatter(){
  for (int i = 0; i < 5; i++) {  
    float randomX = random(-Window.w, Window.w);
    float randomY = random(-Window.h, Window.h);
    smallMatter[i] = new Walker();
    smallMatter[i].position = new PVector(randomX, randomY);    
    
    smallMatter[i].mass = random(int(10));
    smallMatter[i].scale = bigMatter[i].mass * 15;
  }
}

void setup() {
 size(1280, 720, P3D);
 camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
 
 initializeBigMatter();
 initializeSmallMatter();
 
}

void draw() {
  
  background(255);
  
  for( Walker b : bigMatter) {
    b.update();
    b.render();
    for( Walker s : smallMatter) {
      s.update();
      s.render();
      if (b != s) {
        s.applyForce(b.calculateAttraction(s));
        b.applyForce(s.calculateAttraction(b));
      }
    }
  }
  
  
  
  
  
  
}
