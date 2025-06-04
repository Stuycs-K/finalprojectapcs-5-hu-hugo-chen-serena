public class ModifyButton extends Button { //<>// //<>// //<>// //<>//
  private String type;
  public ModifyButton (int x, int y, int w, int h, String t, String type) {
    super(x, y, w, h, t);
    this.type = type;
  }

  public void applyFunction(EditorWindow window) {
    println("Pressed " + type);
    if (type.equals("Undo")) {
      try {
        window.currentMsg = "Undoed " + window.removeModifier().type;
      } catch (Exception e) {
      }
    } else if (type.equals("Reset")) {
      window.modifiers = new ArrayList<Modifier>();
      window.currentMsg = "Reset Image";
    } else {
      Modifier newMod = new Modifier(type);
      window.addModifier(newMod);
      window.currentMsg = "Applied " + type;
    }
    applyAllModifiers(window);
    
  }

  public void applyAllModifiers(EditorWindow window) {
    
    // add a circle to left
    this.status = color(255, 0, 0);
    
    ArrayList<Modifier> mods = window.modifiers;

    PImage newSrc = window.getSrcImage().getImage().copy();
    // handle exposure and saturation at the end
    int expSteps = 0;
    int satSteps = 0;
    for (Modifier mod : mods) {

      if (mod.type.equals("+ Saturation")) {
        satSteps += 1;
      } else if (mod.type.equals("- Saturation")) {
        satSteps -= 1;
      } else if (mod.type.equals("+ Exposure")) {
        expSteps += 1;
      } else if (mod.type.equals("- Exposure")) {
        expSteps -= 1;
      } else {
        PImage newImg = newSrc.copy();
        mod.applyManipulation(newSrc, newImg, mod.type);
        newSrc = newImg;
        //println("Applied " + type);
      }
    }

    PImage newImg = newSrc.copy();
    float satFactor = 1 + satSteps / 10.0;
    new Saturation(newSrc, newImg, satFactor);
    //println("Saturation: " + satFactor);
    newSrc = newImg;
    newImg = newSrc.copy();
    float expFactor = 1 + expSteps / 10.0;
    new Exposure(newSrc, newImg, expFactor);
    //println("Exposure: " + expFactor);
    
    //println("Len Modifiers: " + mods.size());

    window.getImage().updateImage(newImg);
    
    this.status = color(0, 255, 0);
  }
}
