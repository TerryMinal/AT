ArrayList<Ball> Balls = new ArrayList<Ball>(); 
boolean reaction = false;

void setup() {
  size(600, 600); 
  background(0);
  //adds 100 balls
  for (int i = 0; i < 1; i++) {
    Balls.add(new Ball( (int) (random(75)), random(width), random(height), 0, new PVector(random(10), random(10))));
  } 
}//end setup


  void draw() {
    background(0);
   for (Ball x : Balls) {
     x.drawBall();  
   }
  }//end draw
  
  
   void mouseClicked() {
   if (reaction) {
     Balls.add(new Ball((int) random(75), (float) mouseX, (float) mouseY, 1, new PVector(0, 0))); 
     reaction = false;
   }//end mouseClicked
 }
   