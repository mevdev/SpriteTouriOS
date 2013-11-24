//
//  ViewController.m
//  Sprite Tour
//
//  Created by Robert Linnemann on 11/24/13.
//  Copyright (c) 2013 Robert Linnemann. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize indexSelected,skView;

- (void)viewDidLoad
{
    [super viewDidLoad];

}
-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    skView.showsDrawCount = YES;
    
    ///Here do it, here!
    CGSize size = skView.bounds.size; //only size we got?
    //Doesn't seem to work perfectly when we switch to landscape.
    SKScene *scene;
    
    switch (indexSelected) {
        case 0:
            scene = [APLBasicSprites sceneWithSize:size];
            break;
            
        case 1:
            scene = [APLColorizedSprites sceneWithSize:size];
            break;
            
        case 2:
            scene = [ColorizedAnimatingSprite sceneWithSize:size];
            break;

            
        case 3:
            scene = [APLResizingSprites sceneWithSize:size];
            break;
            
        case 4:
            scene = [APLSpriteAnchors sceneWithSize:size];
            break;
            
        case 5:
            scene = [APLBlendingSprites sceneWithSize:size];
            break;
            
        case 6:
            scene = [APLAnimatingSprites sceneWithSize:size];
            break;
            
        default:
            break;
    }
    
    /* Set the scale mode to scale to fit the window */
    scene.scaleMode = SKSceneScaleModeAspectFit; //
    [self.skView presentScene:scene];
    
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
