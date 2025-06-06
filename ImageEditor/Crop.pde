public class Crop {
  PImage destination;
  
  public Crop(PImage src, PImage output, int x, int y, int w, int h) {
    apply(src, output, x, y, w, h);
  }
  
  public void apply(PImage source, PImage destination, int cropX, int cropY, int cropW, int cropH) {
    for (int r = 0; r < cropW; r++) {
      for (int c = 0; c < cropH; c++) {
        int pixel = source.get(cropX + r, cropY +c);
        destination.set(r, c, pixel);
      }
    }
  }
}
