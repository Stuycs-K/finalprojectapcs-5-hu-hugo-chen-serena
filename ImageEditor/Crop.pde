public class Crop {
  PImage destination;
  
  public Crop(PImage src, PImage output, int x, int y, int w, int h) {
    PImage result = apply(src, x, y, w, h);
    //System.out.println(result.width);
    //System.out.println(result.height);
    output.resize(result.width, result.height);
    output.copy(result, 0, 0, result.width, result.height, 0, 0, result.width, result.height);
    //System.out.println(output.width);
    //System.out.println(output.height);
  }
  
  public PImage apply(PImage source, int cropX, int cropY, int cropW, int cropH) {
    //remmeber to constrain so it doenst break
    //System.out.println(source.width);
    //System.out.println(source.height);
    PImage cropped = createImage(cropW, cropH, RGB);
    cropped.loadPixels();
    for (int r = 0; r < cropW; r++) {
      for (int c = 0; c < cropH; c++) {
        int pixel = source.get(cropX + r, cropY + c);
        cropped.set(r, c , pixel);
      }
    }
    cropped.updatePixels();
    return cropped;
  }
}
