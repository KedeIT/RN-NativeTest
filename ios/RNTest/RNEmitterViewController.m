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
