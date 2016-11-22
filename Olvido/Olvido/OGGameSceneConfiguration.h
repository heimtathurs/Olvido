//
//  OGGameSceneConfiguration.h
//  Olvido
//
//  Created by Дмитрий Антипенко on 11/7/16.
//  Copyright © 2016 Дмитрий Антипенко. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OGPlayerConfiguration;

@interface OGGameSceneConfiguration : NSObject

@property (nonatomic, copy, readonly) NSString *startRoom;
@property (nonatomic, strong, readonly) OGPlayerConfiguration *playerConfiguration;
@property (nonatomic, strong, readonly) NSArray<NSDictionary *> *enemiesConfiguration;

+ (instancetype)gameSceneConfigurationWithFileName:(NSString *)fileName;

@end
