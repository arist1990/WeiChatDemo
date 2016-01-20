//
//  PopWindowView.h
//  BigMouse
//
//  Created by ARIST on 15/11/6.
//  Copyright © 2015年 深圳市葵花子科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^PopWindowHideBlock)(NSDictionary *result);

@interface PopWindowView : UIView

@property (nonatomic) CGRect contentViewFrame;
@property (nonatomic) CGRect contentViewFrameMin;
@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, copy) PopWindowHideBlock block;

- (void)showWithContentView:(UIView *)contentView;

- (void)hide;

@end
