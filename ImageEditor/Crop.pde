public class Crop {
  PImage destination;
  
  public Crop(PImage src, PImage output, int x, int y, int w, int h) {
    PImage result = apply(src, x, y, w, h);
    output.resize(result.width, result.height);
    output.copy(result, 0, 0, result.width, result.height, 0, 0, result.width, result.height);
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
