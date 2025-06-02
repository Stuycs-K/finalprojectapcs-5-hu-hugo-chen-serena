public class Saturation {
  PImage destination;
  
  public Saturation(PImage src, PImage output, float factor) {
    apply(src, output, factor);
  }
  
  public color changeSaturation(PImage img, int x, int y, float factor) {
  
    color c = img.get(x,y);
    float h = hue(c);
    float s = saturation(c) * factor;
    float b = brightness(c);

    s = constrain(s, 0, 100); 

    return color(h, s, b);
  }
  
   public void apply(PImage source, PImage destination, float factor) {
    //System.out.println("apply");
    colorMode(HSB , 360, 100, 100);
    for (int r = 0; r < source.width; r++) {
      for (int c = 0; c < source.height; c++) {
        //destination.get(r, c) = calcNewColor(source, r, c);
        destination.set(r, c, changeSaturation(source, r, c, factor));
      }
    }
    
    colorMode(RGB, 255); 
  }
}
  
