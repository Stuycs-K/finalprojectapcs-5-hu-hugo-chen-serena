public class Modifier {
  public String type;

  // keep a "%" in case needed or other value to be used
  public int level;

  public Modifier (String type) {
    this.type = type;
    this.level = 0;
  }

  public void applyManipulation(PImage src, PImage newImg, String modify) {
    type = modify;
    //for loop to check for modifier, then call its respoective subclass
    if (type.equals("Blur")) {
      new ApplyModKernel(src, newImg, 1);
      level++;
    } else if (type.equals("Sharpen")) {
      new ApplyModKernel(src, newImg, 2);
      level++;
    } else if (type.equals("+ Exposure")) {
      new Exposure(src, newImg, 1.5);
      level++;
    } else if (type.equals("- Exposure")) {
      new Exposure(src, newImg, 0.75);
      level++;
    } else if (type.equals("+ Saturation")) {
      new Saturation(src, newImg, 1.5);
      level++;
    } else if (type.equals("- Saturation")) {
      new Saturation(src, newImg, 0.5);
      level++;
    } else if (type.equals("Vignetting")) {
      new Vignetting(src, newImg);
      level++;
    } else if (type.equals("Moireing")) {
      new Moireing(src, newImg);
      level++;
    } else if (type.equals("Tint")) {
      new Tint(src, newImg, "Blue");
      level++;
    } else if (type.equals("Crop")) {
      new Crop(src, newImg, 600, 200, 300, 300);
      level++;
    }
  }

  public void applyManipulation(PImage src, PImage newImg, String modify, float factor) {
    type = modify;
    //for loop to check for modifier, then call its respoective subclass
    if (type.equals("+ Exposure")) {
      new Exposure(src, newImg, factor);
      level++;
    } else if (type.equals("- Exposure")) {
      new Exposure(src, newImg, factor);
      level++;
    } else if (type.equals("+ Saturation")) {
      new Saturation(src, newImg, factor);
      level++;
    } else if (type.equals("- Saturation")) {
      new Saturation(src, newImg, factor);
      level++;
    }
  }

  //tracker moved to editor window class
}
