//
//  DiscoveryTableViewController.m
//  WeiChatDemo
//
//  Created by ARIST on 16/1/14.
//  Copyright © 2016年 ARIST. All rights reserved.
//

#import "DiscoveryTableViewController.h"

@interface DiscoveryTableViewController ()

@end

@implementation DiscoveryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        [self performSegueWithIdentifier:@"PushToScan" sender:nil];
    }
    
}


@end
