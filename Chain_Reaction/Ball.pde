class Ball {

  private PVector vec; 
  int size, startingSize;
  float x, y; 
  int state; // 0 = not growing 1 = growing 2 = shrinking
  color c;
  boolean dead; //this ball no longer should interact with anything if true 

  //default constructor
  public Ball() {
    size = startingSize = 0; 
    x = 0; 
    y = 0; 
    vec = new PVector(0, 0);
    state = 0; 
    c = color(0, 0, 0);
  }

  //overload constructor 
  public Ball(int size, float x, float y, int state, PVector vec) {
    this.size = startingSize = size; 
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
    if (state > 0) {
      vec.x = 0; 
      vec.y = 0; //stops mvmt of balls
      grow(); 
      shrink();
    }
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

  public boolean touching(Ball other) {
    float distance = dist(x, y, other.x, other.y) - size/2 - other.size/2; //calculates distance betw 2 circles
    if (distance <= 0)
      return true;
    else 
      return false;
  }

  public void grow() {
    if (state == 1 && frameCount%3 == 0) //grows size every 3 frames
      size += 1;
    if (size >= 2.5 * startingSize) //shrink if its 2.5 times greater than its original size
      state = 2;
  }

  public void shrink() {
    if (size <= 0)
      dead = true; 
    if (state == 2 && frameCount%3 == 0) //shrink every 3 frames
      size -= 1.2;
  }

  //mutator for state
  public int setState(int s) {
   int oldState = state; 
   state = s; 
   return oldState;
  }
  
  //accessor for state var
  public int getState() {
    return state;  
  }
  
  //accessor for dead var 
  public boolean isDead() {
    return dead;
  }
}