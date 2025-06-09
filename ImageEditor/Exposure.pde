public class Exposure {
  //PImage destination;
  
  public Exposure(PImage src, PImage output, float factor) {
    apply(src, output, factor);
  }
  
  public color changeExposure(PImage img, int x, int y, float factor) {
    
    color c = img.get(x, y);
    float r = red(c) * factor;
    float g = green(c) * factor;
    float b = blue(c) * factor;

    // Clamp values to 0–255
    r = constrain(r, 0, 255);
    g = constrain(g, 0, 255);
    b = constrain(b, 0, 255);

    return color(r, g, b);
  }
  
   public void apply(PImage source, PImage destination, float factor) {
    //System.out.println("apply");
    for (int r = 0; r < source.width; r++) {
      for (int c = 0; c < source.height; c++) {
        destination.set(r, c, changeExposure(source, r, c, factor));
      }
    }
  }
}

  
