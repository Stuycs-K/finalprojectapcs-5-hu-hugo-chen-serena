public class Tint {
  PImage destination;
  
  public Tint(PImage src, PImage output, String colour) {
    apply(src, output, colour);
  }
 
   //tint doesnt update pixel data directly, maybe thats why it doesnt save when exporting images directly
   public void apply(PImage source, PImage destination, String colour) {
    for (int r = 0; r < source.width; r++) {
      for (int c = 0; c < source.height; c++) {
        //destination.get(r, c) = calcNewColor(source, r, c);
        destination.set(r, c, changeExposure(source, r, c, "Orange"));
      }
    }
   }
   
   public color changeExposure(PImage img, int x, int y, String colour) {
    
    color c = img.get(x, y);
    float r = red(c) * 0.9;
    float g = green(c) * 1.0;
    float b = blue(c) * 1.5;

    // Clamp values to 0–255
    r = constrain(r, 0, 255);
    g = constrain(g, 0, 255);
    b = constrain(b, 0, 255);

    return color(r, g, b);
    
  }
}

  
