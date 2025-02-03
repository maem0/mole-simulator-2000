
int gameState = 0;  // 0 = Menu, 1 = Game

void setup() {
  size(1000, 700); 
  x = 100; y = 100; 
  rect(x, y, 50, 50); 
  t = millis();
}

void draw() {
  if (gameState == 0) {
    menu(); 
  } 
  else if (gameState == 1) {
    game(); 
  } 
}
