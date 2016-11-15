//
//  OGDoorEntityState.m
//  Olvido
//
//  Created by Дмитрий Антипенко on 11/10/16.
//  Copyright © 2016 Дмитрий Антипенко. All rights reserved.
//

#import "OGDoorEntityState.h"
#import "OGDoorEntity.h"
#import "OGLockComponent.h"
#import "OGRenderComponent.h"

@implementation OGDoorEntityState

- (instancetype)initWithDoorEntity:(OGDoorEntity *)entity
{
    self = [self init];
    
    if (self)
    {
        _doorEntity = entity;
    }
    
    return self;
}

- (OGLockComponent *)lockComponent
{
    if (!_lockComponent)
    {
        _lockComponent = (OGLockComponent *) [self.doorEntity componentForClass:OGLockComponent.self];
    }
    
    return _lockComponent;
}

- (OGRenderComponent *)renderComponent
{
    if (!_renderComponent)
    {
        _renderComponent = (OGRenderComponent *) [self.doorEntity componentForClass:OGRenderComponent.self];
    }
    
    return _renderComponent;
}

@end
