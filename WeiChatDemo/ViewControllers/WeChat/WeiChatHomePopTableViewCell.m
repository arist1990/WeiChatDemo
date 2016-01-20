//
//  WeiChatHomeTableViewCell.m
//  WeiChatDemo
//
//  Created by ARIST on 16/1/11.
//  Copyright © 2016年 ARIST. All rights reserved.
//

#import "WeiChatHomePopTableViewCell.h"

@implementation WeiChatHomePopTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.viewSep == nil && self.index != 3) {
        self.viewSep = [UIView new];
        self.viewSep.backgroundColor = [[UIColor groupTableViewBackgroundColor] colorWithAlphaComponent:.1];
        [self.contentView addSubview:self.viewSep];
    }
    
    self.viewSep.frame = CGRectMake(10, self.height-.5, self.width-20, .5);
    
    self.textLabel.text = @[@"发起群聊", @"添加朋友", @"扫一扫", @"收付款"][self.index];
    self.textLabel.textColor = [UIColor whiteColor];
    self.textLabel.font = [UIFont systemFontOfSize:15.0f];
    self.textLabel.frame = CGRectMake(42, 0, self.width-42, self.height);
    
    self.imageView.frame = CGRectMake(7, 7, 30, 30);
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.image = [UIImage imageNamed:@[@"contacts_add_newmessage", @"contacts_add_friend", @"contacts_add_scan", @"receipt_payment_icon"][self.index]];
    
}

@end
