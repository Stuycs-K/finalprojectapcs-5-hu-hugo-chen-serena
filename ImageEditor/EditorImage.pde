public class EditorImage {
  private PImage image;
  private String filePath;
  
  public EditorImage() {
      image = loadImage("./samples/test.jpeg");
  }
  
  public void updatePath (String path) {
    try {
      image = loadImage(path);
      filePath = path;
    }
    catch (Exception e) {
      // error handling here
    }
  }
  
  public int[] getResolution () {
    return new int[]{image.width, image.height};
  }
  
  public float getRatio () {
    // return x/y
    return ((float)image.width)/image.height;
  }
  
  public PImage getImage() {
    return image;
  }
  
  public void updateImage(PImage newImg) {
    image = newImg;
  }
  
  public void saveFile() {
    // saves PImage as fileName+PROCESSING....
    int i = filePath.lastIndexOf("."); 
    String[] a =  {filePath.substring(0, i), filePath.substring(i)};
    
    String newPath = a[0] + "_PROCESSING" + a[1];
    println(filePath);
    println(newPath);
    image.save(newPath);
  }
  
}
