RLSimpleBarGraph
================

A UIView-based simple bar graph.

![Screenshot](https://github.com/mevdev/RLSimpleBarGraph/blob/master/screenshot.png?raw=true)

**features:**

* A very simple bar graph
* variable amount of bars and scale labels
* ARC
* Easy to customize
* Auto-risizes
* Storyboard compatible

## Installation
Import in RLSimpleBarGraph.h and .m

## Usage

Import header.

``` objective-c
#import "RLSimpleBarGraph.h"
```

### Initialize
####1. For Storyboards drag over a UIView.
####2. Select the UIView and go to the identity inspector (newspaper looking thing) and change the class to 'RLSimpleBarGraph'. Drop in this code and connect the variable in IB by control-dragging from the view Controller (the orange with a bandaid) to the UIView (well, you know what I mean). 

In viewController header:
``` objective-c
RLSimpleBarGraph IBOutlet *yourRLSimpleBarGraph;
```
####3. In your viewWillAppear: put something like this for the most simple version.

``` objective-c
-(void)viewWillAppear: …
    [yourRLSimpleBarGraph basicInit: @[@1,@2,@4,@6,@8,@10,@3]];

```



## Contact

[Robert](http://robertlinnemann.com)

## License

See [LICENSE](https://github.com/mevdev/RLSimpleBarGraph/blob/master/MIT-LICENSE.txt).
