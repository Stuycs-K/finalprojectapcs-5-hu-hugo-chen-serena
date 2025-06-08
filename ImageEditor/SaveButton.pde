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

    int leftCrop = (int) (( (float) window.cropLeft / window.dispW) * (w));
    //println((float) window.cropLeft / window.dispW);
    //println(( (float) window.cropLeft / window.dispW) * (w));
    //println((int) (( (float) window.cropLeft / window.dispW) * (w));
    //println(leftCrop);
    //println("WCL: " + window.cropLeft);
    //println("WDSPW: " + window.dispW);
    //println("W: " + w);
    
    int rightCrop = w - (int) (( (float) window.cropRight / window.dispW) * (w));

    int topCrop = (int) (( (float) window.cropTop / window.dispH) * (h));
    int bottomCrop = h - (int) (( (float) window.cropBottom / window.dispH) * (h));

    Crop x = new Crop(window.getImage().getImage(), newImg, leftCrop, topCrop, rightCrop - leftCrop, bottomCrop - topCrop);
    newImg = x.apply(newImg, leftCrop, topCrop, rightCrop - leftCrop, bottomCrop - topCrop);
    //println(w + "," + h);
    //println(leftCrop + "," + rightCrop + "," + topCrop + "," + bottomCrop);
    //new Crop(window.getSrcImage().getImage(), newImg, 0, 0, 1000, 1000);
    
    //applyAllModifiers(window, newImg);
    //newImg = window.getPImage();
    window.getImage().saveFile(window, newImg);
  }
  
  
  public void applyAllModifiers(EditorWindow window, PImage input) {
    
    ArrayList<Modifier> mods = window.modifiers;

    PImage newSrc = input.copy();
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
    
  }
}
