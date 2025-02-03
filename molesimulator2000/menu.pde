void menu() {
  textSize(32);
  textAlign(CENTER, CENTER);
  fill(0);
  text("Mole Simulator", width / 2, height / 3);
  textSize(20);
  text("Start", width / 2, height / 2 + 50);
  
  if (mousePressed) {
    gameState = 1; 
  }
}
