public class EditorWindow {
  private ArrayList<Button> buttonList;
  public EditorImage srcImg;
  private EditorImage outputImg;
  private String srcPath;

  private int buttonW;
  private int buttonH;
  private int startX;
  private int startY;
  private int spacing;


  public EditorWindow() {
    srcImg = new EditorImage();
    
    buttonList = new ArrayList<Button>();
    
    spacing = 20;

    buttonW = 100;
    buttonH = 60;
    startX = WindowInfo.windowX - spacing - buttonW;
    startY = 0 + spacing;

    int currentX = startX;
    int currentY = startY;

    //Button loadButton = new LoadButton(currentX, currentY, buttonW, buttonH, "Load Image");
    //currentY += buttonH + spacing;
    //buttonList.add(loadButton);
  }
  
  public void updateImage(String path) {
    srcImg.updatePath(path);
  }
  
  public ArrayList<Button> getButtons() {
    return buttonList;
  }
}
