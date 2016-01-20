//
//  MeUserInfoTableViewController.m
//  WeiChatDemo
//
//  Created by ARIST on 16/1/15.
//  Copyright © 2016年 ARIST. All rights reserved.
//

#import "MeUserInfoTableViewController.h"

@interface MeUserInfoTableViewController ()

@end

@implementation MeUserInfoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
    
    self.ivImage.clipsToBounds = YES;
    self.ivImage.layer.cornerRadius = 5;
    
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
