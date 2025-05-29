public class applyKernel {
  String[]names;
  Kernel[]kernels;
  int currentKernel;
  PImage image, destination;
  String file; //given file path

  /*void keyPressed(){
   //write code to cycle through kernel here
   
   //needs to be modified to work with buttons
   currentKernel = (currentKernel + 1) % kernels.length;
   kernels[currentKernel].apply(car, destination);
   image(car, 0, 0);
   image(destination, car.width, 0);
   
   textSize(32);
   fill(0);
   text(names[currentKernel], 10, 30);
   
   }*/  //most likely wont need this, leaving here for now

  //needs ot be modified to work with buttons
  public void applyK(PImage src, String effect) {
    size(1450, 500);
    image = loadImage(file);
    destination = image.copy();
    image(image, 0, 0);
    image(destination, image.width, 0);
    currentKernel = -1;
    //only blur and sharpen for now, will add more later maybe
    names = new String[]{
      "Blur", "Sharpen",
    };

    kernels = new Kernel[] {

      new Kernel( new float[][] {
        {.111, .111, .111},
        {.111, .111, .111},
        {.111, .111, .111}
      }),
      new Kernel( new float[][] {
        {0, -1, 0},
        {-1, 5, -1},
        {0, -1, 0}
      })
    };
  }
}
