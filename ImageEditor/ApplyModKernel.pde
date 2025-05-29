public class ApplyModKernel {
  String[]names;
  Kernel[]kernels;
  int currentKernel;
  PImage car, destination;
  //you can have other instance variables here


  //void keyPressed() {
  //  //write code to cycle through kernel here



  //  currentKernel = (currentKernel + 1) % kernels.length;

  //  PImage car = loadImage("redcar.png");
  //  PImage output = car.copy();

  //  apply(car, output, kernels[currentKernel].kernel);
  //  image(car, 0, 0);
  //  image(output, car.width, 0);

  //  fill(0);
  //  text("Kernel: " + names[currentKernel], 15, 15);
  //}

  public ApplyModKernel(PImage src, PImage output, int opt) {
    currentKernel = 0;
    //Kernel k = new Kernel( new float[][] {
    //  {-1, -1, -1},
    //  {-1, 8, -1},
    //  {-1, -1, -1}
    //  } );
    //Kernel k2 = new Kernel( new float[][] {
    //  {.11, .11, .11},
    //  {.11, .11, .11},
    //  {.11, .11, .11}
    //  } );
    //k2.apply(car, output);
    //image(car, 0, 0);
    //image(output, car.width, 0);



    currentKernel = 0;
    names = new String[]{
      "Identity", "Blur", "Sharpen",
      "Outline", "Left Sobel", "Right Sobel",
      "Top Sobel", "Emboss"
    };

    if (opt >= names.length) {
    } else {

      kernels = new Kernel[] {
        new Kernel( new float[][] {
          {0, 0, 0},
          {0, 1, 0},
          {0, 0, 0}
        }),
        new Kernel( new float[][] {
          {.111, .111, .111},
          {.111, .111, .111},
          {.111, .111, .111}
        }),
        new Kernel( new float[][] {
          {0, -1, 0},
          {-1, 5, -1},
          {0, -1, 0}
        }),
        new Kernel( new float[][] {
          {-1, -1, -1},
          {-1, 8, -1},
          {-1, -1, -1}
        }),
        new Kernel( new float[][] {
          {1, 0, -1},
          {2, 0, -2},
          {1, 0, -1}
        }),
        new Kernel( new float[][] {
          {-1, 0, 1},
          {-2, 0, 2},
          {-1, 0, 1}
        }),
        new Kernel( new float[][] {
          {1, 2, 1},
          {0, 0, 0},
          {-1, -2, -1}
        }),
        new Kernel( new float[][] {
          {-2, -1, 0},
          {-1, 1, 1},
          {0, 1, 2}
        })
      };

      apply(src, output, kernels[opt].kernel);
      //fill(0);
      //text("Kernel: " + names[currentKernel], 15, 15);
    }
  }

  color calcNewColor(PImage img, int x, int y, float[][] kernel) {
    //Hint: start by always returning black.
    //This will let you test your apply method right away!

    if (x <=0 || x >= img.width - 1 || y <= 0 || y >= img.height - 1) {
      return color(255);
    }

    //img.loadPixels();

    int convRSum = 0;
    int convGSum = 0;
    int convBSum = 0;
    for (int i = -1; i <=1; i++) {
      for (int j = -1; j <=1; j++) {

        int X = x + i;
        int Y = y + j;

        color imgColor = img.get(X, Y);
        float kernelVal = kernel[i+1][j+1];

        convRSum += kernelVal * red(imgColor);
        convGSum += kernelVal * green(imgColor);
        convBSum += kernelVal * blue(imgColor);

        //color imgColor = img.pixels[(x + i - 1) * img.height + (y + j - 1)];
        //float R = kernel[i][j] * red(imgColor);
        //float G = kernel[i][j] * green(imgColor);
        //float B = kernel[i][j] * blue(imgColor);

        //convRSum += clamp(R);
        //convGSum += clamp(G);
        //convBSum += clamp(B);
      }
    }

    //return color (clamp(convRSum), clamp(convGSum), clamp(convBSum));
    convRSum = constrain(convRSum, 0, 255);
    convGSum = constrain(convGSum, 0, 255);
    convBSum = constrain(convBSum, 0, 255);

    return color(convRSum, convGSum, convBSum);
  }

  void apply(PImage source, PImage destination, float[][] kernel) {
    //System.out.println("apply");
    for (int r = 0; r < source.width; r++) {
      for (int c = 0; c < source.height; c++) {
        //destination.get(r, c) = calcNewColor(source, r, c);
        destination.set(r, c, calcNewColor(source, r, c, kernel));
      }
    }
  }
}
