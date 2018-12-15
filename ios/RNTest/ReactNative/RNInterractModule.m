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

//提示
RCT_EXPORT_METHOD(showInfo:(NSString *) info){
    dispatch_sync(dispatch_get_main_queue(), ^{
        [SVProgressHUD showInfoWithStatus:info];
    });
}

//RN回到原生页面
RCT_EXPORT_METHOD(popToNative){
    dispatch_sync(dispatch_get_main_queue(), ^{
        [Util popViewControllerAnimated:YES];
    });
}
//RN页面push Native页面
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
@end
