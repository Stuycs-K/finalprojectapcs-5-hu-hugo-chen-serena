EditorWindow window;
int tickCounter;
String cropMsg;

int imgWidth;
int imgHeight;

void setup() {
  size(1366, 768);
  window = new EditorWindow();

  selectInput("Select a file to process:", "fileSelected");

  cropMsg = "Cropping Off";

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
  //for (Button b : buttonList) {
  //  if (b.running) {
  //    fill(color(255, 0, 0));
  //    circle(b.xCor - 10, (b.yCor +b.bHeight / 2), 10);
  //  }
  //}

  int cropMode = window.cropMode;
  if (window.cropMode == -1) {
    cropMsg = "Cropping Off";
  } else if (cropMode == 0) {
    cropMsg = "Cropping Left Border";
  } else if (cropMode == 1) {
    cropMsg = "Cropping Right Border";
  } else if (cropMode == 2) {
    cropMsg = "Cropping Top Border";
  } else if (cropMode == 3) {
    cropMsg = "Cropping Bottom Border";
  }

  for (Button b : buttonList) {
    fill(255);
    rect(b.xCor, b.yCor, b.bWidth, b.bHeight, bRadius);
    textAlign(CENTER, CENTER);
    fill(0);
    text(b.text, b.xCor + b.bWidth/2, b.yCor + b.bHeight/2);

    //fill(b.status);
    //circle(b.xCor - 10, (b.yCor + b.bHeight / 2), 10);

    fill(255);
  }

  // resize image to no more than 75% width OR 75% height
  float windowRatio = width / height;
  EditorImage currentImg = window.getImage();

  float imageRatio = currentImg.getRatio();
  int[] res = currentImg.getResolution();

  imgWidth = 0;
  imgHeight = 0;

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
  
  window.dispW = imgWidth;
  window.dispH = imgHeight;

  image(currentImg.getImage(), 0, 0, imgWidth, imgHeight);
  textAlign(LEFT, CENTER);
  text(cropMsg, 10, height-50);
  text(window.currentMsg, 10, height-30);
  text(window.saveData, 10, height-10);
  
  //int h = window.getPImage().height;
  //int w = window.getPImage().width;
  
  
  strokeWeight(10);
  if (cropMode == -1) {
    // left
    stroke(color(192, 192, 192));
    line(window.cropLeft, 0, window.cropLeft, imgHeight);
    line(imgWidth - window.cropRight, 0, imgWidth - window.cropRight, imgHeight);
    line(0, window.cropTop, imgWidth, window.cropTop);
    line(0, imgHeight - window.cropBottom, imgWidth, imgHeight - window.cropBottom);
  } else if (cropMode == 0) {
    // left
    stroke(color(255, 0, 255));
    line(window.cropLeft, 0, window.cropLeft, imgHeight);
    stroke(color(0, 255, 255));
    line(imgWidth - window.cropRight, 0, imgWidth - window.cropRight, imgHeight);
    line(0, window.cropTop, imgWidth, window.cropTop);
    line(0, imgHeight - window.cropBottom, imgWidth, imgHeight - window.cropBottom);
  } else if (cropMode == 1) {
    // right
    stroke(color(255, 0, 255));
    line(imgWidth - window.cropRight, 0, imgWidth - window.cropRight, imgHeight);
    stroke(color(0, 255, 255));
    line(window.cropLeft, 0, window.cropLeft, imgHeight);
    line(0, window.cropTop, imgWidth, window.cropTop);
    line(0, imgHeight - window.cropBottom, imgWidth, imgHeight - window.cropBottom);
  } else if (cropMode == 2) {
    // top
    stroke(color(255, 0, 255));
    line(0, window.cropTop, imgWidth, window.cropTop);
    stroke(color(0, 255, 255));
    line(window.cropLeft, 0, window.cropLeft, imgHeight);
    line(imgWidth - window.cropRight, 0, imgWidth - window.cropRight, imgHeight);
    line(0, imgHeight - window.cropBottom, imgWidth, imgHeight - window.cropBottom);
  } else if (cropMode == 3) {
    // top
    stroke(color(255, 0, 255));
    line(0, imgHeight - window.cropBottom, imgWidth, imgHeight - window.cropBottom);
    stroke(color(0, 255, 255));
    line(window.cropLeft, 0, window.cropLeft, imgHeight);
    line(imgWidth - window.cropRight, 0, imgWidth - window.cropRight, imgHeight);
    line(0, window.cropTop, imgWidth, window.cropTop);
  }
  
  strokeWeight(2);
  stroke(color(0));
}

void mouseClicked() {
  ArrayList<Button> buttonList = window.getButtons();
  for (Button b : buttonList) {
    if (b.buttonClicked(mouseX, mouseY)) {
      //fill(color(255, 0, 0));
      //circle(b.xCor - 10, (b.yCor +b.bHeight / 2), 10);
      b.applyFunction(window);
      //fill(color(0, 255, 0));
      //circle(b.xCor - 10, (b.yCor +b.bHeight / 2), 10);
    }
  }
}

void keyPressed() {
  if (key == 32) {
    window.cropMode = (window.cropMode + 1) % 4;
  }
  
   
  if (window.cropMode == 0) {
    // left
    if (keyCode == LEFT) {
      window.cropLeft = max(0, window.cropLeft - 10);
    } else if (keyCode == RIGHT) {
      window.cropLeft = min(window.getPImage().width, window.cropLeft + 10);
    }
  } else if (window.cropMode == 1) {
    // right
    if (keyCode == RIGHT) {
      window.cropRight = max(0, window.cropRight - 10);
    } else if (keyCode == LEFT) {
      window.cropRight = min(window.getPImage().width, window.cropRight + 10);
    }
  } else if (window.cropMode == 2) {
    // up
    if (keyCode == UP) {
      window.cropTop = max(0, window.cropTop - 10);
    } else if (keyCode == DOWN) {
      window.cropTop = min(window.getPImage().height, window.cropTop + 10);
    }
  } else if (window.cropMode == 3) {
    // down
    if (keyCode == DOWN) {
      window.cropBottom = max(0, window.cropBottom - 10);
    } else if (keyCode == UP) {
      window.cropBottom = min(window.getPImage().height, window.cropBottom + 10);
    }
  }

}
