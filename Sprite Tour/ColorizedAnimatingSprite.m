/*
     File: APLColorizedAnimatingSprite.m
 Abstract: 
 split from APLColorizedSprites
 Robert Linnemann
 */

#import "ColorizedAnimatingSprite.h"
#import "APLResizingSprites.h"

@interface ColorizedAnimatingSprite()
@property SKSpriteNode* spriteTemplate;
@end


@implementation ColorizedAnimatingSprite


- (void)createSceneContents
{
    self.backgroundColor = [SKColor blackColor];
    self.scaleMode = SKSceneScaleModeAspectFit;

    // Allocate a single sprite and copy it to make the other sprites.
    SKSpriteNode* sprite = [SKSpriteNode spriteNodeWithImageNamed:@"rocket.png"];
    [sprite setScale:0.5];
    self.spriteTemplate = sprite;
    
    [self addAnimatedSprite];
}


- (void) addAnimatedSprite
{
    /*
     Adds a sprite to the scene, and animates its blend color.
     */
    SKSpriteNode *animatedSprite = [self.spriteTemplate copy];
    animatedSprite.position = CGPointMake(CGRectGetMidX(self.frame),
                                  CGRectGetMidY(self.frame));

    [self addChild:animatedSprite];

    [animatedSprite runAction:[self newAnimateColorsAction]];

    // Label the sprite.
    // Normally, this would be attached to the sprite. But in this scene, the sprite is scaled
    // to 50%, so the label would be too. So instead, the sprite's position is calculated in the
    // scene and placed there.
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    myLabel.text = NSLocalizedString(@"Animated Color Blending", @"");
    myLabel.fontSize = 14;
    myLabel.position = CGPointMake(animatedSprite.position.x, animatedSprite.position.y - 90);
    [self addChild:myLabel];
}


- (SKAction*) newAnimateColorsAction
{
    /*
     Creates and returns an action sequence that animates a sprite's blend color.
     */
    SKAction* sequence = [SKAction sequence:@[
          [SKAction waitForDuration:1.0],
          [SKAction colorizeWithColor:[SKColor redColor] colorBlendFactor:1.0 duration:1.0],
          [SKAction waitForDuration:1.0],
          [SKAction colorizeWithColor:[SKColor greenColor] colorBlendFactor:1.0 duration:1.0],
          [SKAction waitForDuration:1.0],
          [SKAction colorizeWithColor:[SKColor blueColor] colorBlendFactor:1.0 duration:1.0],
          [SKAction waitForDuration:1.0],
          [SKAction colorizeWithColor:[SKColor yellowColor] colorBlendFactor:1.0 duration:1.0],
          [SKAction waitForDuration:1.0],
          [SKAction colorizeWithColorBlendFactor:0.0 duration:1.0]
                         ]];
    
    return [SKAction repeatActionForever:sequence];
}

@end
