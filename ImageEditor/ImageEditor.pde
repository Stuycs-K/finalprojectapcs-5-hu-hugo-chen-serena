EditorWindow window;
int tickCounter;

void setup() {
  size(1366, 768);
  window = new EditorWindow();

  selectInput("Select a file to process:", "fileSelected");

  //frameRate(.25);
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    window.updateImage(selection.getAbsolutePath());
    background(128);
  }
}

void draw() {
  background(128);

  // draw buttons
  ArrayList<Button> buttonList = window.getButtons();
  int bRadius = 20;
  for (Button b : buttonList) {
    fill(255);
    rect(b.xCor, b.yCor, b.bWidth, b.bHeight, bRadius);
    textAlign(CENTER, CENTER);
    fill(0);
    text(b.text, b.xCor + b.bWidth/2, b.yCor + b.bHeight/2);
    
    fill(b.status);
    circle(b.xCor - 10, (b.yCor + b.bHeight / 2), 10);
  }

  // resize image to no more than 75% width OR 75% height
  float windowRatio = width / height;
  EditorImage currentImg = window.getImage();
  
  float imageRatio = currentImg.getRatio();
  int[] res = currentImg.getResolution();

  int imgWidth = 0;
  int imgHeight = 0;

  if (windowRatio < imageRatio) {
    // w longer. clamp by x
    imgWidth = width*3/4;
    imgHeight = res[1] * imgWidth / res[0];
  } else if (windowRatio > imageRatio) {
    // h longer. clamp by y.
    imgHeight = height * 3/4;
    imgWidth = res[0] * imgHeight/res[1];
  } else {
    imgHeight = height*3/4;
    imgWidth = imgHeight;
  }

  image(currentImg.getImage(), 0, 0, imgWidth, imgHeight);
  textAlign(LEFT, CENTER);
  text(window.currentMsg, 10, height-30);
  text(window.saveData, 10, height-10);
}

void mouseClicked() {
  ArrayList<Button> buttonList = window.getButtons();
  for (Button b : buttonList) {
    if (b.buttonClicked(mouseX, mouseY)) {
      b.applyFunction(window);
    }
  }
}
