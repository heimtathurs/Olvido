//
//  OGEnemyEntity.m
//  Olvido
//
//  Created by Дмитрий Антипенко on 11/6/16.
//  Copyright © 2016 Дмитрий Антипенко. All rights reserved.
//

#import "OGEnemyEntity.h"
#import "OGRenderComponent.h"
#import "OGIntelligenceComponent.h"
#import "OGMovementComponent.h"
#import "OGAnimationComponent.h"
#import "OGPhysicsComponent.h"

#import "OGEnemyEntityConfiguration.h"

@interface OGEnemyEntity ()

@property (nonatomic, strong) OGEnemyEntityConfiguration *enemyConfiguration;

@end

@implementation OGEnemyEntity

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        _enemyConfiguration = [[OGEnemyEntityConfiguration alloc] init];
        
        _render = [[OGRenderComponent alloc] init];
        [self addComponent:_render];
        
        _physics = [[OGPhysicsComponent alloc] initWithPhysicsBody:[SKPhysicsBody bodyWithCircleOfRadius:_enemyConfiguration.physicsBodyRadius]
                                                      colliderType:_enemyConfiguration.colliderType];
        [self addComponent:_physics];
        
        _render.node.physicsBody = _physics.physicsBody;
        _render.node.physicsBody.allowsRotation = NO;
        
        _movement = [[OGMovementComponent alloc] init];
        [self addComponent:_movement];
        
        _intelligence = [[OGIntelligenceComponent alloc] initWithStates:nil];
        //[self addComponent:_intelligence];
        
        _animation = [[OGAnimationComponent alloc] init];
        [self addComponent:_animation];
    }
    
    return self;
}
@end