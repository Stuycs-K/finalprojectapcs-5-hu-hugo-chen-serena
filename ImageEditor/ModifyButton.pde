public class ModifyButton extends Button {
  private String type;
  public ModifyButton (int x, int y, int w, int h, String t, String type) {
    super(x, y, w, h, t);
    this.type = type;
  }
  
  public void applyFunction(EditorWindow window) {
    Modifier newMod = new Modifier(type);
    window.addModifier(newMod);
    newMod.applyManipulation(window.getPImage(), type);
  }
  
}
