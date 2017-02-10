//
//  BLKViewController.m
//  BLKDialog
//
//  Created by LiuHangqi on 12/27/2016.
//  Copyright (c) 2016 LiuHangqi. All rights reserved.
//

#import "BLKViewController.h"
#import <BLKDialog/UIViewController+BLKDialog.h>

@interface BLKViewController ()

@end

@implementation BLKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"首页";
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:57/255.0 green:58/255.0 blue:67/255.0 alpha:1];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)onFaild:(id)sender {
    
    [self blk_showErrorMessage:@"网络故障，请检查网络"];
}

- (IBAction)showMessage:(id)sender {
    
    [self blk_showAlertMessage:@"操作成功" completion:^{
        NSLog(@"complete");
    }];
}

- (IBAction)showWating:(id)sender {
    
    [self blk_showWatingWithMessage:@"正在执行"];
    __weak typeof(self) _weak_self = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        __strong typeof(self) _strong_self = _weak_self;
        [_strong_self blk_dismissWating];
        [_strong_self blk_showAlertMessage:@"执行完成" completion:^{
            NSLog(@"complete");
        }];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
