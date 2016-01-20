//
//  WeChatHomeTableCellGestureView.m
//  WeiChatDemo
//
//  Created by ARIST on 16/1/12.
//  Copyright © 2016年 ARIST. All rights reserved.
//

#import "WeChatHomeTableCellGestureView.h"

@implementation WeChatHomeTableCellGestureView

//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
//    
//    if ([gestureRecognizer isMemberOfClass:[UIPanGestureRecognizer class]]) {
//        UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)gestureRecognizer;
//        
//        CGPoint point = [pan velocityInView:self];
////        CGPoint point = [pan translationInView:self];
//        NSLog(@"%@", NSStringFromCGPoint(point));
//        if (ABS(point.y) > 20) {
//            NSLog(@"gestureRecognizerShouldBegin NO");
//            return NO;
//        }
//    }
//    NSLog(@"gestureRecognizerShouldBegin YES");
//    return YES;
//}

//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
//    
//    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
//        CGPoint translation = [(UIPanGestureRecognizer *)gestureRecognizer translationInView:self];
//        if (translation.x > 0) {
//            return NO;
//        }
//        return fabs(translation.x) > fabs(translation.y);
//    }
//    return YES;
//}

@end
