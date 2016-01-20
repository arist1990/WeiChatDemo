//
//  WeiChatHomeTableViewCell.h
//  WeiChatDemo
//
//  Created by ARIST on 16/1/11.
//  Copyright © 2016年 ARIST. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeChatHomeTableCellGestureView.h"

@interface WeiChatHomeTableViewCell : UITableViewCell
{
    NSDictionary *_data;
}

- (void)configView:(NSDictionary *)dic;
@property (nonatomic, strong) WeChatHomeTableCellGestureView *viewGesture;
@property (nonatomic, strong) UIImageView *ivImage;
@property (nonatomic, strong) UILabel *viewDot;  // 小红点
//@property (nonatomic, strong) UIPanGestureRecognizer *pan;
@property (strong, nonatomic) UILabel *labelTime;
@property (strong, nonatomic) UILabel *labelText;
@property (strong, nonatomic) UILabel *labelDetail;
//@property (nonatomic, strong) UIView *viewSep;


@end
