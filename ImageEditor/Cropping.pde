public class Cropping {
  PImage destination
  
  public Cropping(PImage src, PImage output, int x, int y, int w, int h) {
    apply(src, output, x, y, w, h);
  }
  
  public void apply(PImage source, PImage destination, int cropX, int cropY, int cropW, int cropH) {
  }
}
