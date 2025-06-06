public class EditorImage {
  private PImage image;
  private String filePath;
  
  public EditorImage() {
    filePath = "./samples/test.jpeg";
      image = loadImage(filePath);
      //image.resize(1080, 0);
  }
  
  public void updatePath (String path) {
    try {
      image = loadImage(path);
      //image.resize(1080, 0);
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
    //newImg.resize(800, 0);
    image = newImg;
  }
  
  public void saveFile(EditorWindow window) {
    // saves PImage as fileName+PROCESSING....
    int i = filePath.lastIndexOf("."); 
    String[] a =  {filePath.substring(0, i), filePath.substring(i)};
    
    String newPath = a[0] + "_PROCESSING" + a[1];
    image.save(newPath);
    
    window.saveData = "Saved to " + newPath;

  }
  
}
