public class Tint {
  PImage destination;
  
  public Tint(PImage src, PImage output, String colour) {
    apply(src, output, colour);
  }
 
   //tint doesnt update pixel data directly, maybe thats why it doesnt save when exporting images directly
   public void apply(PImage source, PImage destination, String colour) {
    //System.out.println("apply");
    image(source, 0, 0);
    tint(0, 153, 204);
    destination.copy(source, 0, 0, source.width, source.height, 0, 0, destination.width, destination.height);
   }
}


  
