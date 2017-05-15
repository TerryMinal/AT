ArrayList<Ball> Balls = new ArrayList<Ball>(); 
boolean reaction = false;

void setup() {
  size(600, 600); 
  background(0);
  //adds 100 balls
  for (int i = 0; i < 30; i++) {
    Balls.add(new Ball( (int) (random(75)), random(width), random(height), 0, new PVector(random(10), random(10))));
  } 
}//end setup


  void draw() {
   background(0);
   for(int x = 0; x < Balls.size(); x++){     
     Ball b = Balls.get(x); 
     b.drawBall();
     if( reaction && x == Balls.size()-1 && !b.getShrinking() ){
       b.grow();       
     }
     if(b.isInCircle() && !b.getShrinking()){
       b.grow(); 
     }
     if( b.getSize() > 300 || b.getShrinking() ){
       b.shrink(); 
       b.setShrinking(true); 
     }
     if(b.getDead()){
       Balls.remove(x); 
     }
   }
  }//end draw
  
  
   void mouseClicked() {
   if (!reaction) {
     reaction = true;
     Ball b = new Ball((int) random(75), (float) mouseX, (float) mouseY, 1, new PVector(0, 0)); 
     Balls.add(b); 
     //b.grow();          
     
   }//end mouseClicked
 }
   
