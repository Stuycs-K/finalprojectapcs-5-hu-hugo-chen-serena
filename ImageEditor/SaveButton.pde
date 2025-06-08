public class SaveButton extends Button {
  public SaveButton (int x, int y, int w, int h, String t) {
    super(x, y, w, h, t);
  }

  public void applyFunction(EditorWindow window) {
    // apply cropping right before
    PImage newImg = window.getImage().getImage().copy();
    // calc new scaled cropping
    int w = window.getPImage().width;
    int h = window.getPImage().height;

    int leftCrop = (int) ( (float) window.cropLeft / window.dispW) * (w);
    int rightCrop = w - (int) ( (float) window.cropRight / window.dispW) * (w);

    int topCrop = (int) ( (float) window.cropTop / window.dispH) * (h);
    int bottomCrop = w - (int) ( (float) window.cropBottom / window.dispH) * (h);

    new Crop(window.getSrcImage().getImage(), newImg, leftCrop, topCrop, rightCrop - leftCrop, bottomCrop - topCrop);
    window.getImage().saveFile(window, newImg);
  }
}
