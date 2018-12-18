//
//  RNNotificationManager.h
//  BaiShop
//
//  Created by X on 2018/12/11.
//  Copyright © 2018 JK. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <React/RCTEventEmitter.h>
#import <React/RCTBridgeModule.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNNotificationManager : RCTEventEmitter

+ (instancetype)sharedManager;

@end

NS_ASSUME_NONNULL_END
