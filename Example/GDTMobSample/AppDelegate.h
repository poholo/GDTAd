//
//  AppDelegate.h
//  GDTMobApp
//
//  Created by GaoChao on 13-12-2.
//  Copyright (c) 2013年 Tencent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "GDTSplashAd.h"

static NSString *kGDTMobSDKAppId = @"1105344611";

@interface AppDelegate : UIResponder <UIApplicationDelegate,GDTSplashAdDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) GDTSplashAd *splash;

@end
