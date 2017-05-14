class Ball {
  
  private PVector vec; 
  int size;
  float x, y; 
  int state; // 0 = not growing 1 = growing 2 = shrinking
  color c; 
  //default constructor
  public Ball() {
    size = 0; 
    x = 0; 
    y = 0; 
    vec = new PVector(0, 0);
    state = 0; 
    c = color(0, 0, 0); 
  }
  
  //overload constructor 
  public Ball(int size, float x, float y, int state, PVector vec) {
   this.size = size; 
   this.x = x; 
   this.y = y;
   this.vec = vec; 
   this.state = state; 
   c = color((int) (random(256)), (int) (random(256)), (int) (random(256))); 
  }
  
  //draws the ellipse and moves it
  public void drawBall() {
    fill(c); 
    noStroke();
    //if (isInCircle())
    grow(); 
    ellipse(x, y, size, size);
    reflect(); 
    x += vec.x; 
    y += vec.y; 
  }
  
  //reflects balls appropriately
  private void reflect() {
    if (x <= 0 || x >= width)
      vec.x = -vec.x;
     if (y <= 0 || y >= height)
       vec.y = -vec.y; 
  }
  
  //private boolean isInCircle() {
  //  if (  
  //}
  
  public void grow() {
    size += second();  
  }
}