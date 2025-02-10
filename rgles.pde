class TutorielMenu {
  Button backButton;
  String[] rules;
  
  TutorielMenu() {
    backButton = new Button(50, 500, 100, 40, "Retour");
    
    rules = new String[] {
      "Comment jouer : ",
      "1. Clique sur la taupe heureuse pour gagner des points",
      "2. Evite la taupe énervée - elle diminue ton score",
      "3. Réussis chaque niveau en frappant les bonnes cibles",
      "4. Réussis les 3 niveaux pour gagner",
      "5. Sois rapide - ils disparaissent ! "
    };
  }
  
  void display() {
    background(bg);  
    
    // Title
    textAlign(CENTER, TOP);
    textSize(32);
    fill(0);
    text("Règles du jeu", width/2, 50);
    
    textAlign(LEFT, TOP);
    textSize(20);
    float yPosition = 120;
    float leftMargin = 50;
    
    for (String rule : rules) {
      text(rule, leftMargin, yPosition);
      yPosition += 40;  
    }
    backButton.display();
  }
  
  void mousePressed() {
    if (backButton.isHovered()) {
      currentState = GameState.MAIN_MENU; 
    }
  }
}
