//
//  ViewController.h
//  Sprite Tour
//

//  Copyright (c) 2013 Robert Linnemann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import "APLCommonScene.h"
#import "APLBasicSprites.h"
#import "APLColorizedSprites.h"
#import "APLResizingSprites.h"
#import "APLSpriteAnchors.h"
#import "APLBlendingSprites.h"
#import "APLAnimatingSprites.h"
#import "ColorizedAnimatingSprite.h"


@interface ViewController : UIViewController

@property (nonatomic, assign) long indexSelected;
@property (weak) IBOutlet SKView *skView;

@end
