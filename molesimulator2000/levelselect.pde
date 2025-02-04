class LevelSelect {
  Button backButton;
  Button[] levelButtons;
  String[] levelNames = {"Facile", "Moyen", "Difficile"};
  
  LevelSelect() {
    backButton = new Button(50, 500, 100, 40, "Retour");
    levelButtons = new Button[3];
    
    float buttonWidth = 200;
    float buttonHeight = 50;
    float startY = 200;
    
    for (int i = 0; i < 3; i++) {
      levelButtons[i] = new Button(width/2 - buttonWidth/2, startY + (i * 70), 
                                 buttonWidth, buttonHeight, levelNames[i]);
    }
  }
  
  void display() {
    fill(0);
    text("Sélection du niveau", width/2, 100);
    backButton.display();
    
    for (Button btn : levelButtons) {
      btn.display();
    }
  }
  
  void mousePressed() {
    if (backButton.isHovered()) {
      currentState = GameState.MAIN_MENU;
      return;
    }
    
    for (int i = 0; i < levelButtons.length; i++) {
      if (levelButtons[i].isHovered()) {
        setDifficulty(i);
        currentState = GameState.GAME;
        game.startNewGame();
        return;
      }
    }
  }
  
  void setDifficulty(int level) {
    switch(level) {
      case 0: // Facile
        game.vitesseApparition = 1200;
        game.probabiliteFausseCible = 0.2;
        break;
      case 1: // Moyen
        game.vitesseApparition = 800;
        game.probabiliteFausseCible = 0.4;
        break;
      case 2: // Difficile
        game.vitesseApparition = 500;
        game.probabiliteFausseCible = 0.6;
        break;
    }
  }
}
