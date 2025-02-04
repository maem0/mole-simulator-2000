


class MainMenu {
  Button playButton;
  Button optionsButton;
  Button quitButton;
  
  MainMenu() {
    float buttonWidth = 200;
    float buttonHeight = 50;
    float centerX = width/2 - buttonWidth/2;
    
    playButton = new Button(10, 250, buttonWidth, buttonHeight, "Jouer");
    optionsButton = new Button(10, 320, buttonWidth, buttonHeight, "Options");
    quitButton = new Button(10, 390, buttonWidth, buttonHeight, "Quitter");
  }
  
  void display() {
    // Titre
    fill(0);
    textSize(40);
    text("Mole simulator 2000", 200, 150);
    textSize(20);
    
    // Boutons
    playButton.display();
    optionsButton.display();
    quitButton.display();
  }
  
  void mousePressed() {
    if (playButton.isHovered()) {
      currentState = GameState.LEVEL_SELECT;
      game.startNewGame();
    }
    else if (optionsButton.isHovered()) {
      currentState = GameState.OPTIONS;
    }
    else if (quitButton.isHovered()) {
      exit();
    }
  }
}
