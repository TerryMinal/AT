class Ball {
  
  private PVector vec; 
  int size;
  float x, y; 
  int state; // 0 = not growing 1 = growing -1 = shrinking
  color c; 
  
  boolean shrinking; //this shows that the previous iteration of draw() had began shrinking balls if TRUE
  boolean dead; //this ball no longer should interact with anything if true 
  
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
    //grow(); 
    ellipse(x, y, size, size);
    reflect(); 
    x += vec.x; 
    y += vec.y; 
  }
  
  //mutators and accessors that are needed 
  public int getSize(){
    return size; 
  }
  public boolean getShrinking(){
    return shrinking; 
  }
  public void setShrinking(boolean t){
    shrinking = t; 
  }
  public boolean getDead(){
    return dead; 
  }
  
  
  //reflects balls appropriately
  private void reflect() {
    if (x <= 0 || x >= width)
      vec.x = -vec.x;
     if (y <= 0 || y >= height)
       vec.y = -vec.y; 
  }
  
  private boolean isInCircle() {
    return false; 
  }
  
  public void grow() {
    //state = 1; 
    vec.x = 0; 
    vec.y = 0; 
    size += second()/3;  
  }
  
  public void shrink(){
    //state = -1; 
    size -= second()/2; 
    if(size < 2){
      size = 0; 
      dead = true; 
    }
  }
}
