//
//  MeTableViewController.m
//  WeiChatDemo
//
//  Created by ARIST on 16/1/14.
//  Copyright © 2016年 ARIST. All rights reserved.
//

#import "MeTableViewController.h"

@interface MeTableViewController ()

@end

@implementation MeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.ivImage.clipsToBounds = YES;
    self.ivImage.layer.cornerRadius = 5;
    self.ivImage.image = [UIImage imageNamed:@"wechat_list_1"];

    self.tableView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    if (indexPath.section == 3) {
//        if (indexPath.row == 0) {
//            SettingsViewController *ctrl = [[SettingsViewController alloc] init];
//            ctrl.hidesBottomBarWhenPushed = YES;
//            [self.navigationController pushViewController:ctrl animated:YES];
//        }
//    }
    
}


@end
