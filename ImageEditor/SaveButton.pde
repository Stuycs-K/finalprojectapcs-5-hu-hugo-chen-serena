public class SaveButton extends Button {
  public SaveButton (int x, int y, int w, int h, String t) {
    super(x, y, w, h, t);
  }
  
  public void applyFunction(EditorWindow window) {
    window.getImage().saveFile();
  }
  
}
