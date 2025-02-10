class Options {
  Button backButton;
  Button volume0Button;
  Button volume25Button;
  Button volume50Button;
  Button volume75Button;
  Button volume100Button;
  Options() {
    backButton = new Button(50, 500, 100, 40, "Retour");
    volume0Button = new Button(50, 300, 100, 40, "0%");
    volume25Button = new Button(150, 300, 100, 40, "25%");
    volume50Button = new Button(250, 300, 100, 40, "50%");
    volume75Button = new Button(350, 300, 100, 40, "75%");
    volume100Button = new Button(450, 300, 100, 40, "100%");
  }
  void display() {
    fill(0);
    text("Options", width/2, 100);
    backButton.display();
    volume0Button.display();
    volume0Button.display();
    volume25Button.display();
    volume50Button.display();
    volume75Button.display();
    volume100Button.display();
  }
 void mousePressed() {
    if (backButton.isHovered()) {
      currentState = GameState.MAIN_MENU;
    } else if (volume0Button.isHovered()) {
      file.amp(0.0); 
    } else if (volume25Button.isHovered()) {
      file.amp(0.25); 
    } else if (volume50Button.isHovered()) {
      file.amp(0.5); 
    } else if (volume75Button.isHovered()) {
      //file.amp(0.75); 
    } else if (volume100Button.isHovered()) {
      file.amp(1);   
    }
  }
}
