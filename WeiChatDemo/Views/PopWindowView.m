//
//  PopWindowView.m
//  BigMouse
//
//  Created by ARIST on 15/11/6.
//  Copyright © 2015年 深圳市葵花子科技有限公司. All rights reserved.
//

#import "PopWindowView.h"

@implementation PopWindowView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = [UIScreen mainScreen].bounds;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = [UIScreen mainScreen].bounds;
    }
    return self;
}

- (void)showWithContentView:(UIView *)contentView{
    _contentViewFrame = contentView.frame;
//    _contentViewFrameMin = CGRectMake(contentView.right, contentView.top, 0, 0);
    _contentViewFrameMin = CGRectMake(contentView.left, contentView.top, 0, 0);
    self.contentView = contentView;
    
    [self addSubview:contentView];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    contentView.frame = _contentViewFrameMin;
    
//    NSLog(@"_contentViewFrame:%@", NSStringFromCGRect(_contentViewFrame));
//    NSLog(@"_contentViewFrameMin:%@", NSStringFromCGRect(_contentViewFrameMin));
    
    [UIView animateWithDuration:.3 animations:^{
        self.alpha = 1;
        contentView.frame = _contentViewFrame;
    } completion:^(BOOL finished) {
//        [self addSubview:contentView];
    }];
    
}

- (void)hide{
//    for (UIView *view in self.subviews) {
//        [view removeFromSuperview];
//    }
//    [self removeFromSuperview];
    
    [UIView animateWithDuration:.3 animations:^{
        _contentView.frame = _contentViewFrameMin;
        self.alpha = 0;
    } completion:^(BOOL finished) {
        _contentView.frame = _contentViewFrame;
        for (UIView *view in self.subviews) {
            [view removeFromSuperview];
        }
        [self removeFromSuperview];
    }];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches allObjects][0];
    CGPoint point = [touch locationInView:self];
    if (!CGRectContainsPoint(self.contentViewFrame, point)) {
        if (self.block) {
            self.block(nil);
        }
        [self hide];
    }
}

@end
