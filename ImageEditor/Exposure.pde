public class Exposure {
  
  public applyExposure(PImage src, PImage output) {
    
  }
  
  public color changeExposure(PImage img, int x, int y, float factor) {
    
    if (x <=0 || x >= img.width - 1 || y <= 0 || y >= img.height - 1) {
      return color(255);
    }
    
    for (int y = 0; y < image.height; y++) {
      for (int x = 0; x < image.width; x++) {
        int loc = x + y * image.width;
        color c = image.pixels[loc];
        float r = red(c) * factor;
        float g = green(c) * factor;
        float b = blue(c) * factor;
  
        // Ensure values stay within 0-255
        r = constrain(r, 0, 255);
        g = constrain(g, 0, 255);
        b = constrain(b, 0, 255);
  
        image.pixels[loc] = color(r, g, b);
      }
      return color(r, g, b);
    }
  }
  

  }
  
