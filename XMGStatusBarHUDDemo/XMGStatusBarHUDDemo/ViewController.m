//
//  ViewController.m
//  XMGStatusBarHUD
//
//  Created by xiaomage on 15/9/21.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "ViewController.h"
#import "XMGStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    // 很牛逼的框架
}
- (IBAction)success {
    [XMGStatusBarHUD showSuccess:@"加载数据成功！"];
}

- (IBAction)error {
    [XMGStatusBarHUD showError:@"登录失败！"];
}

- (IBAction)loading {
    [XMGStatusBarHUD showLoading:@"正在登录中..."];
}

- (IBAction)hide {
    [XMGStatusBarHUD hide];
}

- (IBAction)normal {
    [XMGStatusBarHUD showText:@"随便显示的文字！！！！"];
}





@end
