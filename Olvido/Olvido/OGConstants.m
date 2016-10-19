 //
//  OGConstants.m
//  Olvido
//
//  Created by Дмитрий Антипенко on 10/7/16.
//  Copyright © 2016 Дмитрий Антипенко. All rights reserved.
//

#import "OGConstants.h"

NSString *const kOGPlayerNodeName = @"player";
NSString *const kOGEnemyNodeName = @"enemy";
NSString *const kOGObstacleNodeName = @"obstacle";
NSString *const kOGCoinNodeName = @"coin";
NSString *const kOGPortalNodeName = @"portal";
NSString *const kOGPauseButtonName = @"pause";

NSString *const kOGEnemyTextureName = @"EnemyBall";
NSString *const kOGPlayerTextureName = @"PlayerBall";
NSString *const kOGCoinTextureName = @"EnemyBall";
NSString *const kOGHorizontalPortalTextureName = @"PortalHorizontal";
NSString *const kOGVerticalPortalTextureName = @"PortalVertical";
NSString *const kOGStatusBarBackgroundTextureName = @"StatusBarBackground";
NSString *const kOGPauseButtonTextureName = @"PauseButton";
NSString *const kOGResumeButtonTextureName = @"ResumeButton";

CGFloat const kOGPlayerNodeInvulnerabilityRepeatCount = 3.0;
CGFloat const kOGPlayerNodeInvulnerabilityBlinkingTimeDuration = 0.5;

@implementation OGConstants

+ (CGPoint)randomPointInRect:(CGRect)rect
{
    CGFloat maxX = rect.size.width;
    CGFloat minX = rect.origin.x;
    CGFloat maxY = rect.size.height;
    CGFloat minY = rect.origin.y;
    
    CGFloat x = rand() / (CGFloat) RAND_MAX * (maxX - minX) + minX;
    CGFloat y = rand() / (CGFloat) RAND_MAX * (maxY - minY) + minY;
    
    return CGPointMake(x, y);
}

+ (CGVector)randomVectorWithLength:(CGFloat)length
{
    CGFloat angle = (rand() / (CGFloat) RAND_MAX) * 2 * M_PI;
    
    return CGVectorMake(length * cosf(angle), length * sinf(angle));
}

@end
