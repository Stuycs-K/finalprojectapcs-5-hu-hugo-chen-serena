public class Filters {
  PImage destination;
  
  public Filters(PImage src, PImage output) {
    apply(src, output);
  }
 
   //tint doesnt update pixel data directly, maybe thats why it doesnt save when exporting images directly
   public void apply(PImage source, PImage destination) {
    //System.out.println("apply");
    image(source, 0, 0);
    filter(INVERT);
    destination.copy(source, 0, 0, source.width, source.height, 0, 0, destination.width, destination.height);
   }
}


  
