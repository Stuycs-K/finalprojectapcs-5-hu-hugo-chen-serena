public class Moireing {
  PImage destination;

  public Moireing(PImage src, PImage output) {
    apply(src, output);
  }

  public Moireing(PImage src, PImage output, float factor) {
    apply(src, output, factor);
  }

  public boolean checkInBounds(int xWidth, int yHeight, Integer[] coord) {
    
    int x = coord[0];
    int y = coord[1];
    
    return (x >= 0 && x < xWidth && y >= 0 && y <= yHeight);
  }


  public void apply(PImage source, PImage destination) {
    colorMode(HSB , 360, 100, 100);
    
    // starts from a circle drawn from middle of image, radius to leave 10% of image on both sides
    
    int xWidth = source.width;
    int yHeight = source.height;
    int minDist = (int) (xWidth * .1);
    
    int startRadius = 0;
    int endRadius = (int) (sqrt(   (xWidth/2)*(xWidth/2) + (yHeight/2)*(yHeight/2)  )) + 1;
    
    int centerX = xWidth / 2;
    int centerY = yHeight / 2;
    
    float darkenAmount = 1;
    
    for (int currRadius = startRadius; currRadius <= endRadius; currRadius++) {
      darkenAmount += 1.0/minDist;
      
      ArrayList<Integer[]> pixelsToDarken = new ArrayList<Integer[]>();
      for (float theta = 0; theta <= 2*PI; theta+=PI/7200) {
        // theta increments by 0.5° or 2PI / 14000
        Integer[] newCoord = calcTrig(centerX, centerY, currRadius, theta);
        if (checkInBounds(xWidth, yHeight, newCoord)) {
          pixelsToDarken.add(newCoord);
        }
      }
      
      for (Integer[] c : pixelsToDarken) {
        int x = c[0];
        int y = c[1];
        destination.set(x, y, changeDarkness(source, x, y, darkenAmount));
        //destination.set(x, y, color(0));
      }
      
    }
    
    
    colorMode(RGB, 255); 
    
  }
  
  public color changeDarkness(PImage img, int x, int y, float factor) {
  
    color c = img.get(x,y);
    float h = hue(c);
    float s = saturation(c);
    float b = brightness(c) / factor;

    s = constrain(b, 0, 100); 

    return color(h, s, b);
  }
  
  public Integer[] calcTrig (int x, int y, int r, float theta) {
    // given a center of (x, y) and radius r, check destination pixel (rounded) with angle theta(radians)
    
    int outX = (int) (x + r * cos(theta));
    int outY = (int) (y + r * sin(theta));
    
    return new Integer[] {outX, outY};
  }
  
  public void apply(PImage source, PImage destination, float factor) {
  }
}
