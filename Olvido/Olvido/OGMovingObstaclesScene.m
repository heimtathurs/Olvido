//
//  OGMovingObstaclesScene.m
//  Olvido
//
//  Created by Дмитрий Антипенко on 10/14/16.
//  Copyright © 2016 Дмитрий Антипенко. All rights reserved.
//

#import "OGMovingObstaclesScene.h"
#import "OGCollisionBitMask.h"
#import "OGGameScene+OGGameSceneCreation.h"
#import "SKColor+OGConstantColors.h"

@implementation OGMovingObstaclesScene

- (void)createSceneContents
{
    self.backgroundColor = [SKColor gameGreen];
    
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    self.physicsBody.categoryBitMask = kOGCollisionBitMaskObstacle;
    self.physicsBody.collisionBitMask = kOGCollisionBitMaskPlayer | kOGCollisionBitMaskEnemy;
    self.physicsBody.contactTestBitMask = kOGCollisionBitMaskPlayer;
    
    self.physicsBody.usesPreciseCollisionDetection = YES;
    self.physicsWorld.gravity = CGVectorMake(0.0, 0.0);
    self.physicsWorld.contactDelegate = self;
    
    [self addChild:[self createBackgroundBorderWithColor:[SKColor gameDarkGreen]]];
    
    [self createEnemies];
    [self createPlayer];
    
    CGFloat offset = self.frame.size.height / 5.0;
    
    [self createObstaclesWithSize:CGSizeMake(offset, 30.0)
                          atPoint:CGPointMake(CGRectGetMidX(self.frame), offset)];
    
    [self createObstaclesWithSize:CGSizeMake(offset, 30.0)
                          atPoint:CGPointMake(CGRectGetMidX(self.frame), self.frame.size.height - offset)];

}

- (void)createObstaclesWithSize:(CGSize)size atPoint:(CGPoint)point
{
    OGEntity *obstacle = [OGEntity entity];
    
    OGVisualComponent *visualComponent = [[OGVisualComponent alloc] init];
    visualComponent.spriteNode = [OGSpriteNode spriteNodeWithImageNamed:kOGSceneControllerHorizontalPortalTextureName];
    visualComponent.color = [SKColor gameBlack];
    
    OGSpriteNode *sprite = visualComponent.spriteNode;
    sprite.owner = visualComponent;
    sprite.size = size;
    sprite.position = point;
    
    sprite.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:size];
    sprite.physicsBody.restitution = 1.0;
    sprite.physicsBody.friction = 0.0;
    sprite.physicsBody.linearDamping = 0.0;
    sprite.physicsBody.angularDamping = 0.0;
    
    sprite.physicsBody.categoryBitMask = kOGCollisionBitMaskObstacle;
    sprite.physicsBody.collisionBitMask = kOGCollisionBitMaskDefault;
    sprite.physicsBody.contactTestBitMask = kOGCollisionBitMaskDefault;
    
    [obstacle addComponent:visualComponent];
    
    [self addChild:sprite];
    
    CGFloat offset = self.frame.size.height / 5.0;
    
    SKAction *moveActionRight = [SKAction moveToX:offset duration:1.0];
    SKAction *moveActionLeft = [SKAction moveToX:self.frame.size.width - offset duration:1.0];
    
    SKAction *repeatAction = [SKAction repeatActionForever:[SKAction sequence:@[
                                                                                moveActionRight,
                                                                                moveActionLeft
                                                                                ]]];
    [sprite runAction:repeatAction];
    
    [visualComponent release];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.sceneDelegate gameSceneDidCallFinishWithPortal:self.portals[0]];
}

- (void)dealloc
{    
    [super dealloc];
}

@end