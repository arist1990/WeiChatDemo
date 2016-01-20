//
//  WeChatAddFriendViewController.m
//  WeiChatDemo
//
//  Created by ARIST on 16/1/13.
//  Copyright © 2016年 ARIST. All rights reserved.
//

#import "WeChatAddFriendViewController.h"
#import "WeChatUserInfoViewController.h"

@interface WeChatAddFriendViewController ()

@end

@implementation WeChatAddFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
}


@end


@implementation WeChatAddFriendTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.viewHeader = [[[NSBundle mainBundle] loadNibNamed:@"WeChatAddFriendTableHeaderView" owner:self options:nil] lastObject];
    self.tfInput.tintColor = kColorStyle;
    self.tableView.tableHeaderView = self.viewHeader;
}

- (IBAction)btnActionQRCode:(id)sender {
    
    WeChatUserInfoViewController *controller = [[WeChatUserInfoViewController alloc] init];
    controller.isPrensented = YES;
    controller.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        controller.providesPresentationContextTransitionStyle = YES;
        controller.definesPresentationContext = YES;
        controller.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        [self.tabBarController presentViewController:controller animated:YES completion:nil];
        
    } else {
        self.view.window.rootViewController.modalPresentationStyle = UIModalPresentationCurrentContext;
        [self presentViewController:controller animated:NO completion:nil];
        self.view.window.rootViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    }
    
}

#pragma mark - UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"AddFriendPresentToUserInfo"]) {
        WeChatUserInfoViewController *controller = (WeChatUserInfoViewController *)segue.destinationViewController;
        controller.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
            controller.providesPresentationContextTransitionStyle = YES;
            controller.definesPresentationContext = YES;
            controller.modalPresentationStyle = UIModalPresentationOverCurrentContext;
            [self.tabBarController presentViewController:controller animated:YES completion:nil];
            
        } else {
            self.view.window.rootViewController.modalPresentationStyle = UIModalPresentationCurrentContext;
            [self presentViewController:controller animated:NO completion:nil];
            self.view.window.rootViewController.modalPresentationStyle = UIModalPresentationFullScreen;
        }
    }
    
}



@end
