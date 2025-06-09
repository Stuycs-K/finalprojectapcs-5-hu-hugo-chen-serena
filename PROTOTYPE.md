# Group Details

| Period | Group Members | Group Name |
| --- | ---- | --- |
| P5, APCS | Hugo Hu, Serena Chen | Mango Orange Spindrift | 

## Summary

We will build a photo editor with a simple UI (i.e., the one on your phone). We will have simple features like
adjusting image saturation, exposure, and cropping. We will also have some more advanced image manipulation
options available, like horizon levelling and de-noising.

## Expanded Description

### Critical Features

After 1.5 weeks, we will have at least the following in our MVP:

- Load / Save images into processing
- Basic image manipulations (integrating some of our kernels used in a lab)
- Image manipulations including: saturation, exposure, ~cropping~ (cropping was moved to after MVP as we spent more time figuring out interface and ran out of time), sharpening, blur, moireing
- Real time preview of manipulated image
- ~Some implementation of denoise, vignetting and levelling~ (also moved to after MVP)

### Nice To Haves

- ~Denoise and Levelling that actually work well~ (was harder than expected, decided to do vignetting and moireing instead, ran out of time)
- New: cropping, vignetting, tinting
- New: add and subtract buttons for exposure and saturation
- New: Undo and Reset Button
- ~Read image EXIF data and display in editor (EXIF data is the metadata of an image, including camera model / lens / image settings)~ (ran out of time as well)
- New: text at the bottom of screen indicating instructions as well as actions you just performed


# Technical Details

A description of your technical design. This should include:

How you will be using the topics covered in class in the project.

We will be modifying our kernel lab for some of the basic manipulations such as blur and sharpen. In addition, the user will be able to achieve different levels of some manipulations such as saturation and exposure through buttons ~(or sliders)~ (buttons used instead) that are displayed on the window. The user will be able to load an image into processing and export the edited image after. The user will mostly navigate the photo editor through buttons on the screen, similar to that of a phone camera. Photos will be able to have multiple effects applied to them, instead of only one.

# Project Design

UML Diagrams and descriptions of key algorithms, classes, and how things fit together.

![UML Diagram](/images/UMLClass.png)

# Intended pacing

How you are breaking down the project and who is responsible for which parts.

### 5/22 - 5/25 ###
Figure out together what the interface will look like and controls for each effect. Solidify all manipulations that will be added and starting working on modifier for applying manipulation as well as manipulation tracker.
Also, find out how to load and export images from processing. 

### 5/26 - 5/27 ###
Finish any work that was not finished from 5/22 - 5/25.  
Hugo: Add kernel class and its methods or any additional methods that are needed.  
Serena: Start adding new kernels and modifying old kernels from our lab.

### 5/28 ###
Hugo: Work on interface of editor and how different levels of manipulations will be achieved (ex. sliders or buttons).  
Serena: Start working on blur and sharpen code, including modifying kernels.

### 5/29 ###
Hugo: Work on cropping, and assist Serena with saturation and exposure if done early.  
Serena: Work on saturation and exposure, and its different levels.

### 5/30 ###
Buffer day for debugging or finalizing any crucial parts of code for MVP. If everything is fine, start working on how to implement the harder manipulations such as denoising and leveling.

