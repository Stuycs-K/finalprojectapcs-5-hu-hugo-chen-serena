public class SharpenButton extends Button {
  public SharpenButton(int x, int y, int w, int h, String t) {
    super(x, y, w, h, t);
  }

  public void applyFunction(EditorWindow window) {
    // apply kernel here
    //Modifications.applyModification(window.getImage(), "sharpen");
    PImage newImg = window.getImage().getImage().copy();
    new ApplyModKernel(window.getImage().getImage(), newImg);
    window.getImage().updateImage(newImg);
    // add kernel to list
    //
  }


}
