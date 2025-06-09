public class EditorWindow {
  private ArrayList<Button> buttonList;
  private EditorImage srcImg;
  private EditorImage outputImg;
  private String srcPath;
  public String saveData;
  public String currentMsg;

  private int buttonW;
  private int buttonH;
  private int startX;
  private int startY;
  private int spacing;

  public ArrayList<Modifier> modifiers;

  public int cropMode;
  public int cropLeft;
  public int cropRight;
  public int cropTop;
  public int cropBottom;
  
  public int dispW;
  public int dispH;


  public EditorWindow() {
    srcImg = new EditorImage();
    outputImg = new EditorImage();

    cropMode = -1;
    cropLeft = 0;
    cropRight = 0;
    cropTop = 0;
    cropBottom = 0;

    buttonList = new ArrayList<Button>();
    modifiers = new ArrayList<Modifier>();

    saveData = "";
    currentMsg = "";

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

    Button saveButton = new SaveButton(currentX, currentY, buttonW, buttonH, "Save");
    currentY += buttonH + spacing;
    buttonList.add(saveButton);


    //new column

    currentX = WindowInfo.windowX - 2 * spacing - 2 * buttonW;
    currentY = 0 + spacing;

    Button moireButton = new ModifyButton(currentX, currentY, buttonW, buttonH, "Moireing", "Moireing");
    currentY += buttonH + spacing;
    buttonList.add(moireButton);

    Button vignettingButton = new ModifyButton(currentX, currentY, buttonW, buttonH, "Vignetting", "Vignetting");
    currentY += buttonH + spacing;
    buttonList.add(vignettingButton);

    Button tintButton = new ModifyButton(currentX, currentY, buttonW, buttonH, "Tint", "Tint");
    currentY += buttonH + spacing;
    buttonList.add(tintButton);

    //Button filtersButton = new ModifyButton(currentX, currentY, buttonW, buttonH, "Filter", "Filter");
    //currentY += buttonH + spacing;
    //buttonList.add(filtersButton);

    Button undoButton = new ModifyButton(currentX, currentY, buttonW, buttonH, "Undo", "Undo");
    currentY += buttonH + spacing;
    buttonList.add(undoButton);

    Button resetButton = new ModifyButton(currentX, currentY, buttonW, buttonH, "Reset", "Reset");
    currentY += buttonH + spacing;
    buttonList.add(resetButton);

    //Button cropButton = new ModifyButton(currentX, currentY, buttonW, buttonH, "Crop", "Crop");
    //currentY += buttonH + spacing;
    //buttonList.add(cropButton);
    
    Button startCrop = new StartCropButton(currentX, currentY, buttonW, buttonH);
    currentY += buttonH + spacing;
    buttonList.add(startCrop);
    
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

  public Modifier removeModifier() {
    return modifiers.remove(modifiers.size() - 1);
  }
}
