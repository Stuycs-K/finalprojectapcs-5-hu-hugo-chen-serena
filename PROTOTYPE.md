# Group Details

| Period | P5, APCS |
| --- | --------- |
| Group Members | Hugo Hu, Serena Chen |
| Group Name | Mango Orange Spindrift |  

## Summary

We will build a photo editor with a simple UI (i.e., the one on your phone). We will have simple features like
adjusting image saturation, exposure, and cropping. We will also have some more advanced image manipulation
options available, like horizon levelling and de-noising.

## Expanded Description

### Critical Features

After 1.5 weeks, we will have at least the following in our MVP:

- Load / Save images into processing
- Basic image manipulations (integrating some of our kernels used in a lab)
- Image manipulations including: saturation, exposure, cropping, sharpening, blur
- Real time preview of manipulated image
- Some implementation of denoise, vignetting and levelling

### Nice To Haves

- Denoise and Levelling that actually work well
- Read image EXIF data and display in editor (EXIF data is the metadata of an image, including camera model / lens / image settings)


# Technical Details

A description of your technical design. This should include:

How you will be using the topics covered in class in the project.

We will be modifying our kernel lab for some of the basic manipulations such as blur and sharpen. In addition, the user will be able to achieve different levels of some manipulations such as saturation and exposure through buttons (or sliders) that are displayed on the window. The user will be able to load an image into processing and export the edited image after. The user will mostly navigate the photo editor through buttons on the screen, similar to that of a phone camera. Photos will be able to have multiple effects applied to them, instead of only one.

# Project Design

UML Diagrams and descriptions of key algorithms, classes, and how things fit together.

![UML Diagram](/images/UMLClass.png)

# Intended pacing

How you are breaking down the project and who is responsible for which parts.

A timeline with expected completion dates of parts of the project. (CHANGE THIS!!!!!)
