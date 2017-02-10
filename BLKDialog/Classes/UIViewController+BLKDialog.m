//
//  UIViewController+BLKDialog.m
//  Pods
//
//  Created by liu on 2016/12/27.
//
//

#import "UIViewController+BLKDialog.h"
#import "BLKStatusBar.h"
#import <objc/runtime.h>
#import "MBProgressHUD.h"

@interface UIViewController ()

@property (nonatomic, strong) MBProgressHUD *hud;

@end

@implementation UIViewController (BLKDialog)

- (MBProgressHUD *)hud {
    
    return (MBProgressHUD *)objc_getAssociatedObject(self, @selector(hud));
}

- (void)setHud:(MBProgressHUD *)hud {
    
    objc_setAssociatedObject(self, @selector(hud), hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)blk_showErrorMessage:(NSString *)message {
   
    [[BLKStatusBar sharedInstance]showErrorMessage:message];
}

- (void)blk_showError:(NSError *)error {
    
    [[BLKStatusBar sharedInstance]showErrorMessage:error.localizedDescription];
}

- (void)blk_showAlertMessage:(NSString *)message completion:(void (^)())completion {
    
    if (self.hud) {
        
        return;
    }
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hud.mode = MBProgressHUDModeText;
    self.hud.label.text = message;
    self.hud.removeFromSuperViewOnHide = YES;
    __weak typeof(self) _weak_self = self;
    self.hud.completionBlock = ^(){
    
        __strong typeof(self) _strong_self = _weak_self;
        if (completion) {
            
            completion();
        }
        _strong_self.hud = nil;
    };
    [self.hud showAnimated:YES];
    [self.hud hideAnimated:YES afterDelay:2.5];
    
}

- (void)blk_showWatingWithMessage:(NSString *)message {
    
    if (self.hud) {
        
        return;
    }
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hud.label.text = message;
    self.hud.removeFromSuperViewOnHide = YES;
    [self.hud showAnimated:YES];
}

- (void)blk_dismissWating {
    
    if (!self.hud) {
        
        return;
    }
    [self.hud hideAnimated:YES];
    self.hud = nil; 
}

@end
