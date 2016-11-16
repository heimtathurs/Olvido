//
//  GameViewController.m
//  Olvido
//
//  Created by Дмитрий Антипенко on 9/27/16.
//  Copyright (c) 2016 Дмитрий Антипенко. All rights reserved.
//

#import "OGGameViewController.h"
#import "OGMainMenuScene.h"
#import "OGConstants.h"
#import "OGLevelManager.h"
#import "OGSceneManager.h"
#import "OGGameScene.h"
#import "OGMenuManager.h"

@interface OGGameViewController ()

@property (nonatomic, strong) OGSceneManager *sceneManager;

@end

@implementation OGGameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    SKView *view = (SKView *) self.view;
    
    view.multipleTouchEnabled = YES;
    
    /* DEBUG OPTIONS */
    view.showsFPS = YES;
    view.showsNodeCount = YES;
    view.showsPhysics = YES;
    view.showsFields = YES;
    
    self.sceneManager = [OGSceneManager sceneManagerWithView:view];
    [self.sceneManager transitionToInitialScene];
    
    OGLevelManager *levelManager = [OGLevelManager sharedInstance];
    levelManager.sceneManager = self.sceneManager;
    
    OGMenuManager *menuManager = [OGMenuManager sharedInstance];
    menuManager.sceneManager = self.sceneManager;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    }
    else
    {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
