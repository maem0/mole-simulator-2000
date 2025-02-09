class Button {
  float x, y, w, h;
  String label;
  color buttonColor;
  
  Button(float x, float y, float w, float h, String label) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
    this.buttonColor = color(100, 100, 200);
  }
  
  void display() {
    if (isHovered()) {
      fill(120, 120, 220);
    } else {
      fill(buttonColor);
    }
    rect(x, y, w, h);
    fill(255);
    text(label, x + w/2, y + h/2);
  }
  
  boolean isHovered() {
    return mouseX >= x && mouseX <= x + w && 
           mouseY >= y && mouseY <= y + h;
  }
  
  boolean isClicked() {
    return isHovered() && mousePressed;
  }
}
