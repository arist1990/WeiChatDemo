//
//  ContentWeiXinPayView.h
//  LocalExpress
//
//  Created by ARIST on 15/11/20.
//  Copyright © 2015年 com.yogapay.tongchengkuaidi. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef void(^WeChatHomeSelectCompleteBlock)(NSNumber *number);

@interface WeChatHomeSelectView : UIView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, copy) WeChatHomeSelectCompleteBlock block;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UITableView *tableView;

@end
