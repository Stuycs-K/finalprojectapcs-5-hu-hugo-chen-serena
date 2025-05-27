EditorWindow window;

void setup() {
  size(1366, 768);
  window = new EditorWindow();
}

void draw() {
  clear();
  
  // draw buttons
  ArrayList<Button> buttonList = window.getButtons();
  int bRadius = 20;
  for (Button b : buttonList) {
    fill(255);
    rect(b.xCor, b.yCor, b.bWidth, b.bHeight, bRadius);
    textAlign(CENTER, CENTER);
    fill(0);
    text(b.text, b.xCor + b.bWidth/2, b.yCor + b.bHeight/2);
    
  }
}
