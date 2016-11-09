//
//  OGSceneMetadata.h
//  Olvido
//
//  Created by Алексей Подолян on 11/8/16.
//  Copyright © 2016 Дмитрий Антипенко. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OGSceneMetadata : NSObject

@property (nonatomic, unsafe_unretained, readonly) NSNumber *identifier;
@property (nonatomic, unsafe_unretained, readonly) NSString  *sceneType;
@property (nonatomic, strong, readonly) NSString *name;

+ (instancetype)sceneMetaDataWithSceneConfiguration:(NSDictionary *)configuration;

@end