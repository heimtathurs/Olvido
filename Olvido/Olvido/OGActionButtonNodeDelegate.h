//
//  OGShootingButtonNodeDelegate.h
//  Olvido
//
//  Created by Дмитрий Антипенко on 11/12/16.
//  Copyright © 2016 Дмитрий Антипенко. All rights reserved.
//

@protocol OGActionButtonNodeDelegate <NSObject>

- (void)actionButtonNode:(SKSpriteNode *)node isPressed:(BOOL)pressed;

@end
