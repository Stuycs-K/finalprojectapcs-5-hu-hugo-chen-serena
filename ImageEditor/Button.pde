public class Button {
  public int xCor;
  public int yCor;
  public int bWidth;
  public int bHeight;
  public String text;
  
  public color status;
  
  public Button(int x, int y, int w, int h, String t) {
    xCor = x;
    yCor = y;
    bWidth = w;
    bHeight = h;
    text = t;
    
    status = color(0, 255, 0);
  }
  
  public void applyFunction(EditorWindow window) {
  
  }
  
  public boolean buttonClicked(int x, int y) {
    // helper function: takes X, Y coordinates of a click and returns if the coordinates are within the button.
    // (0, 0) is top left
    
    return (xCor <= x && x < xCor + bWidth && yCor <= y && y < yCor + bHeight);
  }
}
    
  
