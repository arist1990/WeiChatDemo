//
//  FirstViewController.h
//  WeiChatDemo
//
//  Created by ARIST on 16/1/11.
//  Copyright © 2016年 ARIST. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopWindowView.h"
#import "WeChatHomeSelectView.h"

@interface WeiChatHomeViewController : BaseViewController<UIAlertViewDelegate, UITableViewDataSource, UITableViewDelegate> {
    PopWindowView *_popWindowView;
    WeChatHomeSelectView *_wechatHomeSelectView;
}

@property (nonatomic, strong) NSMutableArray *data;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


- (IBAction)pushAction:(id)sender;


@end

