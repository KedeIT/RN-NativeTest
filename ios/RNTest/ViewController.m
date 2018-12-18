//
//  ViewController.m
//  RNTest
//
//  Created by X on 2018/12/14.
//  Copyright © 2018 X. All rights reserved.
//

#import "ViewController.h"
#import <React/RCTRootView.h>
#import <React/RCTBundleURLProvider.h>
#import "RNBridgeManager.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *rnButton;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}


- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = UIColor.whiteColor;
    
}

- (IBAction)goToRNViewController:(id)sender {
//    NSURL *jsBundlePath = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
//    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsBundlePath moduleName:@"RNTest" initialProperties:nil launchOptions:nil];
    
    //获取textField中的文字
    NSDictionary *params = nil;
    
    if ([self.textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length > 0){
        params = @{@"msg":[NSString stringWithFormat:@"iOS端传递数据：%@",self.textField.text]};
    }else{
        params = @{@"msg":@"我是iOS端传递过来的数据"};
    }
    
    RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:[RNBridgeManager sharedManager] moduleName:@"RNTest" initialProperties:params];
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view = rootView;
    [self.navigationController pushViewController:vc animated:YES];
}


@end
