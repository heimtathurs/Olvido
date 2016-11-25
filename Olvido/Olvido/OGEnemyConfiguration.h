//
//  OGEnemyConfiguration.h
//  Olvido
//
//  Created by Дмитрий Антипенко on 11/7/16.
//  Copyright © 2016 Дмитрий Антипенко. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@class OGTextureConfiguration;

@interface OGEnemyConfiguration : NSObject

@property (nonatomic, assign, readonly) CGFloat physicsBodyRadius;
@property (nonatomic, assign) Class enemyClass;

@property (nonatomic, strong, readonly) NSArray<OGTextureConfiguration *> *enemyTextures;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
