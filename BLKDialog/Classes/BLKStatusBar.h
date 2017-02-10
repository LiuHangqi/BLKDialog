//
//  BLKStatusBar.h
//  Pods
//
//  Created by liu on 2016/12/27.
//
//

#import <UIKit/UIKit.h>

@interface BLKStatusBar : UIView

+ (instancetype)sharedInstance;

- (void)showMessage:(NSString *)message barColor:(UIColor *)barColor textColor:(UIColor *)textColor;

- (void)showErrorMessage:(NSString *)message;

- (void)dismiss;

@end
