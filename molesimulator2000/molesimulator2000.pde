
void setup() {
  size(1000, 700); // Taille de la fenêtre
    x = 100; y = 100; // Position initiale du carré
  rect(x, y, 50, 50); // Dessiner un carré
  t = millis(); // Enregistrer le temps actuel
}

void draw() {
  game();
}
