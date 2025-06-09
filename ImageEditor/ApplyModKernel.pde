public class ApplyModKernel {
  String[]names;
  Kernel[]kernels;
  int currentKernel;
  PImage destination;


  public ApplyModKernel(PImage src, PImage output, int opt) {
    currentKernel = 0;


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
        destination.set(r, c, calcNewColor(source, r, c, kernel));
      }
    }
  }
}
