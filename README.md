# WWDC-Dynamic-Type-Jumpy-Scroll-Issue
Cloned the WWDC2014 Dynamic Type Table View example from #226 Whats New in Table and Collection Views to illustrate the jumpy scroll issue.

https://developer.apple.com/videos/wwdc/2014/#226
http://openradar.appspot.com/618103334

We are experiencing an issue with table views where scrolling becomes very jumpy and table offsets are incorrectly reset when coming back from a subview. This is a clone of the WWDC cell auto sizing example to illustrate this issue and try to find a resolution.

To reproduce scroll jumpiness:
  1. run app from XCode
  2. scroll to the bottom of the table
  3. see in the console the current height of the table content
  4. tap a cell to go to the subview
  5. see in the console the current height of the table has been recalculated and is now much smaller, also observe that the cell visually jumps to a new location during this transition, helps if you toggle slow animations
  6. press back to go back to the table view
  7. scroll toward the top of the table, notice how jumpy the scrolling is and how the height of the table content is increased as the table scrolls
