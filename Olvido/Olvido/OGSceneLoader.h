//
//  OGSceneLoader.h
//  Olvido
//
//  Created by Алексей Подолян on 11/8/16.
//  Copyright © 2016 Дмитрий Антипенко. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GameplayKit/GameplayKit.h>

@class OGSceneMetadata;
@class OGBaseScene;

@interface OGSceneLoader : NSObject

@property (nonatomic, strong, readonly) GKStateMachine *stateMachine;
@property (nonatomic, strong, readonly) OGSceneMetadata *metadata;
@property (nonatomic, strong, readonly) OGBaseScene *scene;

+ (instancetype)sceneLoaderWithMetadata:(OGSceneMetadata *)metadata;

- (void)asynchronouslyLoadSceneForPresentation;

- (void)loadResources;

- (void)purgeResources;

@end
