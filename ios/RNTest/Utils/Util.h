//
//  Util.h
//  RNTest
//
//  Created by X on 2018/12/15.
//  Copyright © 2018 X. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Util : NSObject
+ (void)pushToNextViewControllerWith:(UIViewController *)viewController animated:(BOOL)animated;
+ (void)popViewControllerAnimated:(BOOL)animated;
+ (void)popToViewController:(UIViewController *_Nonnull)viewController Animated:(BOOL)animated;
+ (UIViewController *)getCurrentViewController;
@end

NS_ASSUME_NONNULL_END
