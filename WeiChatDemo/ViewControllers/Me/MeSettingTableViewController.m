//
//  MeSettingTableViewController.m
//  WeiChatDemo
//
//  Created by ARIST on 16/1/15.
//  Copyright © 2016年 ARIST. All rights reserved.
//

#import "MeSettingTableViewController.h"

@interface MeSettingTableViewController ()

@end

@implementation MeSettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
