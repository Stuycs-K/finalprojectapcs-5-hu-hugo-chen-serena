public class EditorWindow {
  private ArrayList<Button> buttonList;
  private EditorImage srcImg;
  private EditorImage outputImg;
  private String srcPath;

  private int buttonW;
  private int buttonH;
  private int startX;
  private int startY;
  private int spacing;
  
  private ArrayList<Modifier> modifiers;


  public EditorWindow() {
    srcImg = new EditorImage();
    outputImg = new EditorImage();
    
    buttonList = new ArrayList<Button>();
    
    spacing = 20;

    buttonW = 100;
    buttonH = 60;
    startX = WindowInfo.windowX - spacing - buttonW;
    startY = 0 + spacing;

    int currentX = startX;
    int currentY = startY;
    
    //blur, sharpen, exposure, saturation, vignetting, moireing
    
    Button blurButton = new ModifyButton(currentX, currentY, buttonW, buttonH, "Blur", "Blur");
    currentY += buttonH + spacing;
    buttonList.add(blurButton);

    Button sharpenButton = new ModifyButton(currentX, currentY, buttonW, buttonH, "Sharpen", "Sharpen");
    currentY += buttonH + spacing;
    buttonList.add(sharpenButton);
    
    Button exposureButton = new ModifyButton(currentX, currentY, buttonW, buttonH, "Exposure", "Exposure");
    currentY += buttonH + spacing;
    buttonList.add(exposureButton);
    
    Button saturationButton = new ModifyButton(currentX, currentY, buttonW, buttonH, "Saturation", "Saturation");
    currentY += buttonH + spacing;
    buttonList.add(saturationButton);
    
    Button moireButton = new ModifyButton(currentX, currentY, buttonW, buttonH, "Moireing", "Moireing");
    currentY += buttonH + spacing;
    buttonList.add(moireButton);
    
    Button saveButton = new SaveButton(currentX, currentY, buttonW, buttonH, "Save");
    currentY += buttonH + spacing;
    buttonList.add(saveButton);
  }
  
  public void updateImage(String path) {
    srcImg.updatePath(path);
    outputImg.updatePath(path);
  }
  
  public ArrayList<Button> getButtons() {
    return buttonList;
  }
  
  public EditorImage getImage() {
    return outputImg;
  }
  
  public PImage getPImage() {
    return outputImg.getImage();
  }
  
  public void addModifier(Modifier x) {
     modifiers.add(x);
  }
  
  public void removeModifier(Modifier x) {
    modifiers.remove(modifiers.size() - 1);
  }
  
}
