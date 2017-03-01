//
//  BLKStatusBar.m
//  Pods
//
//  Created by liu on 2016/12/27.
//
//

#import "BLKStatusBar.h"

static CGFloat const barHeight = 64;

@interface BLKStatusBar ()

@property (nonatomic, strong) UIWindow *overlayWindow;
@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, assign) BOOL isShowing;

@end

@implementation BLKStatusBar


+ (instancetype)sharedInstance {
    
    static BLKStatusBar *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        shared = [[BLKStatusBar alloc]init];    
    });
    return shared;
}

- (instancetype)init {
    
    return [self initWithFrame:CGRectZero];
}
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:CGRectMake(0, -barHeight, self.overlayWindow.bounds.size.width, barHeight)]) {
        
        self.userInteractionEnabled = NO;
        [self addSubview:self.messageLabel];
    }
    
    return self;
}

- (void)showErrorMessage:(NSString *)message {
   
    if (self.isShowing) {
        
        return;
    }
    [self showMessage:message barColor:[UIColor colorWithRed:208/225.0 green:2/225.0 blue:27/225.0 alpha:1] textColor:[UIColor whiteColor]];
    [self dismissDelay];
}

- (void)showMessage:(NSString *)message barColor:(UIColor *)barColor textColor:(UIColor *)textColor {
    
    self.messageLabel.text = message;
    self.backgroundColor = barColor;
    self.messageLabel.textColor = textColor;
    self.isShowing = YES;
    if (self.superview) {
        
        return;
    }
    [self.overlayWindow addSubview:self];
    [self.overlayWindow addSubview:self];
    [self.overlayWindow setHidden:NO];
    [UIView animateWithDuration:0.2 animations:^{
        
        self.frame = CGRectMake(0, 0, self.overlayWindow.bounds.size.width, barHeight);
    }];
}

- (void)dismissDelay {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self dismiss];
    });
}

- (void)dismiss {
    
    [UIView animateWithDuration:0.2 animations:^{
        
        self.frame = CGRectMake(0, -barHeight, self.overlayWindow.bounds.size.width, barHeight);
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        [self.overlayWindow removeFromSuperview];
        _overlayWindow = nil;
        self.isShowing = NO;
    }];
}

- (UIWindow *)overlayWindow {
    
    if (!_overlayWindow) {
        
        _overlayWindow = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//        _overlayWindow.windowLevel = UIWindowLevelStatusBar;
        _overlayWindow.userInteractionEnabled = NO;
        _overlayWindow.backgroundColor = [UIColor clearColor];
        _overlayWindow.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    
    return _overlayWindow;
}

- (UILabel *)messageLabel {
    
    if (!_messageLabel) {
        
        CGRect frame = CGRectMake(0, 20, self.bounds.size.width, self.bounds.size.height-20);
        _messageLabel = [[UILabel alloc]initWithFrame:frame];
        _messageLabel.font = [UIFont systemFontOfSize:14];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _messageLabel;
}


@end
