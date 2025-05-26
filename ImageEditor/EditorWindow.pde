public class EditorWindow {
  private ArrayList<Button> buttonList;
  private PImage srcImg;
  private PImage outputImg;
  private String srcPath;

  private int buttonW;
  private int buttonH;
  private int startX;
  private int startY;
  private int spacing;


  public void updateSrcImg(String path) {
    try {
      srcImg = loadImage(path);
    }
    catch (Exception e) {
      // error handling here
    }
  }

  public EditorWindow() {
    spacing = 20;

    buttonW = 100;
    buttonH = 60;
    startX = WindowInfo.windowX - spacing - buttonW;
    startX = WindowInfo.windowY - spacing - buttonH;

    int currentX = startX;
    int currentY = startY;

    Button loadButton = new LoadButton(currentX, currentY, buttonW, buttonH, "Load Image");
    currentY += buttonH + spacing;
    buttonList.add(loadButton);
  }
}
