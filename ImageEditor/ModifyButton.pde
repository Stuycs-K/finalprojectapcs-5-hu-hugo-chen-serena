public class ModifyButton extends Button {
  private String type;
  public ModifyButton (int x, int y, int w, int h, String t, String type) {
    super(x, y, w, h, t);
    this.type = type;
  }
  
  public void applyFunction(EditorWindow window) {
    println("Pressed " + type);
    Modifier newMod = new Modifier(type);
    //window.addModifier(newMod);
    PImage newImg = window.getImage().getImage().copy();
    newMod.applyManipulation(window.getImage().getImage(), newImg, type);
    window.getImage().updateImage(newImg);
  }
  
}
