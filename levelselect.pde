class LevelSelect {
  Button backButton;
  Button[] levelButtons;
  Button endlessButton;
  Button crazyButton;
  String[] levelNames = {"Facile", "Moyen", "Difficile", "Mode Crazy", "Mode Infini"};
  
  LevelSelect() {
    backButton = new Button(50, 500, 100, 40, "Retour");
    levelButtons = new Button[5];
    
    float buttonWidth = 300;
    float buttonHeight = 100;
    float startY = 150;
    
    for (int i = 0; i < 5; i++) {
      levelButtons[i] = new Button(width/2 - buttonWidth/2, startY + (i * 120), 
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
        if (i < 3) {  // Regular levels (Facile, Moyen, Difficile)
          setDifficulty(i);
          currentState = GameState.GAME;
          game.startNewGame();
        } else if (i == 3) {  // Mode Crazy
          currentState = GameState.CHAOS_MODE;
        } else if (i == 4) {  // Mode Infini
          currentState = GameState.ENDLESS;
          endlessGame.startGame();
        }
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
