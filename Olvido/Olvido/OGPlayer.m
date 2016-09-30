//
//  OGPlayer.m
//  Olvido
//
//  Created by Александр Песоцкий on 9/30/16.
//  Copyright © 2016 Дмитрий Антипенко. All rights reserved.
//

#import "OGPlayer.h"

NSString *const kOGPlayerPlayerName = @"palyer";
CGFloat const kOGPlayerPlayerRadius = 32.0;

@implementation OGPlayer

+ (instancetype)palyerWithTexture:(SKTexture *)texture
{
    OGPlayer *player = [[OGPlayer alloc] initWithTexture:texture];
    
    if (player)
    {
        player.name = kOGPlayerPlayerName;
        player.size = CGSizeMake(kOGPlayerPlayerRadius * 2.0, kOGPlayerPlayerRadius * 2.0);
        player.position = CGPointMake(100.0, 100.0);
        
        player.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:(kOGPlayerPlayerRadius)];
        player.physicsBody.dynamic = YES;
        player.physicsBody.linearDamping = 0.0;
        player.physicsBody.angularDamping = 0.0;
    }

    return [player autorelease];
}

@end