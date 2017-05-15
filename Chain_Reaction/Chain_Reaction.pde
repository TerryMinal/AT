ArrayList<Ball> Balls = new ArrayList<Ball>(); 
boolean reaction = false;

void setup() {
  size(600, 600); 
  background(0);
  //adds 100 balls
  for (int i = 0; i < 20; i++) { //spawns 20 random balls at random speeds and at random location 
    Balls.add(new Ball( (int) (random(50, 75)), random(width), random(height), 0, new PVector(random(10), random(10))));
  }
}//end setup


void draw() {
  background(0); //erases previously drawn canvas in prepartion for drawing new one
  //updates balls on canvas
  for (int x = 0; x < Balls.size(); x++) {
    Ball b = Balls.get(x); 
    if (reaction && b.getState() != 0) {
      for (int i = 0; i < Balls.size(); i++) {
        //checks each other ball to see if its not itself, if it hasn't grown yet, and if they're touching
        if (i != x && Balls.get(i).getState() == 0 && b.touching(Balls.get(i)))
            Balls.get(i).setState(1);
      }
    } //end of reaction case
    if (b.isDead()) //gets rid of dead balls
      Balls.remove(x);
    b.drawBall(); 
  }
}//end draw


void mouseClicked() {
  if (!reaction) {
    reaction = true;
    Balls.add(new Ball(60, (float) mouseX, (float) mouseY, 1, new PVector(0, 0))); 
  }//end mouseClicked
}