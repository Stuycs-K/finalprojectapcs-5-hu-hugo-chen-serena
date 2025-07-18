public class ModifyButton extends Button { //<>// //<>//
  private String type;
  public ModifyButton (int x, int y, int w, int h, String t, String type) {
    super(x, y, w, h, t);
    this.type = type;
  }

  public void applyFunction(EditorWindow window) {
    this.running = true;
    //fill(color(255, 0, 0));
    //circle(this.xCor - 10, (this.yCor +this.bHeight / 2), 10);
    //redraw();
    
    println("Pressed " + type);
    
    if (type.equals("Undo")) {
      try {
        window.currentMsg = "Undoed " + window.removeModifier().type;
      } catch (Exception e) {
      }
    } else if (type.equals("Reset")) {
      window.modifiers = new ArrayList<Modifier>();
      window.currentMsg = "Reset Image";
      window.cropLeft = 0;
      window.cropRight = 0;
      window.cropTop = 0;
      window.cropBottom = 0;
    } else {
      Modifier newMod = new Modifier(type);
      window.addModifier(newMod);
      window.currentMsg = "Applied " + type;
    }
    
    //redraw();
    applyAllModifiers(window);
    
  }

  public void applyAllModifiers(EditorWindow window) {
    
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
    
    this.running = false;
    
  }
}
