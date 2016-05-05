//
//  ViewController.m
//  RGCStatusBarHUDDemo
//
//  Created by rgc on 16/5/5.
//  Copyright © 2016年 CC. All rights reserved.
//

#import "ViewController.h"
#import "RGCStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [RGCStatusBarHUD showSuccess:@"加载成功"];
}

- (IBAction)success:(id)sender {
    [RGCStatusBarHUD showSuccess:@"加载成功"];
}

- (IBAction)error:(id)sender {
    [RGCStatusBarHUD showError:@"加载失败"];
}

- (IBAction)loading:(id)sender {
    [RGCStatusBarHUD showLoading:@"加载中..."];
}

- (IBAction)hide:(id)sender {
    [RGCStatusBarHUD hide];
}

- (IBAction)message:(id)sender {
    [RGCStatusBarHUD showMessage:@"哈哈哈" image:nil];
}

@end
