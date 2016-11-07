//
//  OGAnimationComponent.m
//  Olvido
//
//  Created by Алексей Подолян on 10/30/16.
//  Copyright © 2016 Дмитрий Антипенко. All rights reserved.
//

#import "OGAnimationComponent.h"
#import "OGAnimation.h"

NSString *const kOGAnimationComponentBodyActionKey = @"bodyAction";
NSString *const kOGAnimationComponentTextureActionKey = @"textureActionKey";
CGFloat const kOGAnimationComponentTimePerFrame = 0.1;

@interface OGAnimationComponent ()

@property (nonatomic, strong) OGAnimation *currentAnimation;
@property (nonatomic, assign) NSTimeInterval elapsedAnimationDuration;

@end


@implementation OGAnimationComponent

- (instancetype)initWithTextureSize:(CGSize)textureSize
                         animations:(NSDictionary *)animations
{
    self = [super init];
    
    if (self)
    {
        _animations = animations;
        _spriteNode = [SKSpriteNode spriteNodeWithTexture:nil size:textureSize];
        _elapsedAnimationDuration = 0.0;
    }
    
    return self;
}

- (void)runAnimationForAnimationStateWithAnimationState:(OGAnimationState)animationState
                                           deltaTime:(NSTimeInterval)deltaTime
{
    self.elapsedAnimationDuration += deltaTime;
    
    if (self.currentAnimation == nil && self.currentAnimation.animationState != animationState
        && self.animations[kOGAnimationStateDescription[animationState]])
    {
        OGAnimation *animation = self.animations[kOGAnimationStateDescription[animationState]];
        
        if (![self.currentAnimation.bodyActionName isEqualToString:animation.bodyActionName])
        {
            [self.spriteNode removeActionForKey:kOGAnimationComponentBodyActionKey];
            self.spriteNode.position = CGPointZero;
            
            SKAction *bodyAction = animation.bodyAction;
            
            if (bodyAction)
            {
                [self.spriteNode runAction:[SKAction repeatActionForever:bodyAction] withKey:kOGAnimationComponentBodyActionKey];
            }
        }
        
        [self.spriteNode removeActionForKey:kOGAnimationComponentTextureActionKey];
        
        SKAction *texturesAction = nil;
        
        if ([animation.textures count] == 1)
        {
            texturesAction = [SKAction setTexture:animation.textures.firstObject];
        }
        else
        {
            if (self.currentAnimation && animationState == self.currentAnimation.animationState)
            {
                NSUInteger numberOfFramesInCurrentAnimation = self.currentAnimation.textures.count;
                NSInteger numberOfFramesPlayedSinceCurrentAnimationBegan = (NSInteger) (self.elapsedAnimationDuration / kOGAnimationComponentTimePerFrame);
                
                animation.frameOffset = (self.currentAnimation.frameOffset + numberOfFramesPlayedSinceCurrentAnimationBegan + 1) % numberOfFramesInCurrentAnimation;
            }
            
            SKAction *animateAction = [SKAction animateWithTextures:animation.offsetTextures timePerFrame:kOGAnimationComponentTimePerFrame];
            if (animation.isRepeatedTexturesForever)
            {
                texturesAction = [SKAction repeatActionForever:animateAction];
            }
            else
            {
                texturesAction = animateAction;
            }
        }
        
        [self.spriteNode runAction:texturesAction withKey:kOGAnimationComponentTextureActionKey];
        
        self.currentAnimation = animation;
        
        self.elapsedAnimationDuration = 0.0;
    }
}

- (void)updateWithDeltaTime:(NSTimeInterval)deltaTime
{
    [super updateWithDeltaTime:deltaTime];
    
    if (self.requestedAnimationState != OGAnimationStateNone)
    {
        [self runAnimationForAnimationStateWithAnimationState:self.requestedAnimationState deltaTime:deltaTime];
        self.requestedAnimationState = OGAnimationStateNone;
    }
}

- (SKTexture *)firstTextureForOrientationWithDirection:(OGDirection)direction
                                                 atlas:(SKTextureAtlas *)atlas
                                       imageIdentifier:(NSString *)imageIdentifier
{
    NSString *structure = [NSString stringWithFormat:@"%@_%lu_", imageIdentifier, direction];
    NSString *filter = @"%K BEGINSWITH %@";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:filter, @"SELF", structure];
    
    NSArray<NSString *> *sortedTextureNames = [[[atlas textureNames] filteredArrayUsingPredicate:predicate] sortedArrayUsingSelector:@selector(compare:)];
    
    return [atlas textureNamed:sortedTextureNames.firstObject];
}

- (SKAction *)actionForAllTexturesWithAtlas:(SKTextureAtlas *)atlas
{
    NSArray<NSString *> *sortedTextureNames = [[atlas textureNames] sortedArrayUsingSelector:@selector(compare:)];
    NSArray<SKTexture *> *sortedTextures = [self mapWithArrayOfStrings:sortedTextureNames];
    
    SKAction *result = nil;
    
    if (sortedTextures.count == 1)
    {
        result = [SKAction setTexture:sortedTextures.firstObject];
    }
    else
    {
        SKAction *texturesAction = [SKAction animateWithTextures:sortedTextures timePerFrame:kOGAnimationComponentTimePerFrame];
        result = [SKAction repeatActionForever:texturesAction];
    }
    
    return result;
}

- (NSArray<SKTexture *> *)mapWithArrayOfStrings:(NSArray<NSString *> *)arrayOfStrings
{
    NSMutableArray<SKTexture *> *result = nil;
    
    for (NSString *imageName in arrayOfStrings)
    {
        SKTexture *texture = [SKTexture textureWithImageNamed:imageName];
        
        [result addObject:texture];
    }
    
    return result;
}

@end
