//
//  OGLoadingScene.h
//  Olvido
//
//  Created by Алексей Подолян on 11/10/16.
//  Copyright © 2016 Дмитрий Антипенко. All rights reserved.
//

#import "OGBaseScene.h"

@class OGSceneLoader;

@interface OGLoadingScene : OGBaseScene

+ (instancetype)loadingSceneWithSceneLoader:(OGSceneLoader *)sceneLoader;

@end
