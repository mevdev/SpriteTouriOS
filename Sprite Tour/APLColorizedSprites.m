/*
     File: APLColorizedSprites.m
 Abstract: 
 This scene shows how to apply colors to a textured sprite.
 
  Version: 1.0
 
 Disclaimer: IMPORTANT:  This Apple software is supplied to you by Apple
 Inc. ("Apple") in consideration of your agreement to the following
 terms, and your use, installation, modification or redistribution of
 this Apple software constitutes acceptance of these terms.  If you do
 not agree with these terms, please do not use, install, modify or
 redistribute this Apple software.
 
 In consideration of your agreement to abide by the following terms, and
 subject to these terms, Apple grants you a personal, non-exclusive
 license, under Apple's copyrights in this original Apple software (the
 "Apple Software"), to use, reproduce, modify and redistribute the Apple
 Software, with or without modifications, in source and/or binary forms;
 provided that if you redistribute the Apple Software in its entirety and
 without modifications, you must retain this notice and the following
 text and disclaimers in all such redistributions of the Apple Software.
 Neither the name, trademarks, service marks or logos of Apple Inc. may
 be used to endorse or promote products derived from the Apple Software
 without specific prior written permission from Apple.  Except as
 expressly stated in this notice, no other rights or licenses, express or
 implied, are granted by Apple herein, including but not limited to any
 patent rights that may be infringed by your derivative works or by other
 works in which the Apple Software may be incorporated.
 
 The Apple Software is provided by Apple on an "AS IS" basis.  APPLE
 MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
 THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
 FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND
 OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
 
 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
 OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
 MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED
 AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
 STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGE.
 
 Copyright (C) 2013 Apple Inc. All Rights Reserved.
 
 */

#import "APLColorizedSprites.h"
#import "APLResizingSprites.h"

@interface APLColorizedSprites()
@property SKSpriteNode* spriteTemplate;
@end


@implementation APLColorizedSprites


- (void)createSceneContents
{
    self.backgroundColor = [SKColor blackColor];
    self.scaleMode = SKSceneScaleModeAspectFit;

    // Allocate a single sprite and copy it to make the other sprites.
    SKSpriteNode* sprite = [SKSpriteNode spriteNodeWithImageNamed:@"rocket.png"];
    [sprite setScale:0.3];
    self.spriteTemplate = sprite;
    
    [self addBlendFactorLabels];

    // Add rows of sprites for a different colors.
    [self addColorRow: [SKColor redColor] forRow: 0];
    [self addColorRow: [SKColor greenColor] forRow: 1];
    [self addColorRow: [SKColor blueColor] forRow: 2];
    [self addColorRow: [SKColor yellowColor] forRow: 3];

}


- (void)addBlendFactorLabels
{
    /*
        Adds a series of labels to the scene to identify how much color is being added to each sprite.
        (The labels are aligned with the color rows).
     */
    SKLabelNode *descriptionLabel = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    descriptionLabel.fontSize = 18;
    descriptionLabel.text = NSLocalizedString(@"Color blend factor:", @"");
    descriptionLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    descriptionLabel.position = CGPointMake(80,
                                            CGRectGetMaxY(self.frame)-82);
    [self addChild:descriptionLabel];
    
    for (int i = 0; i <= 3; i++)
    {
        SKLabelNode *numberLabel = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
        numberLabel.text = [NSString localizedStringWithFormat:@"%4.2f",(float)i/4.0];
        numberLabel.fontSize = 18;
        numberLabel.position = CGPointMake(100 + i * (self.spriteTemplate.size.width + 12),CGRectGetMaxY(self.frame)-105);
        
        [self addChild:numberLabel];
    }
}


- (void) addColorRow: (SKColor*) color forRow: (NSInteger) row
{
    /*
        Adds a row of sprites to the scene, showing how a sprite is affected by the blended color.
     */
    for (int i = 0; i <= 3; i++)
    {
        SKSpriteNode *s = [self.spriteTemplate copy];
        s.color = color;
        s.colorBlendFactor = 0.25 * (float) i;
        s.position = CGPointMake(100 + i * (self.spriteTemplate.size.width+ 18),
                                57 + row * (self.spriteTemplate.size.height)
                                 );
                                 
        [self addChild:s];
    }
    
    // And a simple color node to show the actual blend color.
    SKSpriteNode *colorSwash = [SKSpriteNode spriteNodeWithColor:color size:CGSizeMake(50,20)];
    colorSwash.position = CGPointMake(100 * (self.spriteTemplate.size.width),
                                      100 + row * (self.spriteTemplate.size.height)
                                      );
    
    [self addChild:colorSwash];
}


@end
