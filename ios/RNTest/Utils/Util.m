//
//  Util.m
//  RNTest
//
//  Created by X on 2018/12/15.
//  Copyright © 2018 X. All rights reserved.
//

#import "Util.h"

@implementation Util
//MARK: - 事件跳转
+ (void)pushToNextViewControllerWith:(UIViewController *)viewController animated:(BOOL)animated
{
    if([[[UIApplication sharedApplication].delegate window].rootViewController isKindOfClass:[UINavigationController class]])
    {
        UINavigationController *navi = (UINavigationController *)[[UIApplication sharedApplication].delegate window].rootViewController;
        viewController.hidesBottomBarWhenPushed = YES;
        [navi pushViewController:viewController animated:animated];
    }
}
+ (void)popViewControllerAnimated:(BOOL)animated
{
    UINavigationController *navi = (UINavigationController *)[[UIApplication sharedApplication].delegate window].rootViewController;
    [navi popViewControllerAnimated:animated];
}
+ (void)popToViewController:(UIViewController *_Nonnull)viewController Animated:(BOOL)animated
{
    UINavigationController *navi = (UINavigationController *)[[UIApplication sharedApplication].delegate window].rootViewController;
    for (UIViewController *tmpVc in navi.viewControllers) {
        if ([tmpVc isKindOfClass:[viewController class]]) {
            [navi popToViewController:tmpVc animated:YES];
        }
    }
}
+ (UIViewController *)getCurrentViewController{
    if([[[UIApplication sharedApplication].delegate window].rootViewController isKindOfClass:UINavigationController.class])
    {
        UINavigationController *navi = (UINavigationController *)[[UIApplication sharedApplication].delegate window].rootViewController;
        return  navi.topViewController;
    }
    return nil;
}
@end

