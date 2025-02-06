class EndlessGame {
  float cibleX, cibleY;
  int score;
  boolean cibleVisible;
  boolean estFausseCible;
  int tailleCible = 50;
  float vitesseActuelle = 1000;
  int ciblesCliquees = 0;
  long dernierChangement;
  Button menuButton;
  float probabiliteFausseCible = 0.3;

  EndlessGame() {
    menuButton = new Button(50, 500, 100, 40, "Menu");
    startGame();
  }

  void startGame() {
    score = 0;
    ciblesCliquees = 0;
    vitesseActuelle = 1000;
    cibleVisible = false;
    dernierChangement = millis();
  }

  void display() {
    if (cibleVisible) {
      if (estFausseCible) {
        fill(255, 0, 0);
      } else {
        fill(0, 255, 0);
      }
      rect(cibleX, cibleY, tailleCible, tailleCible);
    }

    fill(0);
    text("Score: " + score, 10, 10);
    text("Vitesse: " + (1000/vitesseActuelle) + "x", 10, 40);
    menuButton.display();

    if (millis() - dernierChangement > vitesseActuelle) {
      nouvelleCible();
      dernierChangement = millis();
    }
  }

  void nouvelleCible() {
    cibleX = random(0, width - tailleCible);
    cibleY = random(0, height - tailleCible);
    estFausseCible = random(1) < probabiliteFausseCible;
    cibleVisible = true;
  }

  void mousePressed() {
    if (menuButton.isHovered()) {
      currentState = GameState.MAIN_MENU;
      return;
    }

    if (cibleVisible && 
        mouseX >= cibleX && mouseX <= cibleX + tailleCible &&
        mouseY >= cibleY && mouseY <= cibleY + tailleCible) {
      if (estFausseCible) {
        score--;
      } else {
        score++;
        ciblesCliquees++;
        if (ciblesCliquees % 10 == 0) {
          vitesseActuelle *= 0.8; // 20% plus rapide tous les 10 clics
        }
      }
      cibleVisible = false;
    }
  }
}
