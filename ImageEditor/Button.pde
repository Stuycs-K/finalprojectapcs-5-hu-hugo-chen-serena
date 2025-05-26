public class Button {
  private int xCor;
  private int yCor;
  private int bWidth;
  private int bHeight;
  private String text;
  
  public Button(int x, int y, int w, int h, String t) {
    xCor = x;
    yCor = y;
    bWidth = w;
    bHeight = h;
    text = t;
  }
  
  public void applyFunction(EditorWindow window) {
  
  }
  
  public boolean buttonClicked(int x, int y) {
    // helper function: takes X, Y coordinates of a click and returns if the coordinates are within the button.
    // (0, 0) is top left
    
    return (xCor <= x && x < xCor + bWidth && yCor <= y && y < yCor + bHeight);
  }
}
    
  
