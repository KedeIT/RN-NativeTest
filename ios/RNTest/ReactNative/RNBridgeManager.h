//
//  RNBridgeManager.h
//  RNTest
//
//  Created by X on 2018/12/15.
//  Copyright © 2018 X. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridge.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNBridgeManager : RCTBridge
/**
 RNBridgeManager单例
 */
+ (instancetype)sharedManager;

@end

NS_ASSUME_NONNULL_END
