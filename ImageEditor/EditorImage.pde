public class EditorImage {
  public PImage image;
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
  
}
