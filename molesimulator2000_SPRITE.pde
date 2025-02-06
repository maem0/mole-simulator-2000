//import processing.sound.*;
//SoundFile file;

enum GameState {
  MAIN_MENU,
  OPTIONS,
  GAME,
  LEVEL_SELECT
}

GameState currentState;
MainMenu mainMenu;
Options options;
Game game;
LevelSelect levelSelect;

PImage bg;

void setup() {
  size(1531, 980);
  bg = loadImage("background.jpg");
  surface.setResizable(true);
  textAlign(CENTER, CENTER);
  textSize(20);
  //file = new SoundFile(this,"loop.mp3");
  //file.play();
  
  mainMenu = new MainMenu();
  options = new Options();
  game = new Game();
  levelSelect = new LevelSelect();
  currentState = GameState.MAIN_MENU;
}

void draw() {
  background(bg);
  
  switch(currentState) {
    case MAIN_MENU:
      mainMenu.display();
      break;
    case OPTIONS:
      options.display();
      break;
    case GAME:
      game.display();
      break;
    case LEVEL_SELECT:
      levelSelect.display();
      break;
  }
}
void mousePressed() {
  switch(currentState) {
    case MAIN_MENU:
      mainMenu.mousePressed();
      break;
    case OPTIONS:
      options.mousePressed();
      break;
    case GAME:
      game.mousePressed();
     break;
     case LEVEL_SELECT:
      levelSelect.mousePressed();
     break;
  }
}
