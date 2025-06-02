public class Modifier {
  private String type;
  private String[] names = {"Blur", "Sharpen", "Exposure", "Saturation", "Vignetting", "Denoise", "Leveling"};
  
  // keep a "%" in case needed or other value to be used
  private int level;
  
  public Modifier (String type) {
     this.type = type;
     this.level = 0;
     
  }
  
  public void applyManipulation(PImage src, String modify) {
      type = modify;
      //for loop to check for modifier, then call its respoective subclass
      
      if (type.equals("Blur")) {
        PImage newImg = src.copy();
        new ApplyModKernel(src, newImg, 1);
        
        level++;
      } 
      else if (type.equals("Sharpen")) {
        PImage newImg = src.copy();
        new ApplyModKernel(src, newImg, 2);
        
        level++;
      }
      else if (type.equals("Exposure")) {
        PImage newImg = src.copy();
        new Exposure(src, newImg, 1.5);
        level++;
      }
        
  }
  
  //tracker moved to editor window class
}
    
      
  
  
