int x, y, cible = 0, t, score = 0, Temps = 2000, xlargeur = 350, yhauteur = 10, couleur;

void game() {

  // Si une cible a été touchée
  if (cible == 1) { 
    background(255); // Effacer l'écran
    // Position aléatoire pour la nouvelle cible
    x = 50 + int(random(1, 300)); 
    y = 50 + int(random(1, 300));
    couleur = int(random(0, 2)); // Choisir une couleur aléatoire

    // Choisir la couleur en fonction de la valeur aléatoire
    fill(couleur == 0 ? color(0, 255, 0) : color(255, 0, 0));
    ellipse(x, y, 40, 40); // Dessiner la cible
    cible = 0; // Réinitialiser l'état de la cible
    t = millis(); // Réinitialiser le timer
  } 
  else {
    // Calculer la durée écoulée depuis la dernière cible
    int duree = millis() - t; 
    
    // Si le temps limite n'est pas écoulé
    if (duree <= Temps) {
      // Vérifier si la souris touche le carré
      if (mouseX >= x && mouseX <= x + 40 && mouseY >= y && mouseY <= y + 40) {
        score += 1; // Augmenter le score
        // Afficher un message selon la couleur de la cible
        text(couleur == 0 ? "Super" : "Bravo", xlargeur, yhauteur);
        cible = 1; // Marquer que la cible a été touchée
      }
    } else { 
      // Si le temps est écoulé
      text("Raté", xlargeur, yhauteur); // Afficher "Raté"
      score -= 1; // Décrémenter le score
      cible = 1; // Réinitialiser l'état de la cible
    }

    // Afficher le score
    text("Score:", xlargeur, yhauteur + 30); 
    text(score, xlargeur + 35, yhauteur + 30);
    
    // Si le score est supérieur à 10, réduire le temps de la cible
    if (Temps == 2000 && score > 10) { 
      Temps = 1500; 
      score = 0; // Réinitialiser le score
    }
  }
}
