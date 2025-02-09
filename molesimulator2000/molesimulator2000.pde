import processing.sound.*;
SoundFile file;
SoundFile hitSound;
SoundFile missSound;

PImage bg;

enum GameState {
  MAIN_MENU,
    OPTIONS,
    GAME,
    TUTORIEL,
    LEVEL_SELECT,
    ENDLESS,
    CHAOS_MODE
}

TutorielMenu tutorielMenu;
GameState currentState;
MainMenu mainMenu;
ModeChaos modeChaos;
Options options;
Game game;
LevelSelect levelSelect;
EndlessGame endlessGame;

void setup() {
  size(1633, 980);
  bg = loadImage("background.jpg");
  textAlign(CENTER, CENTER);
  textSize(20);
  file = new SoundFile(this, "loop.mp3");
  hitSound = new SoundFile(this, "hit.mp3");
missSound = new SoundFile(this, "miss.mp3");

  file.play();

  mainMenu = new MainMenu();
  options = new Options();
  game = new Game();
  endlessGame = new EndlessGame();
  levelSelect = new LevelSelect();
  modeChaos = new ModeChaos();
  tutorielMenu = new TutorielMenu();
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
  case TUTORIEL:
    tutorielMenu.display();
    break;
  case LEVEL_SELECT:
    levelSelect.display();
    break;
  case ENDLESS:
    endlessGame.display();
    break;
      case CHAOS_MODE:
    modeChaos.display();
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
  case TUTORIEL:
    tutorielMenu.mousePressed();
    break;
  case LEVEL_SELECT:
    levelSelect.mousePressed();
    break;
  case ENDLESS:
    endlessGame.mousePressed();
    break;
      case CHAOS_MODE:
    modeChaos.mousePressed();
    break;
  }
}
