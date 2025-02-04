class Gameover {
  Button backButton;
  Gameover() {
    backButton = new Button(50, 500, 100, 40, "Retour");
  }
  void display() {
    fill(0);
    text("Game Over", width/2, 100);
    backButton.display();
  }
  void mousePressed() {
    if (backButton.isHovered()) {
      currentState = GameState.MAIN_MENU;
    }
  }
}
