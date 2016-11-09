//
//  OGPlayerEntity.h
//  Olvido
//
//  Created by Дмитрий Антипенко on 11/4/16.
//  Copyright © 2016 Дмитрий Антипенко. All rights reserved.
//

#import <GameplayKit/GameplayKit.h>

@class OGHealthComponent;
@class OGAnimationComponent;
@class OGIntelligenceComponent;
@class OGInputComponent;
@class OGRenderComponent;
@class OGMovementComponent;
@class OGPhysicsComponent;
@class OGMessageComponent;

@interface OGPlayerEntity : GKEntity

@property (nonatomic, strong) OGRenderComponent *render;
@property (nonatomic, strong) OGPhysicsComponent *physics;
@property (nonatomic, strong) OGInputComponent *input;
@property (nonatomic, strong) OGIntelligenceComponent *intelligence;
@property (nonatomic, strong) OGHealthComponent *health;
@property (nonatomic, strong) OGAnimationComponent *animation;
@property (nonatomic, strong) OGMovementComponent *movement;
@property (nonatomic, strong) OGMessageComponent *messageComponent;

@end