public class Kernel {
  float[][]kernel;

  public Kernel(float[][]init) {
    kernel = init;
  }

  color calcNewColor(PImage img, int x, int y) {
  
    float r = 0;
    float g = 0;
    float b = 0;
    
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        int xi = x + j;
        int yi = y + i;
        if (xi >= 0 && xi < img.width && yi >= 0 && yi < img.height) {
          color c = img.get(xi, yi);
          float weight = kernel[i + 1][j + 1];
          r += red(c) * weight;
          g += green(c) * weight;
          b += blue(c) * weight;
        }
      }
    }
    
    r = constrain(r, 0, 255);
    g = constrain(g, 0, 255);
    b = constrain(b, 0, 255);

    return color(r, g, b);

  }

  void apply(PImage source, PImage destination) {
    source.loadPixels();
    destination.loadPixels();

    for (int y = 0; y < source.height; y++) {
      for (int x = 0; x < source.width; x++) {
        destination.set(x, y, calcNewColor(source, x, y));
      }
    }

    destination.updatePixels();
  }

}
  
