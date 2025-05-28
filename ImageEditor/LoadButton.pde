public class LoadButton extends Button {
  public LoadButton(int x, int y, int w, int h, String t) {
    super(x, y, w, h, t);
  }

  public void applyFunction(EditorWindow window) {
    selectInput("Select a file to process:", "fileSelected", null, this);
  }

  private void fileSelected(File selection) {
    if (selection == null) {
      println("Window was closed or the user hit cancel.");
    } else {
      println("User selected " + selection.getAbsolutePath());
    }
  }
}
