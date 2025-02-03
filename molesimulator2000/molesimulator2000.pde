int x, y, couleur;
long temps, debut;
int mx, my;
boolean cible_en_cours;
int i, n;
int seuil = 8;

void setup() {
    size(700, 800);
    cible_en_cours = true;
    for (i = 0; i < 20; i = i + 1) {
        n = round(random(1, 10));
        print(" ", n);
        if (n > seuil) {
            // todo: changer la couleur par raport au seuil
        }
    }
}

void draw() {
    temps = millis();  

    if (cible_en_cours) {
        x = 300;  
        y = 300;  
        fill(0, 255, 0);
        rect(x, y, 30, 30);
        cible_en_cours = false; 
        debut = temps; 
    }

    mx = mouseX;
    my = mouseY;

    if ((temps - debut) > 1000) { 

        fill(200, 200, 200);
        rect(x, y, 30, 30);
        
        x = round(random(0, 670));  
        y = round(random(0, 670));  
        
        fill(0, 255, 0);
        rect(x, y, 30, 30);
        
        cible_en_cours = true; 
        debut = temps;  
    }

    if ((mx >= x) && (mx <= x + 30) && (my >= y) && (my <= y + 30)) {
        fill(0, 0, 0);
        rect(x + 5, y + 5, 20, 20);
        cible_en_cours = true;
    }
}
