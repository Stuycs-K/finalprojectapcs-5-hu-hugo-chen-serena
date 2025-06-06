public class Crop {
  PImage destination;
  
  public Crop(PImage src, PImage output, int x, int y, int w, int h) {
    output = apply(src, x, y, w, h);
  }
  
  public PImage apply(PImage source, int cropX, int cropY, int cropW, int cropH) {
    //remmeber to constrain so it doenst break
    PImage cropped = createImage(cropW, cropH, RGB);
    cropped.loadPixels();
    for (int r = 0; r < cropW; r++) {
      for (int c = 0; c < cropH; c++) {
        int pixel = source.get(cropX + r, cropY +c);
        cropped.set(r, c, pixel);
      }
    }
    cropped.updatePixels();
    return cropped;
  }
}
