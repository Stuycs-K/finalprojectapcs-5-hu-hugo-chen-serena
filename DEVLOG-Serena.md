# Dev Log

This document must be updated daily every time you finish a work session.

## Serena Chen

### 2024-01-02 - Brief description

5/22
- discussed general planning, updated prototype and UML

5/26
- Added applyKernel and Kernel class and modified to include Blur and Sharpen, not completely done as it does not work with the button class yet (30 mins)

5/27
- Figured out main structure and added structure of Modifier class
- Updated UML diagram and move tracker to EditorWindow class (41 mins)
- Did research on saturation and exposure in processing (30 mins)

5/28
- Added tracker to Editor Window
- added PImage method to Editor window (15 mins)

5/29
- started Exposure class including applyExposure and changeExposure 
- added exposure to modifier class (41 mins)
- debugged exposure class, tried to get working with button class but still a little bugged (30 mins)

5/30
- started Saturation class (change Saturation, applySaturation, constructor) (41 mins)

6/1
- debugged exposure class, working with temporary testing (30 mins)
- debugged saturation class, is working 
- deleted applyKernel and added saturation to modifier 
- added buttons for all features (1 hour)

6/2
- Deleted sharpenButton, looked into implementation of filter() and tint()
- Tried experimenting with a new tint() class, sort of working but doesn't save when you export the image because the tint() function doesn't direcly modify pixel data
- Added button for tint in new column for testing purposes, is semi-working
- Also experimented with filter(), mainly invert, but is broken so button is commented out, will try to fix issue tmr (1.5hr)

6/3
- fixed small bugs in tinting, moireing
- tested filters but it may be scrapped (30 mins)

6/4 
- discussed additional features to implement, slight bug testing for undo and reset
- updated UML diagram (40 mins)

6/5
- started crop class, did some research
- crop class now works temporarily with hardcoded values but will be updated later
- crop class works with all current features including save and undo (1 hr)
