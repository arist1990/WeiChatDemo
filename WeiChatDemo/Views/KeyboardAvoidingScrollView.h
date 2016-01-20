//
//  KeyboardAvoidingScrollView.h
//
//  Created by Michael Tyson on 11/04/2011.
//  Copyright 2011 A Tasty Pixel. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface KeyboardAvoidingScrollView : UIScrollView {
@private
    UIEdgeInsets    _priorInset;
    BOOL            _priorInsetSaved;
    BOOL            _keyboardVisible;
    CGRect          _keyboardRect;
    CGSize          _originalContentSize;
}

// 设置是否需要点击任意地方 收起键盘 默认YES
@property (nonatomic, assign) BOOL isTapAnyHideKeyboard;
// 调整位置
- (void)adjustOffsetToIdealIfNeeded;

- (UIView *)findFirstResponderBeneathView:(UIView *)view;
- (UIEdgeInsets)contentInsetForKeyboard;
- (CGFloat)idealOffsetForView:(UIView *)view withSpace:(CGFloat)space;
- (CGRect)keyboardRect;

@end
