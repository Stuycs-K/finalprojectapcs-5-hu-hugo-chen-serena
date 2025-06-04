# Dev Log

This document must be updated daily every time you finish a work session.

## Hugo Hu

### 2025-06-04 - Added a modifier ArrayList<>

Previously, there was an issue where adding / subtracting exposure & saturation, the image would just * / a constant.
If you blew out the highlights, you're crap outta luck. Good news though! Using a ArrayList<Modifier> to keep track of changes, you can now:

- expose and saturate freely, because it applies at the end (needs to fix though! Doesn't work with moiring)
- undo
- reset!

~ 1.5h

### 2025-06-01 - Added Moire Feature. Save button text update

While trying to implement a vignetting feature, I inadvertently created a _moire_ function instead of
a vignetting function. Anyway, our program now has the ability to create moire in an image. Also, when
you save the image, it will now print the location of the save location. It will also wipe the screen, show
the text, and then re-display the top components.

~ 2 hours

### 2025-05-30 - Save works

Added a save button class, save button, and implemented saving to original folder

### 2025-05-29 - Wrote part of Modifier class. Button child class ModifyButton

Slightly change way things are designed (using multiple class instances, instead of several subclasses)
~ 30m

### 2025-05-28 - Added a button + sharpening validation

Added SharpenButton. Added a class for kernels to test the button. Rewrote the
structure slightly of window to keep a source image, and modify the "output"
image directly, as well as add some helper functions to make things a bit easier.
Fixed resize so that vertical, horizontal images will show up and be scaled
proportionately to fit. Tested sharpening. Works, but can be applied more than once.

~1.5h

### 2025-05-27 - Added load feature, works

Removed LoadButton. Load implemented on startup: program will prompt user for a file. Load will NOT be
implemented during runtime.
Added a starter cat file to prevent things from breaking. (null ptr)
Attempted a resize algorithm to fit previews on screen. _VERTICAL NEEDS WORK_
~ 1h

### 2025-05-26 - Added basic classes for photo editor (NOT DONE ON BRANCH)

Had an oopsie, this work was done on the main branch, not hugohu.

Wrote Button template class and LoadButton child class. Setup hierarchy for display:
ImageEditor -> EditorWindow -> ...
Implemented button _displays_ (non-functional) in the draw() for ImageEditor.
~ 1h

### 2025-05-23 - Updated UML with suggestions

Added updates to UML to be more useful / descriptive. Further updates to naming following suggestions from
Mr. K. ~20m
(New UML not committed until 05-27)
