//
//  MeSettingLangueTableViewController.h
//  WeiChatDemo
//
//  Created by ARIST on 16/1/16.
//  Copyright © 2016年 ARIST. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeSettingLangueTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *data;

@property (nonatomic) NSInteger selectedCode;   // 选中语言的编码


- (IBAction)leftEvent:(id)sender;
- (IBAction)rightEvent:(id)sender;



@end
