void menu() {
  fill(76,175,80);
  rect(20,400,250,75);
  fill(76,175,80);
  rect(20,500,250,75);
  fill(76,175,80);
  rect(20,600,250,75);
  fill(231,76,60);
  textSize(100);
  text("MOLE SIMULATOR",20,90);
  text("2000",20,190);
  if (mousePressed) {
    gameState = 1; 
  }
}
