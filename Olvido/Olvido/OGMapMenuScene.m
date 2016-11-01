//
//  OGMapMenuScene.m
//  Olvido
//
//  Created by Алексей Подолян on 10/26/16.
//  Copyright © 2016 Дмитрий Антипенко. All rights reserved.
//

#import "OGMapMenuScene.h"
#import "OGLevelController.h"
#import "OGButtonNode.h"

@implementation OGMapMenuScene

- (void)didMoveToView:(SKView *)view
{
    self.scaleMode = SKSceneScaleModeAspectFit;
}

- (void)startGame
{
    OGLevelController *levelController = [OGLevelController sharedInstance];
    levelController.view = self.view;
    [levelController loadLevelWithIdentifier:@0];
    
    [levelController runStoryScene];
}

- (void)onButtonClick:(OGButtonNode *)buttonNode
{
    
}

@end
