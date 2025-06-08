public class StartCropButton extends Button {
  public StartCropButton (int x, int y, int w, int h) {
    super(x, y, w, h, "Crop On/Off");
  }
  
  public void applyFunction(EditorWindow window) {
    if (window.cropMode == -1) {
      window.cropMode = 0;
    } else {
      window.cropMode = -1;
      println(window.cropLeft + ", " + window.cropRight);
      println(window.cropTop + ", " + window.cropBottom);
    }
  }
}
