
class Game {
  // Variables de configuration
  int nombreCiblesValides = 10;
  float probabiliteFausseCible = 0.3;
  int vitesseApparition = 1000;
  int tailleCible = 50;
  int nombreParties = 3;

  // Variables de jeu
  int score;
  int ciblesAtteintes;
  long dernierChangement;
  int partieActuelle;
  boolean estFausseCible;
  boolean cibleVisible;
  float cibleX, cibleY;
  Button menuButton;

  Game() {
    menuButton = new Button(50, 500, 100, 40, "Menu");
    startNewGame();
  }

  void startNewGame() {
    score = 0;
    ciblesAtteintes = 0;
    partieActuelle = 1;
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

    // Interface
    fill(0);
    textAlign(LEFT, TOP);
    text("Score: " + score, 10, 10);
    text("Cibles: " + ciblesAtteintes + "/" + nombreCiblesValides, 10, 40);
    text("Partie: " + partieActuelle + "/" + nombreParties, 10, 70);
    textAlign(CENTER, CENTER);

    // Gestion du timing
    if (millis() - dernierChangement > vitesseApparition) {
      if (ciblesAtteintes < nombreCiblesValides) {
        nouvelleCible();
      }
      dernierChangement = millis();
    }

    menuButton.display();

    // Vérifier fin de partie
    if (ciblesAtteintes >= nombreCiblesValides) {
      finPartie();
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
      missSound.play();
    } else {
      score++;
      hitSound.play();
    }
    cibleVisible = false;
  }
}

  void finPartie() {
    fill(0);
    if (mousePressed) {
      if (partieActuelle < nombreParties) {
        partieActuelle++;
        score = 0;
        ciblesAtteintes = 0;
        cibleVisible = false;
      } else {
        currentState = GameState.MAIN_MENU;
      }
    }
  }
}
