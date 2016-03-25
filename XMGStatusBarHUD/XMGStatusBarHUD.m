//
//  XMGStatusBarHUD.m
//  XMGStatusBarHUD
//
//  Created by xiaomage on 15/9/21.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "XMGStatusBarHUD.h"

@implementation XMGStatusBarHUD

static UIWindow *window_;
static NSTimer *timer_;
/** HUD控件的高度 */
static CGFloat const XMGWindowH = 20;
/** HUD控件的动画持续时间（出现\隐藏） */
static CGFloat const XMGAnimationDuration = 0.25;
/** HUD控件默认会停留多长时间 */
static CGFloat const XMGHUDStayDuration = 1.5;


+(void)BIGMAGE{
}

+ (void)showImage:(UIImage *)image text:(NSString *)text
{
    // 停止之前的定时器是不是
    [timer_ invalidate];
    
    // 创建窗口
    window_.hidden = YES; // 先隐藏之前的window
    window_ = [[UIWindow alloc] init];
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = CGRectMake(0, - XMGWindowH, [UIScreen mainScreen].bounds.size.width, XMGWindowH);
    window_.hidden = NO;
    
    // 添加按钮
    UIButton *button = [[UIButton alloc] init];
    button.frame = window_.bounds;
    // 文字
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    // 图片
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
        button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    }
    [window_ addSubview:button];
    
    // 动画
    [UIView animateWithDuration:XMGAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = 0;
        window_.frame = frame;
    }];
    
    // 开启一个新的定时器
    timer_ = [NSTimer scheduledTimerWithTimeInterval:XMGHUDStayDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

+ (void)showImageName:(NSString *)imageName text:(NSString *)text
{
    [self showImage:[UIImage imageNamed:imageName] text:text];
}

+ (void)showSuccess:(NSString *)text
{
    [self showImageName:@"XMGStatusBarHUD.bundle/success" text:text];
}

+ (void)showError:(NSString *)text
{
    [self showImageName:@"XMGStatusBarHUD.bundle/error" text:text];
}

+ (void)showText:(NSString *)text
{
    [self showImage:nil text:text];
}

+ (void)showLoading:(NSString *)text
{
    // 停止之前的定时器
    [timer_ invalidate];
    timer_ = nil;
    
    // 创建窗口
    window_.hidden = YES; // 先隐藏之前的window
    window_ = [[UIWindow alloc] init];
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = CGRectMake(0, - XMGWindowH, [UIScreen mainScreen].bounds.size.width, XMGWindowH);
    window_.hidden = NO;
    
    // 添加按钮
    UIButton *button = [[UIButton alloc] init];
    button.frame = window_.bounds;
    // 文字
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [window_ addSubview:button];
    
    // 圈圈
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    loadingView.center = CGPointMake(button.titleLabel.frame.origin.x - 60, XMGWindowH * 0.5);
    [window_ addSubview:loadingView];
    
    // 动画
    [UIView animateWithDuration:XMGAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = 0;
        window_.frame = frame;
    }];
}

+(void)showXXX{

}

+ (void)hide
{
    // 清空定时器
    [timer_ invalidate];
    timer_ = nil;
    
    // 退出动画
    [UIView animateWithDuration:XMGAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y =  - XMGWindowH;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
    }];
}
@end
