//
//  RGCStatusBarHUD.m
//  RGCStatusBarHUD
//
//  Created by rgc on 16/5/4.
//  Copyright © 2016年 CC. All rights reserved.
//

#import "RGCStatusBarHUD.h"

#define RGCMessageFont [UIFont systemFontOfSize:12]

/** 消息的停留时间 */
static CGFloat const RGCMessageDuration = 2.0;
/** 消息显示、隐藏的动画时间 */
static CGFloat const RGCAnimationDuration = 0.25;

@implementation RGCStatusBarHUD

/** 全局的窗口 */
static UIWindow *window_;
/** 定时器 */
static NSTimer *timer_;

+ (void)showWindow {
    // frame
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    // 显示窗口
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = frame;
    window_.backgroundColor = [UIColor blackColor];
    window_.hidden = NO;
    
    // 动画
    frame.origin.y = 0;
    [UIView animateWithDuration:RGCAnimationDuration animations:^{
        window_.frame = frame;
    }];
    
}

/**
 *  显示普通信息
 *
 *  @param msg   文字
 *  @param image 图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image {
    
    // 停止上一个定时器
    [timer_ invalidate];
    
    // 显示窗口
    [self showWindow];
    
    // 添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = RGCMessageFont;
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    // 定时器
    timer_ = [NSTimer scheduledTimerWithTimeInterval:RGCMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
    
}

/**
 * 显示成功信息
 */
+ (void)showSuccess:(NSString *)msg {
    [self showMessage:@"加载成功" image:[UIImage imageNamed:@"RGCStatusBarHUD.bundle/success"]];
}

/**
 * 显示失败信息
 */
+ (void)showError:(NSString *)msg {
    [self showMessage:@"加载失败" image:[UIImage imageNamed:@"RGCStatusBarHUD.bundle/error"]];
}

/**
 * 显示正在处理信息
 */
+ (void)showLoading:(NSString *)msg {
    
    // 停止上一个定时器
    [timer_ invalidate];
    timer_ = nil;
    
    // 显示窗口
    [self showWindow];
    
    // 添加label
    UILabel *label = [[UILabel alloc] init];
    label.font = RGCMessageFont;
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    [window_ addSubview:label];
    
    // 添加圆圈
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    
    // 设置loadingView的center
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : RGCMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];
}

/**
 * 隐藏
 */
+ (void)hide {
    [UIView animateWithDuration:RGCAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = - frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
}

@end
