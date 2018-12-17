//
//  RNInterractModule.m
//  RNTest
//
//  Created by X on 2018/12/15.
//  Copyright © 2018 X. All rights reserved.
//

#import "RNInterractModule.h"
#import "Util.h"
#import <SVProgressHUD.h>

@implementation RNInterractModule
////RCT_EXPORT_MODULE接受字符串作为其Module的名称，如果不设置名称的话默认就使用类名作为Modul的名称
RCT_EXPORT_MODULE();

//==============1、提示==============
RCT_EXPORT_METHOD(showInfo:(NSString *) info){
    dispatch_sync(dispatch_get_main_queue(), ^{
        [SVProgressHUD showInfoWithStatus:info];
    });
}

//==============2、RN回到原生页面==============
RCT_EXPORT_METHOD(popToNative){
    dispatch_sync(dispatch_get_main_queue(), ^{
        [Util popViewControllerAnimated:YES];
    });
}
//==============3、RN页面push Native页面==============
RCT_EXPORT_METHOD(pushNative:(NSString *) vcName){
    if([vcName isEqualToString:@"RNEmitter"]){
        vcName = @"RNEmitterViewController";
    }
    dispatch_sync(dispatch_get_main_queue(), ^{
        Class class = NSClassFromString(vcName);
        UIViewController *vc = [[class alloc] init];
        [Util pushToNextViewControllerWith:vc animated:YES];
    });
}

//导出常量

//注意这个常量仅仅在初始化的时候导出了一次，所以即使你在运行期间改变constantToExport返回的值，也不会影响到 JavaScript 环境下所得到的结果。
- (NSDictionary *)constantsToExport{
    return @{
             @"RNEmitter":@"RNEmitter",
             };
}

//主线程执行
+ (BOOL)requiresMainQueueSetup{
    return true;
}


//==============4、回调函数==============
//TODO（RN文档显示，目前iOS端的回调还处于实验阶段）
RCT_EXPORT_METHOD(patCake:(NSString *)flour successBlock:(RCTResponseSenderBlock)successBlock errorBlock:(RCTResponseErrorBlock)errorBlock){
    __weak __typeof(self)weakSelf = self;
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSString *cake = [weakSelf patCake:flour];
        //模拟成功、失败的block判断
        if([flour isKindOfClass:[NSString class]]){
            successBlock(@[@[cake]]);
        }else{
            NSError *error = [NSError errorWithDomain:@"com.RNTest" code:-1 userInfo:@{@"message":@"类型不匹配"}];
            errorBlock(error);
        }
    });
}

//使用RN端传递的参数字符串：""，调用Native端的做面包方法，加工成面包，再回传给RN
- (NSString *)patCake:(NSString *)flour{
    NSString * cake = [NSString stringWithFormat:@"使用%@，做好了：🎂🍞🍞🍰🍰🍰",flour];
    return cake;
}

//==============5、Promise==============
RCT_EXPORT_METHOD(callNameTointroduction:(NSString *)name resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock) reject){
    __weak __typeof(self)weakSelf = self;
    dispatch_sync(dispatch_get_main_queue(), ^{
        if ([name isKindOfClass:NSString.class]) {
            resolve([weakSelf introduction:name]);
        }else{
            NSError *error = [NSError errorWithDomain:@"com.RNTest" code:-1 userInfo:@{@"message":@"类型不匹配"}];
            reject(@"class_error",@"Needs NSString Class",error);
        }
    });
}

- (NSString *)introduction:(NSString *)name{
    return [NSString stringWithFormat:@"我的名字叫%@，今年18岁，喜欢运动、听歌...",name];
}

@end
