public class EditorWindow {
  private ArrayList<Button> buttonList;
  private EditorImage srcImg;
  private EditorImage outputImg;
  private String srcPath;
  public String saveData;

  private int buttonW;
  private int buttonH;
  private int startX;
  private int startY;
  private int spacing;
  
  public ArrayList<Modifier> modifiers;


  public EditorWindow() {
    srcImg = new EditorImage();
    outputImg = new EditorImage();
    
    buttonList = new ArrayList<Button>();
    modifiers = new ArrayList<Modifier>();
    
    saveData = "";
    
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
    
    Button exposureButtonP = new ModifyButton(currentX, currentY, buttonW, buttonH, "+ Exposure", "+ Exposure");
    currentY += buttonH + spacing;
    buttonList.add(exposureButtonP);
    
    Button exposureButtonN = new ModifyButton(currentX, currentY, buttonW, buttonH, "- Exposure", "- Exposure");
    currentY += buttonH + spacing;
    buttonList.add(exposureButtonN);
    
    Button saturationButtonP = new ModifyButton(currentX, currentY, buttonW, buttonH, "+ Saturation", "+ Saturation");
    currentY += buttonH + spacing;
    buttonList.add(saturationButtonP);
    
    Button saturationButtonN = new ModifyButton(currentX, currentY, buttonW, buttonH, "- Saturation", "- Saturation");
    currentY += buttonH + spacing;
    buttonList.add(saturationButtonN);
    
    Button moireButton = new ModifyButton(currentX, currentY, buttonW, buttonH, "Moireing", "Moireing");
    currentY += buttonH + spacing;
    buttonList.add(moireButton);
    
    Button saveButton = new SaveButton(currentX, currentY, buttonW, buttonH, "Save");
    currentY += buttonH + spacing;
    buttonList.add(saveButton);
    
    
    //new column
    
    currentX = WindowInfo.windowX - 2 * spacing - 2 * buttonW;
    currentY = 0 + spacing;
    
    Button tintButton = new ModifyButton(currentX, currentY, buttonW, buttonH, "Tint", "Tint");
    currentY += buttonH + spacing;
    buttonList.add(tintButton);
    
    Button filtersButton = new ModifyButton(currentX, currentY, buttonW, buttonH, "Filter", "Filter");
    currentY += buttonH + spacing;
    buttonList.add(filtersButton);
    
    Button undoButton = new ModifyButton(currentX, currentY, buttonW, buttonH, "Undo", "Undo");
    currentY += buttonH + spacing;
    buttonList.add(undoButton);
    
    Button resetButton = new ModifyButton(currentX, currentY, buttonW, buttonH, "Reset", "Reset");
    currentY += buttonH + spacing;
    buttonList.add(resetButton);

  }
  
  public void updateImage(String path) {
    srcImg.updatePath(path);
    outputImg.updatePath(path);
  }
  
  public ArrayList<Button> getButtons() {
    return buttonList;
  }
   
  public EditorImage getSrcImage() {
    return srcImg;
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
  
  public void removeModifier() {
    modifiers.remove(modifiers.size() - 1);
  }
  
}
