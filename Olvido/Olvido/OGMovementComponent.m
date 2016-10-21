//
//  OGMovement.m
//  Olvido
//
//  Created by Александр Песоцкий on 10/16/16.
//  Copyright © 2016 Дмитрий Антипенко. All rights reserved.
//

#import "OGMovementComponent.h"
#import "OGConstants.h"

CGFloat const kOGMovementComponentDefaultSpeedFactor = 1.0;

@interface OGMovementComponent ()

@property (nonatomic, retain) SKPhysicsBody *physicsBody;

@end

@implementation OGMovementComponent

- (instancetype)initWithPhysicsBody:(SKPhysicsBody *)body
{
    self = [super init];
    
    if (self)
    {
        _physicsBody = [body retain];
        _speedFactor = kOGMovementComponentDefaultSpeedFactor;
    }
    else
    {
        [self release];
        self = nil;
    }
    
    return self;
}

- (void)startMovementWithSpeed:(CGFloat)speed vector:(CGVector)vector
{
    if (self.physicsBody)
    {
        CGFloat vectorFactor = self.speedFactor * speed * self.physicsBody.mass;
        CGVector movementVector = CGVectorMake(vector.dx * vectorFactor, vector.dy * vectorFactor);
        [self.physicsBody applyImpulse:movementVector];
    }
}

- (void)setSpeedFactor:(CGFloat)speedFactor
{
    _speedFactor = speedFactor;
    
    CGVector velocity = self.physicsBody.velocity;
    self.physicsBody.velocity = CGVectorMake(velocity.dx * speedFactor, velocity.dy * speedFactor);
}

- (void)dealloc
{
    [_physicsBody release];
    
    [super dealloc];
}

@end
