//
//  RNNotificationManager.m
//  BaiShop
//
//  Created by X on 2018/12/11.
//  Copyright © 2018 JK. All rights reserved.
//

#import "RNNotificationManager.h"


#ifdef DEBUG
#define NSLog(format, ...) printf("[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define NSLog(format, ...)
#endif


@implementation RNNotificationManager
{
    BOOL hasListeners;
}


+ (instancetype)sharedManager{
    static RNNotificationManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        manager = [[self alloc] init];
    });
    return manager;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        [center removeObserver:self];
        [center addObserver:self selector:@selector(handleEventNotification:) name:@"kRNNotification_Login" object:nil];
        [center addObserver:self selector:@selector(handleEventNotification:) name:@"kRNNotification_Logout" object:nil];
    };
    return self;
}


RCT_EXPORT_MODULE()

- (NSArray<NSString *> *)supportedEvents{
    return @[
             @"kRNNotification_Login",
             @"kRNNotification_Logout"
             ];
}
//优化无监听处理的事件
//在添加第一个监听函数时触发
- (void)startObserving{
    //setup any upstream listenerse or background tasks as necessary
    hasListeners = YES;
    NSLog(@"----------->startObserving");
}

//will be called when this mdules's last listener is removed,or on dealloc.
- (void)stopObserving{
    //remove upstream listeners,stop unnecessary background tasks.
    hasListeners = NO;
    NSLog(@"----------->stopObserving");
}

+ (BOOL)requiresMainQueueSetup{
    return YES;
}

- (void)handleEventNotification:(NSNotification *)notification{
    if (!hasListeners) {
        return;
    }
    
    NSString *name = notification.name;
    NSLog(@"通知名字-------->%@",name);
    [self sendEventWithName:name body:notification.userInfo];
    
}



@end
