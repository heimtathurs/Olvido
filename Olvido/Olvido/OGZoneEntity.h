//
//  OGAreaEntity.h
//  Olvido
//
//  Created by Алексей Подолян on 11/29/16.
//  Copyright © 2016 Дмитрий Антипенко. All rights reserved.
//

#import <GameplayKit/GameplayKit.h>
#import "OGContactNotifiableType.h"

@interface OGZoneEntity : GKEntity <OGContactNotifiableType>

#pragma mark - Init

- (instancetype)initWithSpriteNode:(SKSpriteNode *)spriteNode
                  affectedEntities:(NSArray<Class> *)affectedEntities
             interactionBeginBlock:(void (^)(GKEntity *entity))interactionBeginBlock
               interactionEndBlock:(void (^)(GKEntity *entity))interactionEndBlock;

- (instancetype)initWithSpriteNode:(SKSpriteNode *)spriteNode
                  affectedEntities:(NSArray<Class> *)affectedEntities
             interactionBeginBlock:(void (^)(GKEntity *entity))interactionBeginBlock
               interactionEndBlock:(void (^)(GKEntity *entity))interactionEndBlock
                   particleEmitter:(SKEmitterNode *)particleEmitter NS_DESIGNATED_INITIALIZER;

@end
