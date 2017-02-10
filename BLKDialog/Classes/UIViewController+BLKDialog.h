//
//  UIViewController+BLKDialog.h
//  Pods
//
//  Created by liu on 2016/12/27.
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (BLKDialog)

- (void)blk_showErrorMessage:(NSString *)message;

- (void)blk_showError:(NSError *)error;

- (void)blk_showAlertMessage:(NSString *)message completion:(void (^)())completion;

//wating
- (void)blk_showWatingWithMessage:(NSString *)message;

- (void)blk_dismissWating;

@end
