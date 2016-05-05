//
//  RGCStatusBarHUD.h
//  RGCStatusBarHUD
//
//  Created by rgc on 16/5/4.
//  Copyright © 2016年 CC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RGCStatusBarHUD : NSObject

/**
 *  显示普通信息
 *
 *  @param msg   文字
 *  @param image 图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image;

/**
 * 显示成功信息
 */
+ (void)showSuccess:(NSString *)msg;

/**
 * 显示失败信息
 */
+ (void)showError:(NSString *)msg;

/**
 * 显示正在处理信息
 */
+ (void)showLoading:(NSString *)msg;

/**
 * 隐藏
 */
+ (void)hide;

@end
