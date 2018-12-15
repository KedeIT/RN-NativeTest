//
//  RNBridgeManager.m
//  RNTest
//
//  Created by X on 2018/12/15.
//  Copyright © 2018 X. All rights reserved.
//

#import "RNBridgeManager.h"

#import <React/RCTBundleURLProvider.h>

//dev模式下:RCTBridge required dispatch_sync to load RCTDevLoadingView Error Fix
#if RCT_DEV
#import <React/RCTDevLoadingView.h>
#endif
/**
 自定义类，实现RCTBridgeDelegate
 */
@interface BridgeHandle : NSObject<RCTBridgeDelegate>

@end

@implementation BridgeHandle

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge{
    return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
}
@end


@implementation RNBridgeManager

+ (instancetype)sharedManager{
    static RNBridgeManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[RNBridgeManager alloc] initWithDelegate:[[BridgeHandle alloc] init] launchOptions:nil];
#if RCT_DEV
        [manager moduleForClass:[RCTDevLoadingView class]];
#endif
    });
     return manager;
}


@end
