//
//  RNEmitterViewController.m
//  RNTest
//
//  Created by X on 2018/12/15.
//  Copyright © 2018 X. All rights reserved.
//

#import "RNEmitterViewController.h"

@interface RNEmitterViewController ()

@end

@implementation RNEmitterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"Emitter";
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"发送通知：登录成功" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:20];
    [button setTitleColor:UIColor.brownColor forState:UIControlStateNormal];
    button.frame = CGRectMake((size.width-200)/2, 200, 200, 30);
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(postNotification) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)postNotification{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"kRNNotification_Login" object:nil userInfo:@{@"message":@"登录成功"}];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

@end
