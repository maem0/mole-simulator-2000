class ModeChaos {
  float cibleX, cibleY;
  int score;
  boolean cibleVisible;
  boolean estFausseCible;
  float rotation = 0;
  float screenShake = 0;
  float screenRotation = 0;
  color backgroundColor;
  long dernierChangement;
  int vitesseApparition = 1000;
  Button menuButton;
  ArrayList<FakeCible> faussesCibles;
  int tailleCibleMin = 70;
  int tailleCibleMax = 200;
  float currentTaille;
  
  // États des effets
  boolean rotationActive = false;
  boolean shakeActif = false;
  boolean backgroundActif = false;
  boolean ciblesRotatives = false;
  
  class FakeCible {
    float x, y, size, rotation;
    color col;
    
    FakeCible() {
      respawn();
      col = color(random(255), random(255), random(255));
    }
    
void respawn() {
  x = width/2 - width/4 + random(width/2);  // Centre +-5% de la largeur
  y = height/2 - height/4 + random(height/2);  // Centre -+25% de la hauteur
  size = random(tailleCibleMin, tailleCibleMax);
  rotation = random(TWO_PI);
}
    
    void display() {
      pushMatrix();
      translate(x + size/2, y + size/2);
      if (ciblesRotatives) {
        rotate(rotation += 0.02);
      }
      fill(col);
      rect(-size/2, -size/2, size, size);
      popMatrix();
    }
  }

  ModeChaos() {
    menuButton = new Button(50, 500, 100, 40, "Menu");
    faussesCibles = new ArrayList<FakeCible>();
    startGame();
  }

  void startGame() {
    score = 0;
    cibleVisible = false;
    backgroundColor = color(200);
    dernierChangement = millis();
    nouvellesCibles();
  }

  void display() {
    pushMatrix();
    if (rotationActive) {
      translate(width/2, height/2);
      screenRotation += 0.001;
      rotate(screenRotation);
      translate(-width/2, -height/2);
    }
    
    if (shakeActif && screenShake > 0) {
      translate(random(-screenShake, screenShake), random(-screenShake, screenShake));
      screenShake *= 0.9;
    }

    if (backgroundActif && millis() - dernierChangement > 500) {
      backgroundColor = color(random(150, 255), random(150, 255), random(150, 255));
    }
    background(backgroundColor);

    for (FakeCible fake : faussesCibles) {
      fake.display();
    }

    if (cibleVisible) {
      pushMatrix();
      translate(cibleX + currentTaille/2, cibleY + currentTaille/2);
      if (ciblesRotatives) {
        rotation += 0.05;
        rotate(rotation);
      }
      if (estFausseCible) {
        fill(255, 0, 0);
      } else {
        fill(0, 255, 0);
      }
      rect(-currentTaille/2, -currentTaille/2, currentTaille, currentTaille);
      popMatrix();
    }

    popMatrix();

    fill(0);
    text("Score: " + score, 20, 20);
    menuButton.display();

    if (millis() - dernierChangement > vitesseApparition) {
      nouvellesCibles();
      activerEffetsAleatoires();
      dernierChangement = millis();
    }
  }

  void activerEffetsAleatoires() {
    rotationActive = random(1) < 0.3;
    shakeActif = random(1) < 0.3;
    backgroundActif = random(1) < 0.3;
    ciblesRotatives = random(1) < 0.3;
    
    int nombreFaussesCibles = (int)random(2, 6);
    faussesCibles.clear();
    for (int i = 0; i < nombreFaussesCibles; i++) {
      faussesCibles.add(new FakeCible());
    }
  }

  void nouvellesCibles() {
    cibleX = random(0, width - tailleCibleMax);
    cibleY = random(0, height - tailleCibleMax);
    currentTaille = random(tailleCibleMin, tailleCibleMax);
    estFausseCible = random(1) < 0.4;
    cibleVisible = true;
  }

  void mousePressed() {
    if (menuButton.isHovered()) {
      currentState = GameState.MAIN_MENU;
      return;
    }

    float adjustedMouseX = mouseX;
    float adjustedMouseY = mouseY;
    
    if (rotationActive) {
      float tempX = mouseX - width/2;
      float tempY = mouseY - height/2;
      float cos = cos(-screenRotation);
      float sin = sin(-screenRotation);
      adjustedMouseX = tempX * cos - tempY * sin + width/2;
      adjustedMouseY = tempX * sin + tempY * cos + height/2;
    }

    if (cibleVisible && 
        adjustedMouseX >= cibleX && adjustedMouseX <= cibleX + currentTaille &&
        adjustedMouseY >= cibleY && adjustedMouseY <= cibleY + currentTaille) {
      if (estFausseCible) {
        score -= 2;
        //missSound.play();
      } else {
        score += 2;
        //hitSound.play();
      }
      if (shakeActif) screenShake = 20;
      cibleVisible = false;
    }
  }
}
