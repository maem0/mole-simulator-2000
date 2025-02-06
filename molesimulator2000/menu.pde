


class MainMenu {
  Button playButton;
  Button optionsButton;
  Button quitButton;
  
  MainMenu() {
    float buttonWidth = 300;
    float buttonHeight = 100;
    float centerX = width/2 - buttonWidth/2;
    
    playButton = new Button(10, 250, buttonWidth, buttonHeight, "Jouer");
    optionsButton = new Button(10, 400, buttonWidth, buttonHeight, "Options");
    quitButton = new Button(10, 550, buttonWidth, buttonHeight, "Quitter");
  }
  
  void display() {
    // Titre
    fill(0);
    textSize(70);
    text("Mole simulator 2000", 300, 150);
    textSize(30);
    
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
